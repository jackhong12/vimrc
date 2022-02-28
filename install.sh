#!/bin/bash

is_mute=false
for i in $*; do
    if [ $i == "-mute" ]
    then
        is_mute=true
    fi
done

sudo apt-get install vim curl git -y

# plugin manager
git clone https://github.com/VundleVim/Vundle.vim.git ${HOME}/.vim/bundle/vundle

# color scheme setting
mkdir -p ${HOME}/.vim/colors
cp ./color/molokai.vim ${HOME}/.vim/colors/

# for Plugin 'godlygeek/tabular'
sudo apt-get install ctags -y

# for Plugin 'suan/vim-instant-markdown'
#sudo apt install npm -y
#sudo npm -g install instant-markdown-d -y

# for Plugin 'vim-airline/vim-airline'
sudo apt-get install fonts-powerline -y

# copyclip
#sudo apt-get install vim-gnome -y
sudo apt-get install vim-gtk -y


# configuration file
# .vimrc
cp ./setting.vim ${HOME} 
echo "source ${HOME}/setting.vim" > ${HOME}/.vimrc
if $is_mute
then
    vim +PluginInstall +qall &>/dev/null
else
    vim +PluginInstall +qall
fi

# YCM
sudo apt-get install build-essential cmake vim-nox python3-dev -y
sudo apt-get install mono-complete golang nodejs default-jdk npm -y
cd ${HOME}/.vim/bundle/YouCompleteMe && python3 install.py --clangd-completer
