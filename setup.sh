#!/bin/sh
set -eu -o pipefail

dotfiles_dir=$(cd "$(dirname "$0")" && pwd)

# symlinks
dotfiles=$(find "$dotfiles_dir" -maxdepth 1 -type f -name ".*")
for file in $dotfiles; do
    if [ -f ~/"${file##*/}" ]; then
        rm ~/"${file##*/}"
    fi
    ln -s "${file}" ~/"${file##*/}"
done
if [ ! -d ~/bin ]; then
    mkdir ~/bin
fi
binaries=$(find "${dotfiles_dir}"/bin -maxdepth 1 -type f)
for file in $binaries; do
    if [ -f ~/bin/"${file##*/}" ]; then
        rm ~/bin/"${file##*/}"
    fi
    ln -s "${file}" ~/bin/"${file##*/}"
done
if [ ! -d ~/.ssh ]; then
    mkdir ~/.ssh
fi
sshfiles=$(find "${dotfiles_dir}"/.ssh -maxdepth 1 -type f)
for file in $sshfiles; do
    install -m 0600 "${file}" ~/.ssh/"${file##*/}"
done

# install zplug
# shellcheck source=/dev/null
. "$dotfiles_dir"/.exports
git clone https://github.com/zplug/zplug "$ZPLUG_HOME"
