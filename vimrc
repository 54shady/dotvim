set shiftwidth=4
set tabstop=4
"set et
set incsearch
set hlsearch
set nocompatible
set nowrapscan
set fenc=utf-8
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936
"set autochdir
let mapleader = ","
set listchars=tab:▸\ ,trail:-,eol:¬

" set no backup files
set nobackup
set nowritebackup
set noswapfile

"use the color in the runtime color path
colorscheme peachpuff

"set mouse=a
syntax on

"enable filetype plugin
filetype plugin on

"vimManagerWindow
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap <silent> wm :WMToggle<cr>

"window move
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-x> <C-w>x

"cscope C-_ is ctrl+_
:set cscopequickfix=s-,c-,d-,i-,t-,e-
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"status line
set laststatus=2
set stl=%F%m%r%h%y[%{&fileformat},%{&fileencoding}]\ [0x%B]\ %=\ [LINE]%l/%L\ %=\[%P]
"set statusline=%F%m%r%h%w\[POS=%l,%v][%p%%]\%{strftime(\"%d/%m/%y\ -\ %H:%M\")}
highlight StatusLine guifg=White guibg=Black
highlight StatusLineNC guifg=Black guibg=White ctermfg=red

"save
map <silent> <leader>w :w!<cr>

"quit
map <silent> <leader>q :qa!<cr>

"fast reloading of the .vimrc
map <silent> <leader>ss :source ~/.vimrc<cr>

"fast editing of .vimrc
map <silent> <leader>ee :e ~/.vimrc<cr>

"when .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

"tags
nmap <leader>tn :tnext<CR>
nmap <leader>tp :tprevious<CR>
nmap <leader>ts :tselect<CR>
nmap <leader>tf :tag<SPACE>

"quickfix settings
nmap <leader>co :copen<CR>
nmap <leader>cl :cclose<CR>
nmap <leader>cw :cw 10<cr>
nmap <leader>cn :cn<cr>
nmap <leader>cp :cp<cr>

"marks
nmap <leader>ks :marks<cr>

"set path, set the code path you want to built, should disable the autochdir config
"for example below
"set path=/opt/FriendlyARM/mini2440/linux-3.17.4

"set makeprg, this is the realy call, depend on the path
"the genk can be a shell script or something else, which do the real work
"set mp=genk

"make program, which use the mp option instead
"nmap <F5> :make<cr><cr><cr>

"vimgrep
"noremap <F5> :vimgrep /<C-R>=expand("<C-R>+")<CR>/j **/*.c **/*.h<CR> \| :copen<CR>
"noremap <F5> :vimgrep /<C-R>=expand("<cword>")<CR>/j **/*.c **/*.h<CR> \| :copen<CR>
"search keyword in the open buffers
noremap <F4> :vimgrep /<C-R>=expand("<cword>")<CR>/ ##<CR>

"find the word under the cursor in the current file.
nmap <leader>lv :lv /<c-r>=expand("<cword>")<cr>/ %<cr>:lw<cr>

"buffer
nmap <leader>ls :ls<CR>
nmap <leader>bd :bd<CR>
nmap <leader>bn :bn<CR>
nmap <leader>bp :bp<CR>
nmap <leader>bb :b#<CR>
nmap <leader>hd :hide<CR>

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
map g<C-p> :call Grep_word()
function! Grep_word()
let w = expand("<cword>")
execute ":!mygrep --color=auto " w " /path/* -nR "
endfunction

"tag to grep word
map tt :call Tag_to()
function! Grep_word()
let w = expand("<cword>")
execute ":sp"
execute ":tag " w " "
endfunction

"gdb mappings
"nmap sg :source /root/.vim/macros/gdb_mappings.vim<CR>
"use arm-linux-gdb for remote debug instead of gdb
"set gdbprg=/opt/FriendlyARM/mini2440/4_3_2/usr/local/arm/4.3.2/bin/arm-linux-gdb

"config for undo plugin
set undodir=~/.vim/tmp/.undodir
set undofile
set history=100
set undolevels=100

"disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

"no uganda
"set shortmess=I

"vim提供的用于将.txt的文档生成含有tag的文档以便查找
".txt里被星号包裹的就是tag
"或者是去vim的源码目录下runtime/doc/里执行
"make doctags生成doctags工具
"再make tags就能将该目录下所有.txt制作生成tags
"或者执行doctags *.txt | sort > tags来生成tags文件
nmap <leader>ht :helptags $VIMRUNTIME/doc<cr>

"map for a.vim plugin
nmap <leader>a :A<cr>
nmap <leader>as :AS<cr>
nmap <leader>av :AV<cr>

" toggle list and unlist
nmap <silent><leader>lt :set list!<cr>

"lookupfile setting
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

"cscope config
if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=1
	set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
	endif
	set csverb
endif

"<leader>cc + <s|g|c|t|e|f|i|d>
nmap <leader>ccs :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <leader>ccg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>ccc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <leader>cct :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <leader>cce :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <leader>ccf :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <leader>cci :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <leader>ccd :cs find d <C-R>=expand("<cword>")<CR><CR>

"search in all buffers
":vim /pattern/ ##    ## reference the arglist

" @: will repeat the last command in history
" how to use that ?
" :!gcc % && ./a.out
" so when u type @: and it will execute the command again

",+space去掉末尾空格
nmap <leader><space> :FixWhitespace<cr>

" Use morning as diff color
if &diff
	colorscheme simplifysimplify-light
endif

" Add ignorance of whitespace to diff
set diffopt+=iwhite

" Toggle paste mode
nmap <silent> <leader>p :set invpaste<CR>:set paste?<CR>

" Allow command line editing like emacs
cnoremap <C-A>      <Home>
cnoremap <C-B>      <Left>
cnoremap <C-E>      <End>
cnoremap <C-F>      <Right>

" Diff toggle two files
nmap <silent><leader>df :difft<CR>:wincmd l<CR>:difft<CR>:wincmd h<CR>:difft<CR>
nmap <silent><leader>udf :diffo<CR>:wincmd l<CR>:diffo<CR>:wincmd h<CR>:diffo<CR>

" Show syntax highlighting groups for word under cursor(Ctrl+Shift+g)
"nmap <C-S-A> :call <SID>SynStack()<CR>
"function! <SID>SynStack()
"  if !exists("*synstack")
"    return
"  endif
"  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
"endfunc

" Markdown file forder
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

" DirDiff config
let g:DirDiffExcludes = "CVS,*.class,*.exe,.*.swp,Documentation,*.o.cmd,*.cmd,*.o,.git,.gitignore,tags,*.tmp,modules.order,modules.builtin,*.dtb,*.bin,*.img,*.pyc"
let g:DirDiffAddArgs = "-w"
let g:DirDiffEnableMappings = 1
let g:DirDiffWindowSize = 5

" 80 characters limit each line
setlocal textwidth=80
