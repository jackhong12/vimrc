#!/bin/bash

distribution=`lsb_release -a 2> /dev/null | grep Description | sed 's|Description:[\t ]*||g'`

check_install () {
    for exe in "$@"; do
        if ! command -v $exe &> /dev/null; then
            sudo apt-get install -y $exe
        fi
    done
}

check_install vim curl git wget

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

mkdir -p ~/.cache/vim/backup
mkdir -p ~/.cache/vim/swap
mkdir -p ~/.cache/vim/undo

# install fonts
if [[ $distribution = 'Ubuntu 22.04.'*'LTS' ]] || [[ $distribution = 'Ubuntu 22.04.'*'LTS' ]]; then
    mkdir ~/.fonts -p
    cp fonts/UbuntuMonoNerdFont-Regular.ttf ~/.fonts
    printf "\033[0;34mChange terminal fonts: \n"
    printf "    Preferences > Unamed > Custom font > UbuntuMono Nerd Font Mono\033[0m\n"
else
    echo "Install fonts from https://github.com/ryanoasis/nerd-fonts"
fi
