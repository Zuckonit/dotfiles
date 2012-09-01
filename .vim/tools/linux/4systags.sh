#!/bin/bash

#                 {/ ． ．\}
#                 ( (oo)   )
#+--------------oOOo---︶︶︶︶---oOOo------------------+
#     FileName  :           4systags.sh
#     Describe  :           ctags 生成系统库以及ACE, SQLITE,
#     ORACLE相关函数的tags, 存放于 ~/.vim/systags 文件中。
#     Author    :           Lazy.monkey™
#     Email     :           lazymonkey.me@gmail.com
#     HomePage  :           NULL
#     Version   :           0.0.1
#     LastChange:           2012-02-23 10:02:30
#     History   :
#+------------------------------------Oooo--------------+

ctags -I __THROW -I __attribute_pure__ -I __nonnull -I __attribute__ \
    --file-scope=yes --langmap=c:+.h --languages=c,c++ --links=yes \
    --c-kinds=+p --c++-kinds=+p --fields=+iaS --extra=+q  -f ~/.vim/systags \
    /usr/include/* \
    /usr/include/sys/* /usr/include/bits/*  /usr/include/netinet/* \
    /usr/include/arpa/*
"========================="
set tags+=~/.vim/systags
"========================="' >> ~/.vimrc
