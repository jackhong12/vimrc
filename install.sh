#!/bin/bash

mkdir ~/.vim/plugin -p
for f in `pwd`/plugin/*.vim; do
    ln -sf $f ~/.vim/plugin 
done

mkdir ~/.vim/colors -p
for f in `pwd`/colors/*.vim; do
    ln -sf $f ~/.vim/colors
done

vim +PluginInstall +qall
