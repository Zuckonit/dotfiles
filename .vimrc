"=============================================================================
"     FileName: .vimrc
"         Desc: my .vimrc
"       Author: Mocker
"        Email: Zuckerwooo@gmail.com
"     HomePage: zuckonit.github.com
"      Version: 0.0.2
"   LastChange: 2012-09-03 17:18:35
"      History: rewrite this file and use vundle as a management tool
"=============================================================================

"----------------------------------------------------
"                 Key Map(self-define)
"----------------------------------------------------
"=====VMap======
"<Tab>          shift right
"<Shift-Tab>    shift left
"<leader>gg     google current word
"<leader>ggs    google current select
"
"======NMap=====
"<CTRL-S>       save current buffer
"<Shift-F8>     indent your code
"<leader>ggl    google current line
"<leader>yao    get more space of 115 netdisk everyday
"<leader>we     get weather like
"<leader>sp     horizon slipt current window
"<leader>vsp    vertical split current window
"
"
"======IMap=====
"<CTRL-S>       save current buffer
"<CTRL-J>       you can both use <Tab> and <Ctrl-j> to trigger snipmate,
"               you can take which as a solution of conflict between snipMate
"               and Pydiction

"======CMap=====
":Lucky         show today's fortune of your constellation
":Yao115        get more space of 115 netdisk everyday
":Emailit       email current buffer'content

"======FMap=====
"<F3>           toggle auto remove trim when save (default is off)
"<F4>           insert author info in front
"<F5>           run current file by call QuickRun()
"<F8>           toggle side window
"<F10>          generate ctags and cscope file
"<F12>          toggle menu
"


"----------------------------------------------------
"              your need install at first
"----------------------------------------------------
"======Linux====
"wmctrl        maximize gvim window
"astyle        indent your code
"sdcv          use stardict in vim
"ctags         ctags
"cscope        cscope

"======Windows==
"mingw         use gcc/g++ in windows
"
"as for others :
"              just set the ./tools/windows directory
"              into your environment


"----------------------------------------------------
"        this is for vundle
"----------------------------------------------------
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"use Vundle
Bundle 'gmarik/vundle'

"colorscheme
Bundle 'Zuckonit/colors-pack4vundle'

"syntax
Bundle 'vim-scripts/python.vim--Vasiliev'
Bundle 'othree/xml.vim'

"ftplugin
Bundle 'vim-scripts/pyfold'
Bundle 'kevinw/pyflakes-vim'

"other plugins
Bundle 'vim-scripts/winmanager--Fox'
"Bundle 'scrooloose/nerdtree.git'
Bundle 'AutoClose--Alves'
Bundle 'mattn/zencoding-vim'
Bundle 'Zuckonit/Pydiction'
Bundle 'msanders/snipmate.vim'
Bundle 'vim-scripts/OmniCppComplete'
Bundle 'vim-scripts/AutoComplPop'
Bundle 'vim-scripts/pylint.vim'
Bundle 'vim-scripts/a.vim'
Bundle 'vim-scripts/AuthorInfo'
Bundle 'mattn/calendar-vim'
Bundle 'vim-scripts/echofunc.vim'
Bundle 'plasticboy/vim-markdown'
Bundle 'scrooloose/nerdcommenter'
Bundle 'vim-scripts/pydoc.vim'
Bundle 'mortice/taglist.vim'
Bundle 'mikewest/vimroom'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/auto_mkdir'
Bundle 'gg/python.vim'
Bundle 'vim-scripts/cscope.vim'
Bundle 'thinca/vim-quickrun'
Bundle 'vim-scripts/AutoComplPop'
Bundle 'vim-scripts/sudo.vim'
Bundle 'ervandew/supertab'
Bundle 'vim-scripts/DoxygenToolkit.vim.git'
"Bundle 'tyru/open-browser.vim'
Bundle 'gmarik/github-search.vim'
let g:github_search_path_format = '~/gitProjects/:repo'


"self vim plugins
Bundle 'Zuckonit/self-vim-plugins'
"Bundle '~/Dropbox/repos/lucky-today.git'

filetype plugin indent on




"-----------------------------------------------------
"                   global
"-----------------------------------------------------
"windows or unix-like
if(has("win32") || has("win95") || has("win64") || has("win16"))
    let g:iswindows=1
else
    let g:iswindows=0
endif


"gui
if has("gui_running")
    let g:isguiruning=1
