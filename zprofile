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

# ruby aliases
alias be='bundle exec'
alias bes='bundle exec spring'
alias rc='echo bundle exec spring rails console; bes rails c'
alias rs='echo bundle exec spring rails server; bes rails s'
alias mux='tmuxinator'

# sql
alias psql='psql -P pager=off'

# autoload functions
if [[ -d $HOME/.functions ]]; then
  for fn in $(find -L $HOME/.functions -type f); do
    autoload -Uz $(basename $fn)
  done
fi
# vim:ft=zsh:
