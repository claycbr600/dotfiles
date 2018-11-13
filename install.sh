#!/usr/bin/env bash

# check if oh-my-zsh installed
if [ -f $HOME/.oh-my-zsh/oh-my-zsh.sh ]; then
  echo "Oh My Zsh already installed"
else
  echo "Install Oh My Zsh first with:"
  printf "$ sh -c \"\$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)\"\n\n"
  exit
fi

# link dotfiles
filename=zprofile
file="$HOME/.$filename"
if [[ -f $file ]]; then
  echo "$file exists"
  if egrep -q "source.+$filename$" $file; then
    echo "  -- $filename already sourced"
  else
    echo "  -- sourcing $HOME/.dotfiles/$filename"
    echo "source $HOME/.dotfiles/$filename" | cat - $file | tee $file > /dev/null
  fi
else
  echo "$file does not exist"
    echo "  -- sourcing $HOME/.dotfiles/$filename"
  echo "source $HOME/.dotfiles/$filename" > $file
fi

filenames=('vimrc' 'gitconfig' 'gemrc' 'zshrc');
for filename in "${filenames[@]}"; do
  echo "linking $filename"
  ln -sf $HOME/.dotfiles/$filename $HOME/.$filename
done

# clone Vundle
# if [ -d $HOME/.vim/bundle/Vundle.vim ]; then
#   echo "Vundle already installed"
# else
#   echo "cloning vundle to $HOME/.vim/bundle/Vundle.vim"
#   git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
# fi

# notes
echo "Don't forgot! Install Vundle and Plugins"
echo "  run Vundle :PluginInstall"
echo "  YouCompleteMe install.py --clang-completer"
