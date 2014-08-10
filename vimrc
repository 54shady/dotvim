"set nu
set sw=4
set ts=4

syntax on
"vimManagerWindow
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>

"window move
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"cscope
""<C-_> Ctrl和下划线组合
:set cscopequickfix=s-,c-,d-,i-,t-,e-

    "s: 查找C语言符号，即查找函数名、宏、枚举值等出现的地方
	nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>

    "g: 查找函数、宏、枚举等定义的位置，类似ctags所提供的功能
    nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>

    "c: 查找调用本函数的函数
    nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>

    "t: 查找指定的字符串
    nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>

    "e: 查找egrep模式，相当于egrep功能，但查找速度快多了
    nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>

    "f: 查找并打开文件，类似vim的find功能
    nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>

    "i: 查找包含本文件的文件
    nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<CR><CR>

    "d: 查找本函数调用的函数
    nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"状态栏的显示
set laststatus=2 
set statusline=%t%m%r%h%w\ \ [Li=%l/%L][Co=%v][%p%%]\ Time:\%{strftime(\"%d-%m-%y\ \ %H:%M\")} 
"set statusline=%F%m%r%h%w\[POS=%l,%v][%p%%]\%{strftime(\"%d/%m/%y\ -\ %H:%M\")} 
highlight StatusLine guifg=White guibg=Black 
highlight StatusLineNC guifg=Black guibg=White ctermfg=red 

"一边输入搜索关键字,一边显示搜索结果
set incsearch

"不用vi的键盘,用vim的键盘
set nocompatible

"不循环查找
set nowrapscan

"中文显示设置
set fenc=utf-8 
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936 
set autochdir

"nmap <silence> <F10> :!ctags -R --c-kinds=+p --c++=kinds=+p --fields=+iaS
"--extra=+q ./<cr>

"set tags+=../tags;

"set mapleader   设置leader为“,”
let mapleader = ","

"fast reloading of the .vimrc
map <silent> <leader>ss :source ~/.vimrc<cr>

"fast editing of .vimrc
map <silent> <leader>ee :e ~/.vimrc<cr>

"when .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

"quickfix settings
nmap <leader>cw :cw 10<cr>
nmap <leader>cn :cn<cr>
nmap <leader>cp :cp<cr>

"find the word under the cursor in the current file.
nmap <leader>lv :lv /<c-r>=expand("<cword>")<cr>/ %<cr>:lw<cr>

"buffer
nmap ,bd :bd<CR>
nmap ,bn :bd<CR>
