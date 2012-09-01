#!/bin/bash
#+-------------------------------------
#     FileName: convGui2term.sh
#         Desc:
#       Author: Mocker
#        Email: Zuckerwooo@gmail.com
#     HomePage: http://hi.baidu.com/new/lsin30
#      Version: 0.0.1
#   LastChange: 2012-08-22 19:37:50
#      History:

#-------------------------------------
#*/

theme_path="$HOME/.vim/colors/" #change as your theme_path
if [ -d $theme_path ]; then
    themes=$(ls $theme_path)
fi

for theme in $themes
do
    if ! [ ${theme##*_} = "term.vim" ]; then
        $(./gui2term.py $theme_path/$theme "$theme_path/${theme%\.vim}_term.vim")
        echo "convert $theme succeed!"
    fi
done

if [ $? -eq 0 ]; then
    cat << EOF
    convert over!!!

    -------------------------------------------
    +make sure 'set t_Co=256' in your ~/.vimrc
    +then , colorscheme xxx_term.vim
    +finally , run vim in your terminal
    +just enjoy it!!!
    -------------------------------------------
    EOF
fi
exit 0
