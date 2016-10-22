# Usage

- git clone https://github.com/54shady/dotvim.git .vim

- ln -s ~/.vim/vimrc ~/.vimrc

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

## 搜索任何以:结果的单词

```shell
/\w\+:

\w 表示一个单词

\+: 表示以:结尾
```
