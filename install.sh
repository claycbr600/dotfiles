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
