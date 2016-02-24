#!/bin/sh

# setup zsh
chsh -s /usr/bin/zsh

# install zplug
curl -fLo ~/.zplug/zplug --create-dirs https://git.io/zplug

# symlinks
if [ -f ~/.zshrc ]; then
  rm ~/.zshrc
fi
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.zprofile ~/.zprofile
ln -s ~/dotfiles/.exports ~/.exports
ln -s ~/dotfiles/.aliases ~/.aliases
ln -s ~/dotfiles/.functions ~/.functions
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.editorconfig ~/.editorconfig
if [ ! -e ~/bin ]; then
  mkdir ~/bin
fi
ln -s ~/dotfiles/lessfilter ~/bin/lessfilter;chmod 755 ~/bin/lessfilter
