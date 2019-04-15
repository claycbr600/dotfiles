# vi: set ft=sh:
alias h="hostname"
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias q='exit'

# key bindings
bindkey '^O' autosuggest-accept   # autosuggestion
bindkey -M viins 'jk' vi-cmd-mode # vi-mode
bindkey '^\' clear-screen         # clear screen

# find
alias fd='find . -type d -name'
alias ff='find . -type f -name'

# ruby aliases
alias be="bundle exec "
alias rs="echo be rails server; bundle exec rails server"
alias rc="echo be rails console; bundle exec rails console"

# chruby
alias rubies='chruby'
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
chruby 2.6.2

# autoload functions
if [[ -d $HOME/.functions ]]; then
  for fn in $(find $HOME/.functions -type f); do
    autoload -Uz $(basename $fn)
  done
fi
