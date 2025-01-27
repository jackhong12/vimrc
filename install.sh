#!/bin/bash

# Configuration
isYCM=1 # Install YCM

distribution=`lsb_release -a 2> /dev/null | grep Description | sed 's|Description:[\t ]*||g'`

# commands {{{
check_install () {
  for exe in "$@"; do
    if ! command -v $exe &> /dev/null; then
      sudo apt-get install -y $exe
    fi
  done
}

prun () {
  cmd="$@"
  printf "\033[0;32m$ $cmd\033[0m\n"
  eval "$cmd"
}
# }}} commands

prun check_install vim curl git wget

# use vundle to manage plugins
vundlepath=${HOME}/.vim/bundle/vundle
if [ ! -d $vundlepath ]; then
    prun git clone https://github.com/VundleVim/Vundle.vim.git $vundlepath
fi

prun ln -sf `pwd`/.vimrc ~/.vimrc
mkdir ~/.vim/plugin -p
for f in `pwd`/plugin/*.vim; do
    prun ln -sf $f ~/.vim/plugin
done

prun mkdir ~/.vim/colors -p
for f in `pwd`/colors/*.vim; do
    prun ln -sf $f ~/.vim/colors
done

prun vim +PluginInstall +qall

# Create cache folder
prun mkdir -p ~/.cache/vim/backup
prun mkdir -p ~/.cache/vim/swap
prun mkdir -p ~/.cache/vim/undo

# Build YCM
if [ $isYCM -eq 1 ]; then
  prun check_install build-essential cmake vim-nox python3-dev
  prun pushd ~/.vim/bundle/YouCompleteMe
  prun ./install.py --clangd-completer
  prun popd
fi

# install fonts
if [[ $distribution = 'Ubuntu 22.04.'*'LTS' ]] || [[ $distribution = 'Ubuntu 22.04.'*'LTS' ]]; then
    mkdir ~/.fonts -p
    cp fonts/UbuntuMonoNerdFont-Regular.ttf ~/.fonts
    printf "\033[0;34mChange terminal fonts: \n"
    printf "    Preferences > Unamed > Custom font > UbuntuMono Nerd Font Mono\033[0m\n"
else
    echo "Install fonts from https://github.com/ryanoasis/nerd-fonts"
fi
