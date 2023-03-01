#!/bin/bash

mkdir ~/.vim/plugin -p

for f in `pwd`/plugin/*.vim; do
    ln -sf $f ~/.vim/plugin 
    echo $f
done

vim +PluginInstall +qall
