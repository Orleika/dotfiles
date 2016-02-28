#!/bin/bash
set -eu

plugins=(.zplug .enhancd)
for dir in ${plugins[@]}; do
    if [ -d ~/${dir} ]; then
        rm -Rf ~/${dir}
    fi
done

dotfiles=(.zshrc .zprofile .exports .aliases .functions .gitconfig .editorconfig)
for file in ${dotfiles[@]}; do
    if [ -f ~/${file} ]; then
        rm ~/${file}
    fi
done

if [ -f ~/bin/lessfilter ]; then
    rm ~/bin/lessfilter
fi
