# Usage

- git clone https://github.com/54shady/dotvim.git .vim

- ln -s ~/.vim/vimrc ~/.vimrc

## vim_expression_register

假设有个一个脚本为test.py其内容如下

	#!/usr/bin/python
	import uuid
	import sys
	sys.stdout.write(uuid.uuid4.__str__())

现有如下映射,在插入模式下ctrl-j + d会触发执行这个脚本

	imap <c-j>d <c-r>=system('/home/zeroway/test.py')<cr>

在编辑任意文件是也可以设定这个imap

	:imap <c-j>d <c-r>=system('/home/zeroway/t.py')<cr>

## vimdiff color

在.bashrc里配置如下

alias vd='vimdiff -S ~/.vim/colors/torte.vim'

## Tabular.vim

[插件地址https://github.com/godlygeek/tabular.git](https://github.com/godlygeek/tabular.git)

### 赋值对齐

执行对齐操作前

```shell
one = 1
two = 2
three = 3
four = 4
```

### 执行 :Tab /= 后结果如下:

```shell
one   = 1
two   = 2
three = 3
four  = 4
```

### 冒号赋值

未对齐前

```shell
var video = {
    metadata: {
        title: "Aligning assignments"
        h264Src: "/media/alignment.mov",
        oggSrc: "/media/alignment.ogv"
        posterSrc: "/media/alignment.png"
        duration: 320,
    }
}
```

### 执行了 :Tab /: 后结果如下

```shell
var video = {
    metadata: {
        title     : "Aligning assignments"
        h264Src   : "/media/alignment.mov",
        oggSrc    : "/media/alignment.ogv"
        posterSrc : "/media/alignment.png"
        duration  : 320,
    }
}
```

### 执行 :Tab /:\zs 结果如下

其中 \zs 可以查看帮助

:help \zs

```shell
var video = {
    metadata: {
        title:      "Aligning assignments"
        h264Src:    "/media/alignment.mov",
        oggSrc:     "/media/alignment.ogv"
        posterSrc:  "/media/alignment.png"
        duration:   320,
    }
}
```

## exchange.vim

[插件地址https://github.com/tommcdo/vim-exchange](https://github.com/tommcdo/vim-exchange)

快速交换文本位置

### Mappings

`cx`

第一次执行cx会标记你要交换的第一个文本,再次执行cx后会交换两文本位置

`cxx`

Like `cx`, but use the current line.

`X`

Like `cx`, but for Visual mode.

`cxc`

取消所有的交换标记

## 使用Shift+Insert插入文本时保持原有格式

设置使用paste

```shell
:set paste
```

使用Shift + Insert组合键来插入系统剪切板中的内容

关闭paste模式

```shell
:set nopaste
```

## 搜索任何以:结尾的单词

```shell
/\w\+:

\w 表示一个单词

\+: 表示以:结尾
```

## 正则表达式

### 有如下文本

```xml
	<label abc def="ade">The is what we want</label>
	<label abc def="ade">Why</label>
	<label abc def="ade">Vim</label>
	<label abc def="ade">Is</label>
	<label abc def="ade">So</label>
	<label abc def="ade">Great!</label>
```

在执行了下面命令后

	:%s/^.*>\(.*\)<\/label>/\1/
	解释如下
	%s          匹配全部范围
	^.*>        匹配开头所有到>
	\(.*\)      匹配所有
	<\/label>   匹配</label>
	\1          在这里是\(.*\)

结果如下

	The is what we want
	Why
	Vim
	Is
	So
	Great!
