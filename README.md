# Usage

- git clone https://github.com/54shady/dotvim.git .vim

- ln -s ~/.vim/vimrc ~/.vimrc

## exchange.vim

[https://github.com/tommcdo/vim-exchange](https://github.com/tommcdo/vim-exchange)

Easy text exchange operator for Vim.

### Mappings

`cx`

On the first use, define the first {motion} to exchange. On the second use,
define the second {motion} and perform the exchange.

`cxx`

Like `cx`, but use the current line.

`X`

Like `cx`, but for Visual mode.

`cxc`

Clear any {motion} pending for exchange.

## Using Vim's paste mode with the system paste command

```shell
:set paste
```

Press Shift + Insert to copy text from system clipboard

```shell
:set nopaste
```
