#!/usr/bin/env bash

# dependencies
if ! type brew &> /dev/null; then
  echo "homebrew is required"
  exit
fi

os=${1:-macos}

# zsh
if brew list | grep zsh &> /dev/null; then
  echo "homebrew zsh already installed"
else
  echo "installing homebrew zsh..."
  brew install zsh
  sleep 3

  echo "linking zsh config files..."
  files=(zlogin zshenv)
  for f in "${files[@]}"; do
    echo "~/.dotfiles/$os/$f -> .$f"
    ln -sf ~/.dotfiles/$os/$f ~/.$f
  done

  echo "zsh install complete"
fi

# tmux
if brew list | grep tmux &> /dev/null; then
  echo "tmux is installed"
else
  echo "installing tmux..."
  brew install tmux
  echo "linking tmux.conf..."
  ln -sf ~/.dotfiles/$os/tmux.conf ~/.tmux.conf
fi

# functions
if [[ -d ~/.functions ]]; then
  echo "functions already installed"
else
  mkdir ~/.functions

  echo "linking function dirs..."
  funcs=(ruby sh system)
  for f in "${funcs[@]}"; do
    echo "~/.dotfiles/functions/$f -> ~/.functions/$f"
    ln -sf ~/.dotfiles/functions/$f ~/.functions/$f
  done
fi

# oh-my-zsh
if [[ -d ~/.oh-my-zsh ]]; then
  echo "oh-my-zsh already installed"
else
  curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O
  sed -i .bak '/exec zsh -l/d' install.sh
  sh install.sh
  sleep 3

  echo "add zsh completions"
  ln -sf ~/.dotfiles/oh-my-zsh/completions/$os ~/.oh-my-zsh/completions

  echo "installing zsh plugins"
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

  echo "linking zsh custom plugins"
  files=(git terraform tmux vi-mode)
  for f in "${files[@]}"; do
    echo "~/.dotfiles/oh-my-zsh/custom/plugins/$f -> ~/.oh-my-zsh/custom/plugins/$f"
    ln -sf ~/.dotfiles/oh-my-zsh/custom/plugins/$f ~/.oh-my-zsh/custom/plugins/$f
  done

  ln -sf ~/.dotfiles/$os/zshrc ~/.zshrc
  echo "oh-my-zsh install complete"
fi