else
    let g:isguiruning=0
endif



"-----------------------------------------------------
"                    basic
"-----------------------------------------------------
set viminfo+=!
set history=10000
set tabstop=4
set smarttab
set vb t_vb=                                 "close the fucking bell
set nobackup
set noswapfile
set number
set ruler
set magic
set cursorline
hi cursorline guibg=NONE gui=underline
set cursorcolumn
hi cursorline guibg=NONE gui=underline
set t_Co=256
set ambiwidth=double
set autochdir
set showmatch
set hidden
set winaltkeys=no
set iskeyword+=_,$,@,%,#,-

"colorscheme
set background=dark
if g:isguiruning==1
    colorscheme ir_black
else
    colorscheme ir_black_term
endif
"colorscheme ir_black_term
"colorscheme ingretu


"when search
set ignorecase smartcase
set hlsearch
set incsearch


"distinguish tab and space
set list
"set listchars=tab:>-,trail:-
set listchars=tab:>-,trail:-
set backspace=indent,eol,start


"encoding settings
set fenc=utf-8
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936

set enc=utf-8
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"format
set formatoptions=tcrqn
set textwidth=80

"mouse
set selectmode+=mouse
set mouse=a


"status line
set statusline=%k%F[%{&ff}:%{&fenc}]%m%r%h%w\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}\ %=[Line:%l/%L,Column%c]\ %=[%l,%c,%p%%]
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%] "contents in statusline
set laststatus=2  "always display statusline
set report=0      "report when anything is changed


"menu
set guioptions-=m
set guioptions-=T
nmap <silent> <F12> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>


"scroll bar
"in linux,install wmctrl at first
function Maximize_Window()
    silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction
if g:isguiruning == 1
    set guioptions-=L       "hide left scroll bar
    set guioptions-=r       "hide right scroll Bar
    if g:iswindows == 1
        au GUIEnter * simalt ~x "maximize when open vim
    else
        au GUIEnter * call Maximize_Window()
    endif
endif


"fullscreen in windows
if g:isguiruning==1
    if g:iswindows==1
        map <F11> :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
    endif
endif

"font
set gfw=YaheiConsolasHybrid\ 14
set guifont=Monaco\ 14 "set English font



"----------------------------------------------------
"                       useful
"----------------------------------------------------
"indent by yourself,shift + tab <--- indent left , tab --> indent right
set shiftwidth=4
set softtabstop=4
nmap <tab> v>
nmap <s-tab> v<
vmap <tab> >gv
vmap <s-tab> <gv


"restore last position
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif


"need not restart vim when you modify the config
"if iswindows==0
    "autocmd! BufWritePost .vimrc source %
"else
    "autocmd! BufWritePost _vimrc source %
"endif


"ctrl+s = save
map <C-s> :exec "w"<CR>
inoremap <C-s> <esc>:w<cr>


"remove trim
let g:auto_remove_whitespace=0
function! RemoveTrailingWhitespace()
    if g:auto_remove_whitespace == 1
        if &ft != "diff"
            let b:curcol = col(".")
            let b:curline = line(".")
            silent! %s/\s\+$//
            silent! %s/\(\s*\n\)\+\%$//
            call cursor(b:curline, b:curcol)
        endif
    endif
endfunction

function! ControlRemoveWhitespace()
    if g:auto_remove_whitespace == 0
        let g:auto_remove_whitespace = 1
        echo "auto remove whitespace turns on"
    else
        let g:auto_remove_whitespace = 0
        echo "auto remove whitespace turns off"
    endif
endfunction

nmap <silent> <F3> :call ControlRemoveWhitespace()<CR>
autocmd BufWritePre * call RemoveTrailingWhitespace()


"stardict + sdcv (install at first)
function! Mydict()
    let expl=system('sdcv -n ' .
                \  expand("<cword>"))
    windo if
                \ expand("%")=="diCt-tmp" |
                \ q!|endif
    25vsp diCt-tmp
    setlocal buftype=nofile bufhidden=hide noswapfile
    1s/^/\=expl/
    1
endfunction
if g:iswindows == 0
    map <silent> <leader>w :call Mydict()<CR>
endif



"shift between windows
nmap <silent> <C-n> :tabn<CR>
nmap <silent> <C-p> :tabp<CR>


au BufRead,BufNewFile {*.md,*.mkd,*.markdown}  set ft=markdown

