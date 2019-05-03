export EDITOR=vi
export BC_ENV_ARGS=$HOME/.bcrc
export SHELL=/usr/local/bin/zsh
export LESS=-Ri
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# path
PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin
PATH=$PATH:/usr/local/opt/qt@5.5/bin
PATH=/usr/local/opt/openssl/bin:$PATH
export PATH=$HOME/bin:$PATH

# load function dirs into fpath
if [[ -d $HOME/.functions ]]; then
  for dir in $(find -L $HOME/.functions -type d); do
    fpath=($dir $fpath)
  done
  export fpath
fi

# irb
export IRBRC=~/.irbrc

# zsh syntax highligting
# declare the variable
typeset -A ZSH_HIGHLIGHT_STYLES
# To have paths colored instead of underlined
ZSH_HIGHLIGHT_STYLES[path]='fg=white'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=cyan,bold'

# zsh autoupdate
DISABLE_AUTO_UPDATE=true
