Vundle Setteing
===

###### tags: `guide` `my_vim`

## 1. Install Vundle
    sudo apt-get install git curl
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

#### plugin 安裝
    vim +PluginInstall +qall


## 2. [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)

#### 自動補全

`sudo apt-get install build-essential cmake`
`sudo apt-get install python-dev`
`sudo apt install python3-pip`  
`cd ~/.vim/bundle/YouCompleteMe` 移到其他資料夾

##### C family補全
`./install.sh --clang-completer`

##### 不需要C family補全i
`./install.sh`

##### 更新python
`~/.vim/bundle/YouCompleteMeinstall.py`
`sudo apt install build-essential cmake python3-dev`



## 3. [NERD Commenter](https://github.com/scrooloose/nerdcommenter)

- Comment functions so powerful—no comment necessary.
#### add in .vimrc
`Plugin 'scrooloose/nerdcommenter'`


<br>

## 4. [Vim-Airline](https://github.com/vim-airline/vim-airline)

- Lean & mean status/tabline for vim that's light as air.

#### add in .vimrc
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'

#### 下載Powerline字型
```
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
```

#### 將 PowerlineSymbols.otf 這個字型放進自己的字型目錄
```
mv PowerlineSymbols.otf ~/.fonts/
```

#### 更新字型快取：
```
fc-cache -vf ~/.fonts/
```

#### 將字型設定檔放進適當的目錄：
```
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
```

#### 在`~/.bashrc`中加入下面這段程式碼：
```
POWERLINE_SCRIPT=/usr/share/powerline/bindings/bash/powerline.sh
if [ -f $POWERLINE_SCRIPT ]; then
  source $POWERLINE_SCRIPT
fi
```

#### 安裝 Powerline
```
sudo apt-get install powerline
```
