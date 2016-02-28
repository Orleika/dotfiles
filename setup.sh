#!/bin/bash
set -eu

# setup zsh
chsh -s `which zsh`

# install zplug
curl -fLo ~/.zplug/zplug --create-dirs https://git.io/zplug

# symlinks
dotfiles=(.zshrc .zprofile .exports .aliases .functions .gitconfig .editorconfig)
for file in ${dotfiles[@]}; do
    if [ -f ~/${file} ]; then
        rm ~/${file}
    fi
    ln -s ~/dotfiles/${file} ~/${file}
done
if [ ! -d ~/bin ]; then
    mkdir ~/bin
fi
if [ -f ~/bin/lessfilter ]; then
    rm ~/bin/lessfilter
fi
ln -s ~/dotfiles/lessfilter ~/bin/lessfilter

# reflesh shell
exec -l $SHELL
