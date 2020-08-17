cp ./.vimrc ~/.vimrc
sudo apt-get install vim -y
mkdir -p ~/.vim/colors 
cp ./color/molokai.vim ~/.vim/colors/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle
vim +PluginInstall +qall

# for Plugin 'godlygeek/tabular'
sudo apt-get install ctags -y

# for Plugin 'suan/vim-instant-markdown'
sudo apt install npm -y
sudo npm -g install instant-markdown-d -y

# for Plugin 'vim-airline/vim-airline'
sudo apt-get install fonts-powerline
