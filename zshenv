export EDITOR=vi
export BC_ENV_ARGS=$HOME/.bcrc
export SHELL=/usr/local/bin/zsh

# path
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:/usr/local/opt/qt@5.5/bin"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="$HOME/bin:$PATH"

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
