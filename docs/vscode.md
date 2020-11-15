# VS Code Customization

此文用于记(分)录(享)我的VS Code环境配置(只涉及通用化配置，不包含诸如自定义代码段等定制化配置)，主要用于算法/深度学习的日常开发，涉及语言为Python和C++，操作系统为Linux(偶尔用MAC OSX，极少用Windows)，开发机器以远程服务器为主, 本地环境为辅。

> PS: 这并不是一篇教你如何炫(zhuang)技(B)的文章，使用和配置IDE的前提是你**真正需要它** (适合自己的才是最好的，其实你是VIM党，也可以直接无视本文)，虽说 "工欲善其事必先利其器" ，但我还是建议多将时间花在钻研技术或科研上。

- [VS Code Customization](#vs-code-customization)
    - [Basic Settings](#basic-settings)
        - [Extensions](#extensions)
        - [Settings](#settings)
            - [Color Theme & File Icon](#color-theme--file-icon)
            - [Editor](#editor)
            - [Python Linting & Formatting](#python-linting--formatting)
            - [C++ Linting & Formatting](#c-linting--formatting)
            - [Debugging](#debugging)
    - [Remote-SSH](#remote-ssh)
        - [SSH Key](#ssh-key)
        - [More Features](#more-features)

## Basic Settings

首先是比较基础的配置，包括**插件**以及一些**settings配置**(主要从硕士期间的编码习惯以及在公司实习期间的开发状况演变而来)，此套配置方案比较适合从事深度学习/算法研究，使用Python和C++作为主要开发语言的童鞋。

### Extensions

先罗列一下插件(**extensions**)：

- **Python**[[ms-python.python](https://github.com/Microsoft/vscode-python)]
- **C/C++**[[ms-vscode.cpptools](https://github.com/microsoft/vscode-cpptools)]
- **C/C++ Clang Command Adapter** [[mitaki28.vscode-clang](https://github.com/mitaki28/vscode-clang)]
- **Markdown All in One**[[yzhang.markdown-all-in-one](https://github.com/yzhang-gh/vscode-markdown)]
- **GitLens**[[eamodio.gitlens](https://github.com/eamodio/vscode-gitlens)]
- **Remote-SSH**[[ms-vscode-remote.remote-ssh](https://github.com/microsoft/vscode-remote-release)]
- **Settings Sync**[[shan.code-settings-sync](https://github.com/shanalikhan/code-settings-sync)]
- **Dracula Official**[[dracula-theme.theme-dracula](https://github.com/dracula/visual-studio-code)]
- **vscode-icons**[[vscode-icons-team.vscode-icons](https://github.com/vscode-icons/vscode-icons)]

![](https://gitee.com/bigballon/images/raw/master/img/K5lRd1S.png)

稍微解释一下各个插件的功能与用途：

- 首先，代码高亮和语法检查是日常开发必须的, 这里我直接选用微软官方的 **Python** 和 **C/C++** 这两个插件, 针对 C/C++ 的语法检查与代码补全，我选用的是 **C/C++ Clang Command Adapter**，后边还会提到。   
- 因为个人还经常使用markdown，这里再加一款优秀的Markdown插件 **Markdown All in One**，满足日常开发需求。
- **GitLens** 则是代码版本管理与合作开发方面的不二选择。
- **Remote-SSH** 则可以说是VS Code最大的神器之一，让远程编写/调式代码变得异常舒适。
- 主题方面因为对粉红色和紫色比较钟爱，所以选择了**Dracula**，图标则是 **vscode-icons**。

前面说了这些是我认为比较通用的插件，其他较为定制化的插件的使用，因人而异，请自行安装与配置。

### Settings

再来看一下配置文件(**settings.json**):

```json
{
    // theme
    "workbench.colorTheme": "Dracula Soft",
    "workbench.iconTheme": "vscode-icons",
    // editor settings
    "editor.renderIndentGuides": true,
    "editor.formatOnSave": true,
    "editor.insertSpaces": true,
    "editor.mouseWheelZoom": true,
    "editor.renderControlCharacters": true,
    "editor.renderWhitespace": "boundary",
    "files.eol": "\n",
    // python settings
    "python.formatting.provider": "black",
    "[python]": {
        "editor.codeActionsOnSave": {
            "source.organizeImports": true
        },
        "editor.tabSize": 4
    },
    // c plus plus settings
    "C_Cpp.clang_format_fallbackStyle": "Google",
    "[cpp]": {
        "editor.detectIndentation": true,
        "editor.tabSize": 2
    }
}
```

同样，稍微解释一下：

#### Color Theme & File Icon

```json
// 颜色主题 Dracula Soft
// 图标主题 vscode-icons
"workbench.colorTheme": "Dracula Soft",
"workbench.iconTheme": "vscode-icons",
```

![](https://gitee.com/bigballon/images/raw/master/img/7u7kh6u.png)


#### Editor

```json
// 显示缩进参考线，很有用，特别是在嵌套很多层的时候
"editor.renderIndentGuides": true, 

// 在保存时对代码进行格式化，非常有用
"editor.formatOnSave": true,

// 当按tab键是，用空格代替
// PS: 开启这个可以充分避免因为tab键和space键混用而导致的代码一团糟
// 特别是在编写python代码的时候 XD
"editor.insertSpaces": true,

// 按住 Ctrl 键并滚动鼠标滚轮时对编辑器字体大小进行缩放
// 如在meeting适，share屏幕下VS Code字体太小，就能进行调节
"editor.mouseWheelZoom": true,

// 显示控制字符
// 这个也非常有用，有时候一些看不到的特殊字符可能会让你debug半天
"editor.renderControlCharacters": true,

// 显示空白字符
// 我使用的是 boundary 模式，这样可以比较清晰地看到每行开头和结尾的空格字符
"editor.renderWhitespace": "boundary",

// 文件的EOL，统一成 "\n"， 
// see https://stackoverflow.com/questions/1552749/difference-between-cr-lf-lf-and-cr-line-break-types
// 避免不同平台之间出现诸如"^M"等问题
"files.eol": "\n",
```
PS：友情提示，你可以在json文件中手动添加或者修改，也可以通过图形界面进行选择与修改, 下面放一张效果图(可以仔细观察一下右上和右下两张图的区别)

![](https://gitee.com/bigballon/images/raw/master/img/oDWzywp.png)

#### Python Linting & Formatting

Python的代码检查与格式化，我使用了 **isort** + **black** + **flake8** 的方案，类似的方案也可以在众多开源项目中看到，如 [FAIR](https://github.com/facebookresearch) 的图像分类训练框架 [pycls](https://github.com/facebookresearch/pycls/blob/master/dev/linter.sh), 通用检测训练框架 [Detectron2](https://github.com/facebookresearch/detectron2/blob/master/dev/linter.sh) 等等。

- [isort](https://github.com/PyCQA/isort) 是一个专门用来对imports进行排序的工具
    - 你可能经常会有到底import的这些package怎么摆放，isort帮你统一解决了这个问题
    - 官宣很有意思: isort your imports, so you don't have to.
- [black](https://github.com/psf/black) 代替默认的pylint对代码进行格式化
    - 官方的说法是 Black is the uncompromising Python code formatter
- [flake8](https://github.com/PyCQA/flake8) 是目前比较常用的静态代码检查工具
    - 我个人认为团队统一的代码风格和开发规范是很重要的

```json
// provider 选择black
"python.formatting.provider": "black",
"[python]": {
    // 在保存 python 文件的时候，用isort进行import 排序
    "editor.codeActionsOnSave": {
        "source.organizeImports": true
    },
    // tab键占用4个字符
    "editor.tabSize": 4
}
```

可以优先在自己使用conda环境中装好(忘记装也不要紧，Lint或者Format的时候VS Code会提示你):

```bash
conda install black flake8 isort -y
```
全部配置好后会产生如下效果:

- `ctrl + s` 进行文件保存
    - 调用isort对imports进行排序
    - 调用black进行代码格式化
- 保存结束


不管是团队还是个人，统一的 Linting 和 Formatting 都是重要的，我们应该把精力花在coding本身，而不应该在代码风格和排版上纠结

#### C++ Linting & Formatting

C++ 这里，我简单配置了 [Google Style](https://google.github.io/styleguide/cppguide.html)，从下面的配置也能看清晰看出

```json
"C_Cpp.clang_format_fallbackStyle": "Google",
"[cpp]": {
    "editor.detectIndentation": true,
    "editor.tabSize": 2
}
```

- 大部分情况下还是推荐用 [Clang-Format](http://clang.llvm.org/docs/ClangFormat.html) 来做 C++ 代码风格管理，大家熟悉的 [TensorFlow](https://github.com/tensorflow/tensorflow/blob/master/tensorflow/.clang-format) / [PyTorch](https://github.com/pytorch/pytorch/blob/master/.clang-format) / [Electron](https://github.com/electron/electron/blob/master/.clang-format) 等开源 C++ 项目均有使用
- 如果是做一些ICPC的比赛，更推荐直接使用 [Vim](https://www.vim.org/) / [Code::Blocks](http://www.codeblocks.org/)，或者更轻量级的 [Sublime Text](https://www.sublimetext.com/)



![image alt](https://user-images.githubusercontent.com/7837172/98710010-18b1dc80-23be-11eb-819b-5e7ac904cff1.gif)

#### Debugging

代码调试这块可能并不是VS Code的强项，对于一些小的项目或者比较单一的代码段，使用默认的调试工具进行简单调试即可，某些比较大型的项目，建议还是在terminal用GDB仔细调试。

![debug](https://user-images.githubusercontent.com/7837172/99184742-18c82880-2780-11eb-9e9c-54c8c98c8bc9.gif)

## Remote-SSH

相对于本地调试，更多时候我们可能需要在远程服务器上进行实验与开发工作，这个时候 Remote-SSH 这个神器就体现出它的优越性了

### SSH Key

SSH的连接，主要有如下三种情况：

- **SSH直连**: 比较懒惰的做法就是ssh直连到实验室的服务器上，这样每次输入账号密码就行了
- **免密登录**: 稍微舒服一点的做法是配置一下 ssh key ，做到免密登录
    - [generate a new ssh-key](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
- **Jump跳板机**: 通过配置 ``ProxyCommand`` 或者 ``ProxyJump`` ，实现跳过堡垒机/跳板机, 关于如何配置 ProxyCommand/ProxyJump，推荐两篇文章给大家，分别对应Windows和Linux，这里我就不展开了
    - [VSCode Remote ssh跳板机配置(windows)](https://zhuanlan.zhihu.com/p/103578899) 
        - 虽然我不推荐使用windows作为日常开发的系统
    - [SSH 通过跳板机直接访问内网机器(Linux/Mac OSX)](https://zhuanlan.zhihu.com/p/74193910)


```bash
# 直连，设置HostName 和 User 即可
Host v100-dota2
    HostName v100.dota2-ai.com
    User bigballon

# 再加上 IdentityFile 即可实现免密登录
Host 3090-dota2
    HostName rtx3090.dota2-ai.com
    User bigballon
    IdentityFile ~/.ssh/id_ed25519_RTX3090

# 再配置 ProxyJump 实现Jump跳板机
Host dota2-ai-lab
    HostName lab.dota2-ai.com
    User bg
    IdentityFile ~/.ssh/id_ed25519_dota2
    ProxyJump bg@jump.dota2-ai.com
    # ProxyJump 或 ProxyCommand 都可以
    # 使用 ProxyJump 需要 OpenSSH > 7.3 才可以使用

```

![ssh-key](https://gitee.com/bigballon/images/raw/master/img/SS.jpg)

### More Features

Remote-SSH的功能 远不止 通过SSH方式连接远程服务器 这么简单:

- 在remote端安装对应的extension
- 选择remote端的interpreter
- 与remote连接上的terminal，

可以到达与本地几乎完全相同的使用体验，甚至可以直接右键单击文件或文件夹进行下载, 将文件或文件夹拖拽进VS Code进行上传，这样你无需再开启filezilla之类的传输工具，
而VS Code自带的终端，也同步连接至远程服务器，而且支持多开，分屏等功能，几乎所有的操作都可以在VS Code中完成

![rsh](https://gitee.com/bigballon/images/raw/master/img/Snipaste_rsh.jpg)

![extension1](https://gitee.com/bigballon/images/raw/master/img/Snipaste_is1.jpg)

![extension2](https://gitee.com/bigballon/images/raw/master/img/Snipaste_is2.jpg)

![interpreter](https://gitee.com/bigballon/images/raw/master/img/Snipaste_hj.jpg)

![overview](https://gitee.com/bigballon/images/raw/master/img/Snipaste_qb.jpg)

至此，你拥有了一个通用且较为舒适的 VS Code 开发环境，
无论是对于本地还是远程服务器的开发，配置同步，还是语法检查/自动格式化与代码调试，甚至是文件上传下载终端操作等功能，它都是舒心的。
那么接下来，全心投入到你的学习和研究与工作中去吧。

Do not cry for what you have lost, cherish for what you have experienced.
