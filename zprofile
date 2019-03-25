alias h="hostname"
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias q='exit'

# find
alias fd='find . -type d -name'
alias ff='find . -type f -name'

# ruby aliases
alias be="bundle exec "
alias rs="echo rails server; bundle exec rails server"
alias rc="echo rails console; bundle exec rails console"

# autoload functions
if [[ -d $HOME/.functions ]]; then
  for fn in $(find $HOME/.functions -type f); do
    autoload -Uz $(basename $fn)
  done
fi
