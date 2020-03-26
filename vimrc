" Common {{{
set shiftwidth=4
set tabstop=4
set incsearch
set hlsearch
set nocompatible
set nowrapscan
"set autochdir
let mapleader = ","

" set no backup files
set nobackup
set nowritebackup
set noswapfile

" different between windows and linux
" windows setting
if has("win32")
if has("gui_running")

" no more menu,bar,etc
set guioptions-=T
set guioptions-=m
set guioptions-=r
set guioptions-=L

" font size
set guifont=Courier_New:h16

" color
colorscheme desert

" max the window
au GUIEnter * simalt ~x
endif " end gui setting
else
" linxu setting
" triangle symbol : enter insert mode and type ctrl-v u25b8
set listchars=tab:▸\ ,trail:-,eol:¬

" fenc on linux os
set fenc=utf-8
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936

"use the color in the runtime color path
colorscheme peachpuff

endif " end os different setting


"set mouse=a
syntax on

"enable filetype plugin
filetype plugin on
filetype indent on

" 80 characters limit each line
set textwidth=80

" linebreak enable
set linebreak

" Add ignorance of whitespace to diff
set diffopt+=iwhite

" Use morning as diff color
if &diff
	colorscheme simplifysimplify-light
endif
" }}}

"StatusLine {{{
"set stl=%F%m%r%h%y[%{&fileformat},%{&fileencoding}]\ [0x%B]\ %=\ [LINE]%l/%L\ %=\[%P]
set laststatus=2
set statusline=
set statusline+=%F " Full path to the file in the buffer.
set statusline+=%m " Modified flag
set statusline+=%r " Readonly flag
"set statusline+=%h " Help buffer flag
set statusline+=%y " Type of file in the buffer
set statusline+=[%{&fileformat},%{&fileencoding}]
"set statusline+=\ %02n " buffer number
set statusline+=\ 
"set statusline+=%*
"set statusline+=%#Comment#
set statusline+=[0x%B]
"set statusline+=%#Statement#
"set statusline+=%#Directory#
set statusline+=%=   " left / right items separator
set statusline+=[LINE]%l/%L
set statusline+=\ 
set statusline+=%=  " left / right items separator
"set statusline+=%#Special#
set statusline+=[%P]

highlight StatusLine guifg=White guibg=Black
highlight StatusLineNC guifg=Black guibg=White ctermfg=red
" }}}

" KeyMaps {{{

" yank/paste to/from the OS clipboard {{{
"noremap <silent> <leader>y "+y
"noremap <silent> <leader>Y "+Y
"noremap <silent> <leader>p "+p
"noremap <silent> <leader>P "+P
" }}}

" reselect last selection {{{
" after indent / un-indent in visual and select modes
vnoremap < <gv
vnoremap > >gv
vmap <Tab> >
vmap <S-Tab> <
" }}}

" Using minuskey '-' and underscore '_' to move line up/down {{{
" move current line down
noremap <silent>_ :m+<CR>
" move current line up
noremap <silent>- :m-2<CR>
" move visual selection down
vnoremap <silent>_ :m '>+1<CR>gv=gv
" move visual selection up
vnoremap <silent>- :m '<-2<CR>gv=gv
" }}}

" maps for external grep {{{
" using Ack or ag as external grep
if executable('ag')
	let g:ackprg = 'ag --vimgrep --ignore tags'
endif
" ! means not to jump to first match
cnoreabbrev Ack Ack!
nnoremap <Leader>g :Ack!<Space>
" }}}

" maps for quick test {{{
" map for c program
autocmd FileType c map <F2> :!gcc %<CR>
autocmd FileType c map <F3> :!./a.out<CR>

" map for python script
autocmd FileType python map <F3> :!python %<CR>
" }}}

" ManagerWindow {{{
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap <silent> wm :WMToggle<cr>
" }}}

" split window {{{
nmap <leader>sp :sp<cr>
nmap <leader>vsp :vsp<cr>
" }}}

"a.vim plugin key map {{{
nmap <leader>a :A<cr>
nmap <leader>as :AS<cr>
nmap <leader>av :AV<cr>
" }}}

" Allow command line editing like emacs {{{
cnoremap <C-A>      <Home>
cnoremap <C-B>      <Left>
cnoremap <C-E>      <End>
cnoremap <C-F>      <Right>
" }}}

" map with count, overlay the default Q command {{{
" nQ will execute the command
nnoremap Q n.
nnoremap Q @='n.'<CR>
nnoremap Q :normal n.<CR>
" }}}

"window move {{{
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-x> <C-w>x
" }}}

