#!/bin/bash
set -eu

dotfiles_dir=$(cd $(dirname $0) && pwd)

plugins=(.zplug .enhancd)
for dir in ${plugins[@]}; do
    if [ -d ~/${dir} ]; then
        rm -Rf ~/${dir}
    fi
done

dotfiles=`find $dotfiles_dir -maxdepth 1 -type f -name ".*"`
for file in $dotfiles; do
    if [ -f ~/${file##*/} ]; then
        rm ~/${file##*/}
    fi
done

binaries=`find ${dotfiles_dir}/bin -maxdepth 1 -type f`
for file in $binaries; do
    if [ -f ~/bin/${file##*/} ]; then
        rm ~/bin/${file##*/}
    fi
done
