#!/usr/bin/env python
#coding:utf-8

import urllib
import sys
import os


fmt = ['png','eps','bmp','tif','xaml','svg','txt','html','zip']

def usage():
    _usage = '''
    ........................
    .      Qrcode Maker    .
    .         _by Zuckonit .
    ........................
    Usage:
    Qrmkr.py -format savedir
        about format:
            'png','eps','bmp','tif','xaml','svg','txt','html','zip'
            zip means get all formats within a zip
    Qrmkr.py -h
        see the usge
    '''
    sys.stdout.write(_usage)
    
    
def main(args = sys.argv):
    df  = ''
    if len(args) == 2:
        usage()
        
    elif len(args) == 3:
        if args[1].lstrip('-') in fmt:
            df   =  args[1].replace('-','.')
            info = raw_input('What you wanna be coded:')
            info = info.replace('/','~!slash!~')
            info = info.replace('.','~!dot!')
            try:
                info = info.decode('gbk').encode(utf-8)
            except:
                pass
            
            url = '''http://qrmkr.com/qr/%s/img%s'''%(urllib.quote(info),df)
            
            savedir = os.path.expanduser(args[2])
            if os.path.isdir('''%s'''%savedir):
                os.chdir('''%s'''%savedir)
            else:
                usage()
            urllib.urlretrieve(url,'img%s'%df)
        else:
            usage()
    else:
        usage()
        
main()