" tags {{{
nmap <silent> <leader>tn :tnext<CR>
nmap <silent> <leader>tp :tprevious<CR>
nmap <silent> <leader>ts :tselect<CR>

" tag find
nmap <leader>tf :tag<SPACE>

" tag to word under the cursor
map tt :call Tag_to()<CR>
function! Tag_to()
let w = expand("<cword>")
execute ":sp"
execute ":tag " w " "
endfunction
" }}}

"quickfix {{{
nmap <silent> <leader>co :copen<CR>
nmap <silent> <leader>cl :cclose<CR>
nmap <silent> <leader>cw :cw 10<cr>
nmap <silent> <leader>cn :cn<cr>
nmap <silent> <leader>cp :cp<cr>
" }}}

"buffers {{{
nmap <leader>ls :ls<CR>:e #
nmap <silent> <leader>bd :bd<CR>
nmap <silent> <leader>bn :bn<CR>
nmap <silent> <leader>bp :bp<CR>
nmap <silent> <leader>bb :b#<CR>
nmap <silent> <leader>hd :hide<CR>
" }}}

"disable arrow keys {{{
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
" }}}

" Misc key maps {{{

" quick man under cursor
nmap <leader>k <Plug>(Man)

" cd to the directory of the current buffer
nnoremap <silent> <leader>cd :cd %:p:h<CR>

" remap U to <C-r> for easier redo
nnoremap U <C-r>
" [r]un command mode
noremap <leader>r :

" [e]xternal [r]un program
noremap <leader>er :!

" [R]epeat last command
noremap <leader>R @:

"vimgrep
"noremap <F5> :vimgrep /<C-R>=expand("<C-R>+")<CR>/j **/*.c **/*.h<CR> \| :copen<CR>
"noremap <F5> :vimgrep /<C-R>=expand("<cword>")<CR>/j **/*.c **/*.h<CR> \| :copen<CR>
"search keyword in the open buffers(must be in arglist)
" ## stand for arglist files
" using cmd :bufdo argadd % add all buffers to arglist
noremap <leader>fb :vimgrep /<C-R>=expand("<cword>")<CR>/ ##<CR>

"find the word under the cursor in the current file.
nmap <leader>lv :lv /<c-r>=expand("<cword>")<cr>/ %<cr>:lw<cr>

"select a text & search
vnoremap * y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
vnoremap # y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

"vimgrep current word
map ft :call Search_Word()<CR>:copen<CR>
function! Search_Word()
let w = expand("<cword>") "在当前光标位置抓词
execute "vimgrep " w " *"
endfunction

"grep the word under the cursor
map g<C-p> :call Grep_word()<CR>
function! Grep_word()
let w = expand("<cword>")
execute ":!grep --color=auto " w " /path/* -nR "
endfunction

" toggle list and unlist
nmap <silent><leader>lt :set list! list?<cr>

",+space去掉末尾空格
nmap <leader><space> :FixWhitespace<cr>

" Diff toggle two files
nmap <silent><leader>df :difft<CR>:wincmd l<CR>:difft<CR>:wincmd h<CR>:difft<CR>
nmap <silent><leader>udf :diffo<CR>:wincmd l<CR>:diffo<CR>:wincmd h<CR>:diffo<CR>

"save
map <silent> <leader>w :w!<cr>

"quit
map <silent> <leader>q :qa!<cr>

"fast reloading of the .vimrc
map <silent> <leader>ss :source ~/.vimrc<cr>

"fast editing of .vimrc
map <silent> <leader>ee :e ~/.vimrc<cr>

" Toggle paste mode
nmap <silent> <leader>p :set invpaste<CR>:set paste?<CR>

"marks
nmap <leader>ms :marks<cr>

"vim提供的用于将.txt的文档生成含有tag的文档以便查找
".txt里被星号包裹的就是tag
"或者是去vim的源码目录下runtime/doc/里执行
"make doctags生成doctags工具
"再make tags就能将该目录下所有.txt制作生成tags
"或者执行doctags *.txt | sort > tags来生成tags文件
nmap <leader>ht :helptags $VIMRUNTIME/doc<cr>
" Misc key maps end }}}
" KeyMaps }}}

" AutoCmd {{{
" Only do this part when compiled vim with autocommands supported
if has("autocmd")

" generate png file while write current dot file to buffer
autocmd! BufWritePost *.dot !dot -Tpng % -o /tmp/dottmp.png

" VIMRC {{{
" when .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc
autocmd! bufreadpre .vimrc,vimrc set foldmethod=marker
" }}}

" Autopep8 plugin {{{
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>
autocmd FileType python set equalprg=autopep8\ -
" }}}

