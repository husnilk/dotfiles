#!/bin/bash

# Download configuration

git clone https://github.com/husnilk/dotfiles ~/.dotfiles
cd ~/.dotfiles

# Install Basic file configuration
declare -a dotfiles=(".vimrc"
    ".vim"
    ".tmux.conf")

for dotfile in "${dotfiles[@]}"
do
    SOURCEFILE=$HOME/.dotfiles/$dotfile
    DESTFILE=$HOME/$dotfile

    if [ -f $DESTFILE ];
    then
        mv $DESTFILE $DESTFILE.bak
    fi
    ln -s $SOURCEFILE $DESTFILE
done

# Install VIM theme atom-dark
curl -fLo ~/.dotfiles/.vim/colors/atom-dark-256.vim --create-dirs \
	https://raw.githubusercontent.com/gosukiwi/vim-atom-dark/master/colors/atom-dark-256.vim


curl -fLo ~/.dotfiles/.vim/colors/atom-dark.vim --create-dirs \
	https://raw.githubusercontent.com/gosukiwi/vim-atom-dark/master/colors/atom-dark.vim

#Install VIM plugin
git submodule init

git submodule add https://github.com/junegunn/fzf.git .vim/pack/plugins/start/fzf
git add .gitmodules .vim/pack/plugins/start/fzf

git submodule add https://github.com/junegunn/fzf.vim.git .vim/pack/plugins/start/fzf.vim
git add .gitmodules .vim/pack/plugins/start/fzf.vim

git submodule add https://github.com/tpope/vim-vinegar.git .vim/pack/plugins/start/vim-vinegar
git add .gitmodules .vim/pack/plugins/start/vim-vinegar

git submodule add https://github.com/scrooloose/nerdtree.git .vim/pack/plugins/start/nerdtree
git add .gitmodules .vim/pack/plugins/start/nerdtree

git submodule add https://github.com/vim-airline/vim-airline.git .vim/pack/plugins/start/vim-airline
git add .gitmodules .vim/pack/plugins/start/vim-airline

git commit
