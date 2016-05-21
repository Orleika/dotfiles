#!/bin/bash
set -eu

dotfiles_dir=$(cd $(dirname $0) && pwd)

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

# install zplug
source $dotfiles_dir/.exports
curl -fsL git.io/zplug | zsh

# reflesh shell
exec -l $SHELL
