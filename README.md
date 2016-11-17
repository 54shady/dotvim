# Usage

- git clone https://github.com/54shady/dotvim.git .vim

- ln -s ~/.vim/vimrc ~/.vimrc

## lookupfile

查找但前目录所有的文件,除了png和gif文件

```shell
#!/bin/sh

# generate tag file for lookupfile plugin
echo -e "!_TAG_FILE_SORTED\t2\t/2=foldcase/" > filenametags
find . -not -regex '.*\.\(png\|gif\)' -type f -printf "%f\t%p\t1\n" | \
        sort -f >> filenametags
```

lookupfile_script_for_android.sh android使用

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

### 批量替换

用" " 括起来

	20到23行用" " 括起来
	:20,23s/\(^.*$\)/\"\1\"/

用markdown图片的格式

	174到179行改为![]()的形式
	:174,179s/\(^.*\)/![\1]\(\.\/pngs\/\1\)/
	比如
	abcd ====> ![abcd](./pngs/abcd)

用markdown链接的格式括起来

	s/\(^.*$\)/[\1]\(\1\)/

## 批量加减

在normal模式下 [n]ctrl-a或[n]ctrl-x可以给光标所在位置后第一个数字加上或前去n

比如有下面一行文字

	add or sub the digital (1) in the line

把光标放在数字1以前按下[n]ctrl-a则1会加上n(ctrl-x同理)

假设有下面内容,想要给itemname后面的数字批量加上或前去一个数n

可以执行操作(假设都加上10)

	:g/itemname/normal 10^A
	解释下
	g/itemname   为了让光标在数字前
	normal       切换到normal模式
	10           需要加的数
	^A           是ctrl-v和ctrl-a两个组合键的结果表示VIM里的CTRL-A(CTRL-X同理)

```xml
<record itemname="1">
	<entityA>Is Right 1 here</entityA>
</record>
<record itemname="2">
	<entityA>Is Right 2 here</entityA>
</record>
<record itemname="3">
	<entityA>Is 2 Right 7 here</entityA>
</record>
<record itemname="4">
	<entityA>Is Right 4 here</entityA>
</record>
```
结果如下
```xml
<record itemname="11">
	<entityA>Is Right 1 here</entityA>
</record>
<record itemname="12">
	<entityA>Is Right 2 here</entityA>
</record>
<record itemname="13">
	<entityA>Is 2 Right 7 here</entityA>
</record>
<record itemname="14">
	<entityA>Is Right 4 here</entityA>
</record>
```

## 操作寄存器(在宏操作中经常用到)

将寄存器a的内容粘帖到当前行

	"aP

将当前行的内容复制到寄存器a

	"ayy 或 "aY

相关内容

	:help <c-r>
	Shift + Insert 拷贝系统剪切板内容
	vim中寄存器"+"表示系统剪切板,所以可以用"+p代替Shift+Insert组合键

## 查看(倒数10条)历史命令

	:history -10,

## 文本处理

在调试内核驱动经常会需要查看调用栈情况,但是日志里打印的是倒序的如下

```shell
[    2.786705] [<c02cb4ac>] (rk3288_lcdc_config_done+0x64/0x280) from [<c02b82dc>] (rk_fb_pan_display+0x2a8/0x2f0)
[    2.796627] [<c02b82dc>] (rk_fb_pan_display+0x2a8/0x2f0) from [<c02bbaac>] (rk_fb_register+0x844/0x918)
[    2.805863] [<c02bbaac>] (rk_fb_register+0x844/0x918) from [<c02cd38c>] (rk3288_lcdc_probe+0x23c/0x2dc)
[    2.815104] [<c02cd38c>] (rk3288_lcdc_probe+0x23c/0x2dc) from [<c030e0bc>] (platform_drv_probe+0x14/0x18)
[    2.824515] [<c030e0bc>] (platform_drv_probe+0x14/0x18) from [<c030cc2c>] (really_probe+0xe4/0x30c)
[    2.833411] [<c030cc2c>] (really_probe+0xe4/0x30c) from [<c030cfc0>] (driver_probe_device+0x70/0x98)
[    2.842392] [<c030cfc0>] (driver_probe_device+0x70/0x98) from [<c030d048>] (__driver_attach+0x60/0x84)
[    2.851544] [<c030d048>] (__driver_attach+0x60/0x84) from [<c030b470>] (bus_for_each_dev+0x50/0x90)
[    2.860439] [<c030b470>] (bus_for_each_dev+0x50/0x90) from [<c030c354>] (bus_add_driver+0xd0/0x238)
[    2.869335] [<c030c354>] (bus_add_driver+0xd0/0x238) from [<c030d554>] (driver_register+0x9c/0x138)
[    2.878233] [<c030d554>] (driver_register+0x9c/0x138) from [<c00086dc>] (do_one_initcall+0x34/0xc8)
[    2.887133] [<c00086dc>] (do_one_initcall+0x34/0xc8) from [<c0c0db28>] (do_initcalls+0x70/0xa0)
[    2.895687] [<c0c0db28>] (do_initcalls+0x70/0xa0) from [<c0c0dbe8>] (kernel_init_freeable+0x90/0x130)
[    2.904754] [<c0c0dbe8>] (kernel_init_freeable+0x90/0x130) from [<c0866b74>] (kernel_init+0x8/0xe4)
[    2.913653] [<c0866b74>] (kernel_init+0x8/0xe4) from [<c000e398>] (ret_from_fork+0x14/0x3c)
```

使用下面的命令删除不需要的内容,留下函数调用情况

	[    2.913653] [<c0866b74>] (kernel_init+0x8/0xe4) from [<c000e398>] (ret_from_fork+0x14/0x3c)
	|------------A--------------|-----B-----|--------------C-------------|------------D----------|

	:%s/.*(\(.*\)+.*(\(.*\)+.*/\2 ===> \1/

	.*( 	匹配段A
	\(.*\) 	匹配段B
	+.*( 	匹配段C
	\(.*\) 	匹配段D
	\1		是段B
	\2		是段D

执行结果如下

```shell
rk_fb_pan_display ===> rk3288_lcdc_config_done
rk_fb_register ===> rk_fb_pan_display
rk3288_lcdc_probe ===> rk_fb_register
platform_drv_probe ===> rk3288_lcdc_probe
really_probe ===> platform_drv_probe
driver_probe_device ===> really_probe
__driver_attach ===> driver_probe_device
bus_for_each_dev ===> __driver_attach
bus_add_driver ===> bus_for_each_dev
driver_register ===> bus_add_driver
do_one_initcall ===> driver_register
do_initcalls ===> do_one_initcall
kernel_init_freeable ===> do_initcalls
kernel_init ===> kernel_init_freeable
ret_from_fork ===> kernel_init
```

对掉所有的行结果如下,之后就是整个栈调用过程

	:g/^/m0

```shell
ret_from_fork ===> kernel_init
kernel_init ===> kernel_init_freeable
kernel_init_freeable ===> do_initcalls
do_initcalls ===> do_one_initcall
do_one_initcall ===> driver_register
driver_register ===> bus_add_driver
bus_add_driver ===> bus_for_each_dev
bus_for_each_dev ===> __driver_attach
__driver_attach ===> driver_probe_device
driver_probe_device ===> really_probe
really_probe ===> platform_drv_probe
platform_drv_probe ===> rk3288_lcdc_probe
rk3288_lcdc_probe ===> rk_fb_register
rk_fb_register ===> rk_fb_pan_display
rk_fb_pan_display ===> rk3288_lcdc_config_done
```
