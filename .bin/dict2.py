#!/usr/bin/env python
#coding:utf-8

import urllib
import json
import sys
import re


_dict = {
	'qq':'http://dict.qq.com/dict?q=',
	'iciba':'http://dict-co.iciba.com/api/dictionary.php?w='
}

#_default_dict = 'qq'
_default_dict = 'iciba'

class Dict:
	def __init__(self,word):
		word = ' '.join(word)
		self.word = urllib.quote(word)


		self.url  = _dict[_default_dict] + self.word
		#print self.url
		if _default_dict == 'qq':
			handler   = urllib.urlopen(self.url)
			self.js   = json.load(handler)

		elif _default_dict == 'iciba':
			self.htmls = urllib.urlopen(self.url).read()

	def trans(self):
		if _default_dict == 'qq':
			try:
				if self.js["err"] == "sorry, no result":
					return 0
			except:
				pass

			self.des = self.js['local'][0]['des']

		elif _default_dict == 'iciba':
			parse = []
			parse.append(re.compile(r'<pos>(.*?)</pos>',re.DOTALL).findall(self.htmls))
			parse.append(re.compile(r'<acceptation>(.*?)</acceptation>',re.DOTALL).findall(self.htmls))
			parse.append(re.compile(r'<orig>(.*?)</orig>',re.DOTALL).findall(self.htmls))
			parse.append(re.compile(r'<trans>(.*?)</trans>',re.DOTALL).findall(self.htmls))

			self.lst = []
			for i in parse:
				if i:
					self.lst.append(i)


	def print_trans(self):
		if _default_dict == 'qq':
			for des in self.des:
				print des['d']

		elif _default_dict == 'iciba':
			lens  = len(self.lst)

			if lens == 0:
				print 'cannot find this word!'

			elif lens == 1:
				for i in self.lst[0]:
					print i
					print

			elif lens == 2:
				for i,j in zip(self.lst[0],self.lst[1]):
					print i,j
					print

			elif lens == 3:
				for i,j,k in zip(self.lst[0],self.lst[1],self.lst[3]):
					print i,j,k
					print

			elif lens == 4:
				for i,j,k,l in zip(self.lst[0],self.lst[1],self.lst[2],self.lst[3]):
					print i,j,k,l
					print



def main(args = sys.argv):
	trans = Dict(args[1:])
	trans.trans()
	trans.print_trans()

if __name__ == '__main__':
	main()
