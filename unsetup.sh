#!/bin/bash

cd ~

declare -a dotfiles=(".vimrc"
    ".vim"
    ".tmux.conf")

for dotfile in "${dotfiles[@]}"
do
    DESTFILE=$HOME/$dotfile

    if [ -f $DESTFILE ];
    then
        rm -r $DESTFILE
    fi
done