"split
map <leader>sp :split<CR>
map <leader>vsp :vsplit<CR>

"----------------------------------------------------
"                    indent
"----------------------------------------------------
autocmd Filetype c set equalprg=cindent
set smartindent
set autoindent

"use astyle to indent your code
"support c,cpp,perl,python,java,jsp,xml,html,htm
"so , install astyle at first
map <S-F8> :call FormartSrc()<CR>

func FormartSrc()
    exec "w"
    if &filetype == 'c'
        exec "!astyle % –style=ansi –suffix=none %"
        exec "e! %"
    elseif &filetype == 'cpp'
        "exec "!astyle % –style=ansi –suffix=none %"
        "exec "e! %"
    elseif &filetype == 'perl'
        exec "!astyle –style=gnu –suffix=none %"
        exec "e! %"
    elseif &filetype == 'py'
        exec "!astyle –style=gnu –suffix=none %"
        exec "e! %"
    elseif &filetype == 'java'
        exec "!astyle –style=java –suffix=none %"
        exec "e! %"
    elseif &filetype == 'jsp'
        exec "!astyle –style=gnu –suffix=none %"
        exec "e! %"
    elseif &filetype == 'xml'
        exec "!astyle –style=gnu –suffix=none %"
        exec "e! %"
    elseif &filetype == 'html'
        exec "!astyle –style=gnu –suffix=none %"
        exec "e! %"
    elseif &filetype == 'htm'
        exec "!astyle –style=gnu –suffix=none %"
        exec "e! %"
    endif
endfunc




"-----------------------------------------------------
"                        plugins
"-----------------------------------------------------
"Nerdcommenter
let NERDShutUp=1

"change snipMate hotkey as Ctrl+Tab
ino <c-j> <c-r>=TriggerSnippet()<cr>
snor <c-j> <esc>i<right><c-r>=TriggerSnippet()<cr>

"Quickrun
map <F5> :QuickRun<CR>
let g:quickrun_config = {}
let g:quickrun_config.html = {'command':'gnome-open'}
let g:quickrun_config.tex  = {'command':'pdflatex'}

"supertab
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"

"DoxygenToolkit
let g:DoxygenToolkit_authorName="Mocker, http://zuckonit.github.com"
let s:licenseTag = "Copyright(C)\<enter>"
"let s:licenseTag = s:licenseTag . "For free\<enter>"
"let s:licenseTag = s:licenseTag . "All right reserved\<enter>"
"let g:DoxygenToolkit_licenseTag = s:licenseTag
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1



"zencoding
let g:user_zen_settings = {
            \  'indentation' : '  ',
            \  'perl' : {
            \    'aliases' : {
            \      'req' : 'require '
            \    },
            \    'snippets' : {
            \      'use' : "use strict\nuse warnings\n\n",
            \      'warn' : "warn \"|\";",
            \    }
            \  }
            \}

let g:user_zen_expandabbr_key = '<c-e>'   "set hotkey
let g:use_zen_complete_tag = 1


"winManager
let g:winManagerWindowLayout = "TagList|FileExplorer,BufExplorer"   "layout of winManager
let g:winManagerWidth = 25                                          "width of winManagerWidth
nmap <silent> <F8> :WMToggle<cr>

let g:winManagerWindowLayout='FileExplorer|BufExplorer'
let g:persistentBehaviour=0
let g:winManagerWidth=20
let g:defaultExplorer=1
nmap <silent> <F8> :WMToggle<cr>
imap <silent> <F8> :<esc>:WMToggle<cr>
"nmap <silent> <leader>fir :FirstExplorerWindow<cr>
"nmap <silent> <leader>bot :BottomExplorerWindow<cr>


"NERDTreeToggle
"imap <silent> <F8> <esc>:NERDTreeToggle<CR>
"nmap <silent> <F8> :NERDTreeToggle<CR>



"taglist
let Tlist_Show_One_File = 1            "current file only
let Tlist_Exit_OnlyWindow = 1          "exit when taglist work as the last one window
let Tlist_Use_Right_Window = 1         "display in right
let Tlist_File_Fold_Auto_Close=1       "auto fold except current buf
let Tlist_Auto_Open = 0

"ctags
set tags+=tags
"set tags+=./../tags,./../../tags,./../../../tags
set tags=~/.vim/systags


"omini
set completeopt=longest,menuone
set wildmenu
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd Filetype java set omnifunc=javacomplete#Complete

