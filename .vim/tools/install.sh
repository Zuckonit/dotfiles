#!/bin/bash
#/*

#@ @ @  @ @ @                             @ @
# @ @   @ @                                 @
# @ @   @ @       @ @ @         @ @ @ @     @   @ @ @       @ @ @       @ @   @ @
# @   @   @     @       @     @       @     @     @       @       @       @ @
# @       @     @       @     @             @ @ @         @ @ @ @ @       @
# @       @     @       @     @             @     @       @               @
#@ @ @   @ @ @    @ @ @        @ @ @ @    @ @     @ @ @     @ @ @ @     @ @ @ @

#+-------------------------------------
#     FileName: install.sh
#         Desc: 
#       Author: Mocker
#        Email: Zuckerwooo@gmail.com
#     HomePage: http://hi.baidu.com/new/lsin30
#      Version: 0.0.1
#   LastChange: 2012-07-31 16:08:17
#      History:

#-------------------------------------
#*/

#install font
$(cp -i $PWD/fonts/* $HOME/.fonts/)
$(sudo fc-cache)
