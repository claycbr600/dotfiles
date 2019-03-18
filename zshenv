export EDITOR=vi
export BC_ENV_ARGS=$HOME/.bcrc

# path
PATH=$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH="$PATH:$HOME/.rvm/bin"

# load function dirs into fpath
for dir in $(find $HOME/.functions -type d); do
  fpath=($dir $fpath)
done
export fpath

# irb
export IRBRC=~/.irbrc

# tmux
export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_AUTOSTART_ONCE=false
export ZSH_TMUX_AUTOCONNECT=false
export ZSH_TMUX_AUTOQUIT=true
