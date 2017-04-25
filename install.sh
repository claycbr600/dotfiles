#!/usr/bin/env bash

files=('gemrc' 'vimrc' 'zprofile' 'zshrc');
for file in "${files[@]}"; do
  echo "linking $HOME/.dotfiles/$file -> $HOME/.$file"
  ln -sf $HOME/.dotfiles/$file $HOME/.$file
done