" load skeleton when create a empty file {{{
autocmd! BufNewFile *.c 0r ~/.vim/skeleton/skeleton.c
autocmd! BufNewFile *.py 0r ~/.vim/skeleton/skeleton.py
" }}}

endif

" }}}

" Unused {{{

"Search in all buffers {{{
":vim /pattern/ ##    ## reference the arglist

" @: will repeat the last command in history
" how to use that ?
" :!gcc % && ./a.out
" so when u type @: and it will execute the command again

" Show syntax highlighting groups for word under cursor(Ctrl+Shift+g)
"nmap <C-S-A> :call <SID>SynStack()<CR>
"function! <SID>SynStack()
"  if !exists("*synstack")
"    return
"  endif
"  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
"endfunc
" }}}

"set path, set the code path you want to built, should disable the autochdir config
"for example below
"set path=/opt/FriendlyARM/mini2440/linux-3.17.4

"set makeprg, this is the realy call, depend on the path
"the genk can be a shell script or something else, which do the real work
"set mp=genk

"make program, which use the mp option instead
"nmap <F5> :make<cr><cr><cr>

"gdb mappings
"nmap sg :source /root/.vim/macros/gdb_mappings.vim<CR>
"use arm-linux-gdb for remote debug instead of gdb
"set gdbprg=/opt/FriendlyARM/mini2440/4_3_2/usr/local/arm/4.3.2/bin/arm-linux-gdb
"
"no uganda
"set shortmess=I
" }}}

"Undo plugin {{{
set undodir=~/.vim/tmp/.undodir
set undofile
set history=100
set undolevels=100
" }}}

"Lookupfile {{{
let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找
let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件

if filereadable("./filenametags")                "设置tag文件的名字
	let g:LookupFile_TagExpr = '"./filenametags"'
endif

"映射LookupFile为,lk
nmap <silent> <leader>lk :LUTags<cr>
"映射LUBufs为,lb
nmap <silent> <leader>lb :LUBufs<cr>
"功能重复,无需映射
"nmap <silent> <leader>lW :LUWalk<cr>
" }}}

"Cscope {{{
if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=1
	set cst
	set nocsverb
	" generate the database
	" cscope -bqR
	" add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
	endif
	set csverb
endif

"<leader>cc + <a|s|g|c|t|e|f|i|d>

" a: Find assignments to this symbol
nmap <leader>cca :cs find a <C-R>=expand("<cword>")<CR><CR>

" s: Find this C symbol
nmap <leader>ccs :cs find s <C-R>=expand("<cword>")<CR><CR>

" g: Find this definition
nmap <leader>ccg :cs find g <C-R>=expand("<cword>")<CR><CR>

" c: Find functions calling this function
nmap <leader>ccc :cs find c <C-R>=expand("<cword>")<CR><CR>

" t: Find this text string
nmap <leader>cct :cs find t <C-R>=expand("<cword>")<CR><CR>

" e: Find this egrep pattern
nmap <leader>cce :cs find e <C-R>=expand("<cword>")<CR><CR>

" f: Find this file
nmap <leader>ccf :cs find f <C-R>=expand("<cfile>")<CR><CR>

" i: Find files #including this file
nmap <leader>cci :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>

" d: Find functions called by this function
nmap <leader>ccd :cs find d <C-R>=expand("<cword>")<CR><CR>

"cscope C-_ is ctrl+_
":set cscopequickfix=s-,c-,d-,i-,t-,e-
"
"nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
"nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
"nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
"nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
"nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
"nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
"nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>
" }}}

" Markdown forder {{{
function! MarkdownLevel()
    if getline(v:lnum) =~ '^# .*$'
        return ">1"
    endif
    if getline(v:lnum) =~ '^## .*$'
        return ">2"
    endif
    if getline(v:lnum) =~ '^### .*$'
        return ">3"
    endif
    if getline(v:lnum) =~ '^#### .*$'
        return ">4"
    endif
    if getline(v:lnum) =~ '^##### .*$'
        return ">5"
    endif
    if getline(v:lnum) =~ '^###### .*$'
        return ">6"
    endif
    return "="
endfunction

function! MarkdownFoldText()
	let foldsize = (v:foldend - v:foldstart)
	return getline(v:foldstart).' ('.foldsize.' line)'
endfunction

au BufEnter *.md setlocal foldexpr=MarkdownLevel()
au BufEnter *.md setlocal foldmethod=expr
au BufEnter *.md setlocal foldtext=MarkdownFoldText()
" }}}

" DirDiff {{{
let g:DirDiffExcludes = "CVS,*.class,*.exe,.*.swp,
	\Documentation,*.o.cmd,*.cmd,*.o,.git,.gitignore,
	\tags,*.tmp,modules.order,modules.builtin,*.dtb,
	\*.bin,*.img,*.pyc"

