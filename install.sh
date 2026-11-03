#!/bin/bash

# commands {{{
is_mac () {
  [[ "$(uname -s)" == "Darwin" ]]
}

is_linux() {
  [[ "$(uname -s)" == "Linux" ]]
}

check_install () {
  for exe in "$@"; do
    if ! command -v $exe &> /dev/null; then
      if is_mac; then
        HOMEBREW_NO_AUTO_UPDATE=1 brew install $exe
      elif is_linux; then
        sudo apt-get install -y $exe
      else
        echo "Unknown OS"
      fi
    fi
  done
}

prun () {
  cmd="$@"
  printf "\033[0;32m$ $cmd\033[0m\n"
  eval "$cmd"
}

print_help () {
  echo "Usage: $0 [options]"
  echo ""
  echo "Options:"
  echo "  --ycm       Build and install YouCompleteMe"
  echo "  -h, --help  Show this help message and exit"
}
# }}} commands

# Configuration
isYCM=0 # Install YCM
if is_linux; then
  distribution=`lsb_release -a 2> /dev/null | grep Description | sed 's|Description:[\t ]*||g'`
fi

for arg in "$@"; do
  case "$arg" in
    --ycm)
      isYCM=1
      ;;
    -h|--help)
      print_help
      exit 0
      ;;
    *)
      echo "Unknown option: $arg"
      print_help
      exit 1
      ;;
  esac
done

prun check_install vim curl git wget
if is_mac; then
  prun check_install llvm
elif is_linux; then
  prun check_install clangd
fi

# use vundle to manage plugins
vundlepath=${HOME}/.vim/bundle/Vundle.vim
if [ ! -d $vundlepath ]; then
    prun git clone https://github.com/VundleVim/Vundle.vim.git $vundlepath
fi

prun ln -sf `pwd`/settings.vimrc ~/.vimrc
prun mkdir -p ~/.vim/plugin
for f in `pwd`/plugin/*.vim; do
    prun ln -sf $f ~/.vim/plugin
done

prun mkdir -p ~/.vim/colors
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
  if is_linux; then
    prun check_install build-essential cmake vim-nox python3-dev
  elif is_mac; then
    prun check_install cmake python@3.14
  fi
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
