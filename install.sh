#!/bin/bash

ln -sf `pwd`/.vimrc ~/

mkdir -p ~/.vim/files
ln -sf `pwd`/files/vim.vim ~/.vim/files
ln -sf `pwd`/files/c.vim ~/.vim/files
