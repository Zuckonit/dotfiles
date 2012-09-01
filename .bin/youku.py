#!/usr/bin/env python
# -*- coding: utf-8 -*-
import re
import urllib
import sys
import os
from datetime import datetime
import socket
import pynotify

_default_timeout = 10
_default_savedir = os.path.expanduser('''~/视频/Youku/''')
socket.setdefaulttimeout(_default_timeout)


#notify infomations
_FAILED_INFO     = 'Download Failed -_-!'
_FAILED_TITLE    = 'Failed'
_COMPLETE_TITLE  = 'Mission Completed'
_DOWNLOADING_TITLE = 'Downloading'
_START_COMBINE_TITLE = 'Start combine'
_COMPLETE_COMBINE_TITLE = 'Combine Over'

class Youku:
    def __init__(self,url,savedir):
        self.url ='http://www.flvcd.com/parse.php?kw=' + urllib.quote(url)  + '&format=high'
        self.savedir = savedir

    def gethtmls(self):
        try:
            return urllib.urlopen(self.url).read()
        except:
            self.notify(_FAILED_TITLE,_FAILED_INFO)
            sys.exit(0)

    def geturl(self):
        htmls = self.gethtmls()
        self.movname = self.getmoviename(htmls)
        self.catelog = self.savedir + r'/' + self.movname


        parse = re.compile(r'<BR><a href="(.*?)"')

        try:
            self.urls = parse.findall(htmls)
            #print self.urls
            if not os.path.exists(self.savedir):
                os.mkdir(self.savedir)

            if not os.path.exists(self.catelog):
                os.mkdir(self.catelog)
            os.chdir(self.catelog)

        except:
            sys.exit(0)


    def getmoviename(self,htmls):
        parse = re.compile(r'document.title\s+=\s+"(.*?)"')
        return parse.findall(htmls)[0].decode('gbk').encode('utf-8')

    def download(self):
        self.geturl()
        lens = len(self.urls)

        _start = datetime.now()

        for i in xrange(lens):
            inf = '%s %d/%d ...'%(self.movname,i+1,lens)
            self.notify(_DOWNLOADING_TITLE,inf)
            part = self.movname + '-' + str(i+1).zfill(3) + '.flv'
            if not os.path.exists(part):
                urllib.urlretrieve(self.urls[i],part)
            self.notify(_COMPLETE_TITLE,inf.replace('...',':)'))

        elap = self.elapsed(_start)
        info = 'Misson %s,takes %d minutes %d seconds'%(self.movname,elap[0],elap[1])
        self.notify(_COMPLETE_TITLE,info)

    def combine(self):
        if self.is_install_mencoder():
            _start = datetime.now()
            inf = 'start to combine %s'%self.movname
            self.notify(_START_COMBINE_TITLE,inf)
            os.system('mencoder -ovc lavc -lavcopts vcodec=mpeg4 -oac mp3lame *.flv -o %s.avi'%self.movname)
            elap = self.elapsed(_start)
            inf = 'combine %s over:) takes %d minutes %d seconds'%(self.movname,elap[0],elap[1])
            self.notify(_COMPLETE_COMBINE_TITLE,inf)
            os.system('rm -f *.flv')

    def notify(self,title,info):
        pynotify.init("Youkuit")
        n = pynotify.Notification(title,info)
        print info
        n.show()


    def is_install_mencoder(self):
        #rep = raw_input('need combine ?(Y/N):')
        #if rep.lower() == 'y' or rep.lower() == 'yes':
        #    return True
        #else:
        #    return False
        return True


    def elapsed(self,start):
        end  = datetime.now()
        elap = (end - start).seconds
        return elap/60 , elap%60


def main():
    lens = len(sys.argv)
    if lens == 2:
        savedir = _default_savedir
        url = sys.argv[1]
    elif lens == 3:
        savedir = sys.argv[2]
        url = sys.argv[1]

    demo = Youku(url,savedir)
    demo.download()
    demo.combine()
    
if __name__ == '__main__':
    main()

