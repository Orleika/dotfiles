#!/bin/bash
set -eu

dotfiles_dir=$(cd $(dirname $0) && pwd)

# setup zsh
chsh -s `which zsh`

# install zplug
curl -fLo ~/.zplug/zplug --create-dirs https://git.io/zplug

# symlinks
dotfiles=`find $dotfiles_dir -maxdepth 1 -type f -name ".*"`
for file in $dotfiles; do
    if [ -f ~/${file##*/} ]; then
        rm ~/${file##*/}
    fi
    ln -s ${file} ~/${file##*/}
done
if [ ! -d ~/bin ]; then
    mkdir ~/bin
fi
binaries=`find ${dotfiles_dir}/bin -maxdepth 1 -type f`
for file in $dotfiles; do
    if [ -f ~/bin/${file##*/} ]; then
        rm ~/bin/${file##*/}
    fi
    ln -s ${file} ~/bin/${file##*/}
done

# reflesh shell
exec -l $SHELL
