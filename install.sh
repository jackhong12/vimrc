#!/bin/bash

root_conf="${HOME}/.vimrc"

if [ -z "$1" ]
then
	path="${HOME}/vim_setting"
	rm -rf $path
	git clone https://github.com/gpakosz/.tmux.git $path > /dev/null 2>&1 || exit 1
else
	path="${1}"
fi

set -x
sudo apt-get install vim -y
# plugin manager
git clone https://github.com/VundleVim/Vundle.vim.git "${HOME}/.vim/bundle/vundle"

# for Plugin 'godlygeek/tabular'
sudo apt-get install ctags -y

# for Plugin 'suan/vim-instant-markdown'
sudo apt install npm -y
sudo npm -g install instant-markdown-d -y

# for Plugin 'vim-airline/vim-airline'
sudo apt-get install fonts-powerline -y

# copyclip
#sudo apt-get install vim-gnome -y
sudo apt-get install vim-gtk -y

# color scheme setting
mkdir -p ~/.vim/colors
cp ./color/molokai.vim ~/.vim/colors/

# configuration file
# .vimrc
echo "source ${path}/setting.vim" > $root_conf
vim +PluginInstall +qall
