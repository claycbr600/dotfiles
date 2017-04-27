export EDITOR=vim

# remap cursor movement on CLI
bindkey "^l" forward-char
bindkey "^h" backward-char
bindkey "^f" forward-word
bindkey "^b" backward-word

# system aliases
alias h="hostname"
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ls="ls -G"

# ruby
alias be="bundle exec "

# run-help
unalias run-help 2> /dev/null
autoload run-help
alias help='run-help'

# include functions
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
