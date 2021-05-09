#!/bin/bash

sudo apt-get install vim -y
sudo apt-get install curl -y
sudo apt-get install git -y

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
echo "source $(pwd)/setting.vim" > ${HOME}/.vimrc
vim +PluginInstall +qall

# YCM
sudo apt-get install build-essential cmake vim-nox python3-dev -y
sudo apt-get install mono-complete golang nodejs default-jdk npm -y
#cd ${HOME}/.vim/bundle/YouCompleteMe && python3 install.py --all
