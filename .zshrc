#普通命令提示符，在控制台下可以正常显示，如需使用取消注释，并把底部有关提示符的语句注释掉
#RPROMPT='%/'
PROMPT='%{[36m%}%n%{[35m%}@%{[322m%}%M %{[33m%}%D %T  %{[32m%}%/
(- -)>>'
#PROMPT='%n@%M %D %T %/
#>>'

#关于历史纪录的配置
# number of lines kept in history
export HISTSIZE=500
# # number of lines saved in the history after logout
export SAVEHIST=500
# # location of history
export HISTFILE=~/.zhistory
# # append command to history file once executed
setopt INC_APPEND_HISTORY

#python autocomplete
export PYTHONSTARTUP=/home/mocker/.pythonstartup

#自定义环境变量
export PATH=$PATH:~/.bin

#Disable core dumps
limit coredumpsize 0

#Emacs风格键绑定
bindkey -e
#设置DEL键为向后删除
bindkey "\e[3~" delete-char

#以下字符视为单词的一部分
WORDCHARS='*?_-[]~=&;!#$%^(){}<>'

#自动补全功能
setopt AUTO_LIST
setopt AUTO_MENU
setopt MENU_COMPLETE

autoload -U compinit
compinit

# Completion caching
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path .zcache
#zstyle ':completion:*:cd:*' ignore-parents parent pwd

#Completion Options
zstyle ':completion:*:match:*' original only
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:predict:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate

# Path Expansion
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-shlashes 'yes'
zstyle ':completion::complete:*' '\\'

zstyle ':completion:*:*:*:default' menu yes select
zstyle ':completion:*:*:default' force-list always

# GNU Colors 需要/etc/DIR_COLORS文件 否则自动补全时候选菜单中的选项不能彩色显示
[ -f /etc/DIR_COLORS ] && eval $(dircolors -b /etc/DIR_COLORS)
export ZLSCOLORS="${LS_COLORS}"
zmodload zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

compdef pkill=kill
compdef pkill=killall
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:processes' command 'ps -au$USER'

# Group matches and Describe
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'

#命令别名
#alias gvim='gvim -c "call Maximize_Window()"'
alias gres='sudo /etc/init.d/gdm restart'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ls='ls -F --color=auto'
alias ll='ls -l'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
#{{{cd alias
alias cddoc='cd ~/文档/'
alias cdvedio='cd ~/视频/'
alias cddown='cd ~/下载/'
alias cdpic='cd ~/图片/'
alias cddesktop='cd ~/桌面/'
#}}}

alias updeb='sudo apt-get update && sudo apt-get upgrade'
alias mysqlstop='sudo /etc/init.d/mysql stop'
alias mysqlstart='sudo /etc/init.d/mysql start'
alias mysqlrestart='sudo /etc/init.d/mysql restart'


#路径别名 进入相应的路径时只要 cd ~xxx
#hash -d WWW="/home/lazymonkey/vimwiki_html"
hash -d ARCH="/mnt/arch"
hash -d PKG="/var/cache/pacman/pkg"
hash -d E="/etc/env.d"
hash -d C="/etc/conf.d"
hash -d I="/etc/rc.d"
hash -d X="/etc/X11"
hash -d BK="/home/r00t/config_bak"

#for vim,gvim启动最大化
alias gvim='gvim -c "call Maximize_Window()"'
#关闭C-S C-Q。终端中可用CTRL-S
stty -ixon

TOKENS_FOLLOWED_BY_COMMANDS=('|' '||' ';' '&' '&&' 'sudo' 'do' 'time' 'strace')

recolor-cmd() {
    region_highlight=()
    colorize=true
    start_pos=0
    for arg in ${(z)BUFFER}; do
        ((start_pos+=${#BUFFER[$start_pos+1,-1]}-${#${BUFFER[$start_pos+1,-1]## #}}))
        ((end_pos=$start_pos+${#arg}))
        if $colorize; then
            colorize=false
            res=$(LC_ALL=C builtin type $arg 2>/dev/null)
            case $res in
                *'reserved word'*)   style="fg=magenta,bold";;
                *'alias for'*)       style="fg=cyan,bold";;
                *'shell builtin'*)   style="fg=yellow,bold";;
                *'shell function'*)  style='fg=green,bold';;
                *"$arg is"*)
                    [[ $arg = 'sudo' ]] && style="fg=red,bold" || style="fg=blue,bold";;
                *)                   style='none,bold';;
            esac
            region_highlight+=("$start_pos $end_pos $style")
        fi
        [[ ${${TOKENS_FOLLOWED_BY_COMMANDS[(r)${arg//|/\|}]}:+yes} = 'yes' ]] && colorize=true
        start_pos=$end_pos
    done
}

check-cmd-self-insert() { zle .self-insert && recolor-cmd }
check-cmd-backward-delete-char() { zle .backward-delete-char && recolor-cmd }

zle -N self-insert check-cmd-self-insert
zle -N backward-delete-char check-cmd-backward-delete-char
