#!/usr/bin/env bash

# link dotfiles
files=('gemrc' 'vimrc' 'zprofile' 'zshrc');
for file in "${files[@]}"; do
  echo "linking $HOME/.dotfiles/$file -> $HOME/.$file"
  ln -sf $HOME/.dotfiles/$file $HOME/.$file
done

# clone Vundle
if [ -d $HOME/.vim/bundle/Vundle.vim ]; then
  echo "Vundle already installed"
else
  echo "cloning vundle to $HOME/.vim/bundle/Vundle.vim"
  git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi

# check if oh-my-zsh installed
if [ -f $HOME/.oh-my-zsh/oh-my-zsh.sh ]; then
  echo "Oh My Zsh already installed"
else
  echo "installing Oh My Zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# link zshrc
echo "linking $HOME/.dotfiles/zshrc -> $HOME/.zshrc"
ln -sf $HOME/.dotfiles/zshrc $HOME/.zshrc