let g:DirDiffAddArgs = "-w"
let g:DirDiffEnableMappings = 1
let g:DirDiffWindowSize = 5
" }}}

" Project tags {{{
" In this case for all files match the pattern ~/proj2/*
" the tag files ~/proj2/tags and ~/work/common.tags will be used
" let g:ProjTags += [[ "~/proj2", "~/proj2/tags", "~/work/common.tags" ]]
" let g:ProjTags += [[ "path1",
" \ "path2",
" \ "path3",
" \ "path4" ]]
" }}}

" Preload tags {{{
" preload python builtin tags if necessary
if filereadable("/usr/lib/python2.7/tags")
	autocmd FileType python set tags+=/usr/lib/python2.7/tags
endif
" }}}

" Default Sessions {{{
" Auto save and load default session
let g:DefaultSessionFile="project.vim"
let g:DefaultInfoFile="project.info"
let g:OrigPWD=getcwd()
if filereadable(g:DefaultSessionFile)
    if argc() == 0
        au VimEnter * call EnterHandler()
        au VimLeave * call LeaveHandler()
    endif
endif
function! LeaveHandler()
	" make default session project.vim
    exec "mksession! ".g:OrigPWD."/".g:DefaultSessionFile
    exec "wviminfo! ".g:OrigPWD."/".g:DefaultInfoFile
endfunction
function! EnterHandler()
	" source sesssion
    exec "source ".g:OrigPWD."/".g:DefaultSessionFile
    exec "rviminfo ".g:OrigPWD."/".g:DefaultInfoFile
endfunction
" }}}

" Abbreviation {{{
" insert mode abbreviation for debug log {{{
" enter insert mode and type the trigger word
iabbrev logf printf("%s, %d\n", __FUNCTION__, __LINE__);
iabbrev logk printk("%s, %d\n", __FUNCTION__, __LINE__);
" }}}
" }}}

" Jedi {{{
" overlay jedi default_settings
" no more map for default
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#rename_command = ""
let g:jedi#call_signatures_command = ""
let g:jedi#goto_assignments_command = ""
" }}}

" W3m plugin config {{{
let g:w3m#command = '/usr/bin/w3m'
let g:w3m#external_browser = 'firefox-bin'
let g:w3m#homepage = "http://www.baidu.com/"
let g:w3m#hit_a_hint_key = 'f'
let g:w3m#search_engine = "https://www.baidu.com/s?wd="
" }}}

" Quick translate map {{{
" ain't that elegant
"nnoremap tr :let current_word=expand("<cword>")<Bar>exec '!python youdaofanyi.py ' .a<CR>

" YouDao Translate Plugin KeyMap {{{
" ctrl-t translate the current word under cursor
vnoremap <silent> <C-t> :<C-u>Ydv<CR>
nnoremap <silent> <C-t> :<C-u>Ydc<CR>
noremap <leader>yd :<C-u>Yde<CR>
" }}}
" }}}

" Autoformat code {{{
" package dev-util/astyle require
map <F4> :call FormatCode()<CR>
func! FormatCode()
    exec "w"
    if &filetype == 'c' || &filetype == 'h'
		" format code style
		exec '!astyle --style=linux --pad-oper --max-code-length=80 %'
		" make multiple empty lines into only one
		exec '%s/^\n$//ge'
		" translate annotation from cpp into c format
		exec '%s/\/\/\(.*\)/\/\* \1 \*\//ge'
		" for, if, while format
		exec '%s/for(/for (/ge'
		exec '%s/if(/if (/ge'
		exec '%s/while(/while (/ge'
		"exec ':FixWhitespace<CR>'
		" goto the top line
		exec 'normal gg'
		" sync change to disck
		exec 'w'
    elseif &filetype == 'cpp' || &filetype == 'cc' || &filetype == 'hpp'
		exec '!astyle --style=linux --pad-oper --max-code-length=80 %'
    elseif &filetype == 'perl'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'py'|| &filetype == 'python'
        exec "!autopep8 --in-place --aggressive %"
    elseif &filetype == 'java'
        exec "!astyle --style=java --suffix=none %"
    elseif &filetype == 'jsp'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'xml'
        exec "!astyle --style=gnu --suffix=none %"
    else
        exec "normal gg=G"
        return
    endif
endfunc
" }}}

" Vim debug miscellaneous {{{
"set verbose=4
" or set as below in file
" :[count]verbose {command}
" for example, open file a.c, enter command below
" :4verbose set formatoptions
" }}}
