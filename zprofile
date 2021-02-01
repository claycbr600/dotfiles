# system
alias h="hostname"
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias pgrep='pgrep -l'

# key bindings
bindkey '^O' autosuggest-accept   # autosuggestion
bindkey -M viins 'jk' vi-cmd-mode # vi-mode

# find
alias fd='find . -type d -name'
alias ff='find . -type f -name'

# run-help
unalias run-help 2> /dev/null
autoload run-help
alias help='run-help'

# command aliases
alias pg.server='pg_ctl -D /usr/local/var/postgres'
alias psql='psql -P pager=off'
alias umount='diskutil unmount'
alias todo='ultralist'

# ruby aliases
alias be='bundle exec'
alias bes='bundle exec spring'
alias rc='echo bundle exec spring rails console; bes rails c'
alias rs='echo bundle exec spring rails server; bes rails s'

# chruby
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
chruby 2.7.1
alias rubies='chruby'

if command -v pyenv &> /dev/null; then
  eval "$(pyenv init -)"
fi

# autoload functions
if [[ -d $HOME/.functions ]]; then
  for fn in $(find -L $HOME/.functions -type f); do
    autoload -Uz $(basename $fn)
  done
fi

# use neovim if installed
if type nvim &> /dev/null; then
    alias vim='nvim'
fi
# vim:ft=zsh:
