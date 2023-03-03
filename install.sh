#!/bin/bash

check_install () {
    for exe in "$@"; do
        if ! command -v $exe &> /dev/null; then
            sudo apt-get install -y $exe
        fi
    done
}

check_install vim curl git

# use vundle to manage plugins
vundlepath=${HOME}/.vim/bundle/vundle
if [ ! -d $vundlepath ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git $vundlepath
fi

ln -sf `pwd`/.vimrc ~/.vimrc
mkdir ~/.vim/plugin -p
for f in `pwd`/plugin/*.vim; do
    ln -sf $f ~/.vim/plugin 
done
mkdir ~/.vim/colors -p
for f in `pwd`/colors/*.vim; do
    ln -sf $f ~/.vim/colors
done

vim +PluginInstall +qall
