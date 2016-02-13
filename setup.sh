sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

curl -fLo ~/.zplug/zplug --create-dirs https://git.io/zplug
git clone https://github.com/milkbikis/powerline-shell ~/.powerline-shell
cd ~/.powerline-shell/;./install.sh

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.30.2/install.sh | sh

# symlinks
if [ -f ~/.zshrc ]; then
  rm ~/.zshrc
fi
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.zprofile ~/.zprofile
ln -s ~/dotfiles/.aliases ~/.aliases
ln -s ~/dotfiles/.aliases ~/.exports
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.editorconfig ~/.editorconfig
