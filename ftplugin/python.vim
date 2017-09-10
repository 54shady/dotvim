" PEP8 style

setl expandtab
setl tabstop=4
setl shiftwidth=4
setl softtabstop=4

" delete white space after each line
autocmd BufWritePre * :%s/\s\+$//ge

" 80 characters limit each line
setlocal textwidth=80
