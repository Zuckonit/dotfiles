#!/usr/bin/env python
#coding:utf-8

import urllib
import sys
import re

url = 'http://www.youdao.com/smartresult-xml/search.s?jsFlag=true&type=mobile&q='
parse = re.compile(r"'location':'(.*?)'")
try:
    url += urllib.quote(sys.argv[1])
    data = urllib.urlopen(url).read().decode('gbk').encode('utf-8')
    print parse.findall(data)[0]
except:
    print 'phonelocate.py phonenumber'