autocmd FileType javascript inoremap . .<C-X><C-O>
autocmd FileType html,htm,xhtml inoremap . .<C-X><C-O>
autocmd FileType python inoremap . .<C-X><C-O>
autocmd FileType python compiler pylint
"autocmd FileType c,cpp,h,hpp inoremap . .<C-X><C-O>



"autocomplpop
let g:AutoComplPop_MappingDriven = 1
let g:pumselect = 0
inoremap <expr> <TAB>   MaySelect()
function MaySelect()
    if(pumvisible())
        let g:pumselect = 1
        return "\<DOWN>"
    endif
    return "\<TAB>"
endfunc

inoremap <expr> <Space> MayComplete()
func MayComplete()
    if (pumvisible() && g:pumselect)
        let g:pumselect = 0
            return "\<CR>"
    endif
    return "\<Space>"
endfunc

inoremap <expr> <CR> StateChangeEnter()
func StateChangeEnter()
    let g:pumselect = 0
    return "\<CR>"
endfunc



"pydiction
if g:iswindows == 0
    let g:py_local="~/.vim/bundle/Pydiction/after/ftplugin/python/complete-dict"
elseif g:iswindows == 1
    let g:py_local="$VIM/vimfiles/after/ftplugin/pydiction/complete-dict"
endif

let g:pydiction_location=g:py_local
let g:pydiction_menu_height=10



"voom
let g:vimroom_navigation_keys = 0
let g:vimroom_sidebar_height = 0
let g:vimroom_guibackground = '#002b36'
let g:vimroom_ctermbackground = 8
nmap <silent> <leader>v <Plug>VimroomToggle


"AuthorInfo
let g:vimrc_author='Mocker'
let g:vimrc_email='Zuckerwooo@gmail.com'
let g:vimrc_homepage='zuckonit.github.com'
nmap <F4> :AuthorInfoDetect<cr>


"calendar
let g:calendar_diary= '~/文档/diary/'
map ca :Calendar<cr>

"cscope && tags
map <F10> :call Do_CsTag()<CR>
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>
function Do_CsTag()
    let dir = getcwd()
    if filereadable("tags")
        if(g:iswindows==1)
            let tagsdeleted=delete(dir."\\"."tags")
        else
            let tagsdeleted=delete("./"."tags")
        endif
        if(tagsdeleted!=0)
            echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
            return
        endif
    endif
    if has("cscope")
        silent! execute "cs kill -1"
    endif
    if filereadable("cscope.files")
        if(g:iswindows==1)
            let csfilesdeleted=delete(dir."\\"."cscope.files")
        else
            let csfilesdeleted=delete("./"."cscope.files")
        endif
        if(csfilesdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None
            return
        endif
    endif
    if filereadable("cscope.out")
        if(g:iswindows==1)
            let csoutdeleted=delete(dir."\\"."cscope.out")
        else
            let csoutdeleted=delete("./"."cscope.out")
        endif
        if(csoutdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None
            return
        endif
    endif
    if(executable('ctags'))
        "silent! execute "!ctags -R --c-types=+p --fields=+S *"
        silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
    endif
    if(executable('cscope') && has("cscope") )
        if(g:iswindows!=1)
            silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files"
        else
            silent! execute "!dir /s/b *.c,*.cpp,*.h,*.hpp,*.java,*.cs >> cscope.files"
        endif
        silent! execute "!cscope -b"
        execute "normal :"
        if filereadable("cscope.out")
            execute "cs add cscope.out"
        endif
    endif
endfunction



"-------------------------------------------
"            self-plugins
"-------------------------------------------
"weather.vim
map <leader>we :call Weather()<CR>


"115 lottery
let g:yao115_usr_list=['sin90@foxmail.com','lsin30@foxmail.com','1968576507@qq.com']
let g:yao115_pwd_list=['yang3136299','yang3136299','yang123']
map <leader>yao :call Yao115()<CR>

"google.vim
map <leader>ggw :call GoogleByWord()<CR>
map <leader>ggl :call GoogleByLine()<CR>
map <leader>ggs :call GoogleBySelect()<CR>

"email.vim
let g:email_host='smtp.qq.com'
let g:email_usr ='lsin30@foxmail.com'
let g:email_pwd ='Zicer3136299.cn'

"lucky-today
let g:lucky_your_constellation="天秤"
