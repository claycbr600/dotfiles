export EDITOR=vim
export BC_ENV_ARGS=$HOME/.bcrc
export PATH=$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# system aliases
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
alias rs="echo rails server; rails server"
alias rc="echo rails console; rails console"
