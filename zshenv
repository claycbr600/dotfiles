export EDITOR=vi
export BC_ENV_ARGS=$HOME/.bcrc
export SHELL=/usr/local/bin/zsh
export LESS=-Ri

# path
PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin
PATH=$PATH:/usr/local/opt/qt@5.5/bin
PATH=/usr/local/opt/openssl/bin:$PATH
export PATH=$HOME/bin:$PATH

# load function dirs into fpath
if [[ -d $HOME/.functions ]]; then
  for dir in $(find $HOME/.functions -type d); do
    fpath=($dir $fpath)
  done
  export fpath
fi

# irb
export IRBRC=~/.irbrc

# tmux
export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_AUTOSTART_ONCE=false
export ZSH_TMUX_AUTOCONNECT=false
export ZSH_TMUX_AUTOQUIT=true
