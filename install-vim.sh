#!/bin/bash

cd $(dirname $BASH_SOURCE)
BASE=$(pwd)

export GIT_SSL_NO_VERIFY=true
mkdir -p ~/.vim/autoload
curl --insecure -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim

# vimrc
mv -v ~/.vimrc ~/.vimrc.old 2> /dev/null
$HOME/.vim_env/install.sh

# nvim
mkdir -p ~/.config/nvim/autoload
ln -sf $BASE/.vimrc ~/.config/nvim/init.vim
ln -sf ~/.vim_env/autoload/plug.vim ~/.local/share/nvim/site/autoload/

vim +PlugInstall +qall

