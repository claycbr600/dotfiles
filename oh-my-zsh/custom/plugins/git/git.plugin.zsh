# Query/use custom command for `git`.
zstyle -s ":vcs_info:git:*:-all-" "command" _omz_git_git_cmd
: ${_omz_git_git_cmd:=git}

#
# Functions
#

# The name of the current branch
# Back-compatibility wrapper for when this function was defined here in
# the plugin, before being pulled in to core lib/git.zsh as git_current_branch()
# to fix the core -> git plugin dependency.
function current_branch() {
  git_current_branch
}
# The list of remotes
function current_repository() {
  if ! $_omz_git_git_cmd rev-parse --is-inside-work-tree &> /dev/null; then
    return
  fi
  echo $($_omz_git_git_cmd remote -v | cut -d':' -f 2)
}
# Pretty log messages
function _git_log_prettily(){
  if ! [ -z $1 ]; then
    git log --pretty=$1
  fi
}
# Warn if the current branch is a WIP
function work_in_progress() {
  if $(git log -n 1 2>/dev/null | grep -q -c "\-\-wip\-\-"); then
    echo "WIP!!"
  fi
}

# Check if main exists and use instead of master
function git_main_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  local ref
  for ref in refs/{heads,remotes/{origin,upstream}}/{main,trunk}; do
    if command git show-ref -q --verify $ref; then
      echo ${ref:t}
      return
    fi
  done
  echo master
}

#
# Aliases
# (sorted alphabetically)
#

alias g='git'

# git add
alias ga='git add'
alias gaa='git add --all'
alias gap='git add --patch'
alias gau='git add --update'
alias gapp='git apply'

# git branch
alias gbr='git branch'
alias gbra='git branch -a'
alias gbrd='git branch -d'
alias gbrda='git branch --no-color --merged | command grep -vE "^(\*|\s*($(git_main_branch)|develop|dev)\s*$)" | command xargs -n 1 git branch -d'
alias gbrm='git branch --merged'
alias gbrnm='git branch --no-merged'
alias gbrr='git branch --remote'

# git bisect
alias gbs='git bisect'
alias gbsb='git bisect bad'
alias gbsg='git bisect good'
alias gbsr='git bisect reset'
alias gbss='git bisect start'

# git blame
alias gbl='git blame -b -w'

# git commit
alias gci='git commit -v'
alias gci!='git commit -v --amend'
alias gcin!='git commit -v --no-edit --amend'
alias gcia='git commit -v -a'
alias gcia!='git commit -v -a --amend'
alias gcian!='git commit -v -a --no-edit --amend'
alias gcians!='git commit -v -a -s --no-edit --amend'
alias gciam='git commit -a -m'
alias gcism='git commit -s -m'
alias gcim='git commit -m'

# git checkout
alias gco='git checkout'

# git config
alias gconf='git config --list'
alias gcso='git config --get remote.origin.url'

# git clone
alias gcl='git clone --recurse-submodules'

# git clean
alias gclean='git clean -id'

# git reset
alias gpristine='git reset --hard && git clean -dfx'

# git count
alias gcount='git shortlog -sn'
compdef _git gcount

# git cherry-pick
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'

# git diff
alias gd='git diff'
alias gdca='git diff --cached'
alias gdch='git diff --check'
alias gds='git diff --staged'
alias gdt='git diff-tree --no-commit-id --name-only -r'
alias gdw='git diff --word-diff'

# git describe
alias gdesct='git describe --tags `git rev-list --tags --max-count=1`'

gdv() { git diff -w "$@" | view - }
compdef _git gdv=git-diff

# git fetch
alias gf='git fetch'
alias gfap='git fetch --all --prune'
alias gfo='git fetch origin'
alias gfpo='git fetch --prune origin'

function gfg() { git ls-files | grep $@ }
compdef _grep gfg

# git gui
alias gg='git gui citool'
alias gga='git gui citool --amend'

ggf() {
  [[ "$#" != 1 ]] && local b="$(git_current_branch)"
  git push --force origin "${b:=$1}"
}
compdef _git ggf=git-checkout

ggl() {
  if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
    git pull origin "${*}"
  else
    [[ "$#" == 0 ]] && local b="$(git_current_branch)"
    git pull origin "${b:=$1}"
  fi
}
compdef _git ggl=git-checkout

ggp() {
  if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
    git push origin "${*}"
  else
    [[ "$#" == 0 ]] && local b="$(git_current_branch)"
    git push origin "${b:=$1}"
  fi
}
compdef _git ggp=git-checkout

ggpnp() {
  if [[ "$#" == 0 ]]; then
    ggl && ggp
  else
    ggl "${*}" && ggp "${*}"
  fi
}
compdef _git ggpnp=git-checkout

ggu() {
  [[ "$#" != 1 ]] && local b="$(git_current_branch)"
  git pull --rebase origin "${b:=$1}"
}
compdef _git ggu=git-checkout

alias ggpur='ggu'
compdef _git ggpur=git-checkout

alias glob='git pull origin $(git_current_branch)'
compdef _git glob=git-checkout

alias gpuob='git push origin $(git_current_branch)'
compdef _git gpuob=git-checkout

alias gignore='git update-index --assume-unchanged'
alias gignored='git ls-files -v | grep "^[[:lower:]]"'
alias git-svn-dcommit-push='git svn dcommit && git push github $(git_main_branch):svntrunk'
compdef _git git-svn-dcommit-push=git

alias gk='\gitk --all --branches'
compdef _git gk='gitk'
alias gke='\gitk --all $(git log -g --pretty=%h)'
compdef _git gke='gitk'

# git log
alias glg='git log'
alias glog="git log --graph --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ci) %C(bold blue)<%an>%Creset' --abbrev-commit -20"
alias glgp="_git_log_prettily"
compdef _git glp=git-log

# git pull
alias gl='git pull'

# git merge
alias gm='git merge'
alias gmob='echo "git merge origin/$(git_current_branch)"; git merge origin/$(git_current_branch)'
alias gmom='git merge origin/$(git_main_branch)'
alias gmsq='git merge --squash'
alias gmt='git mergetool --no-prompt'
alias gmtvim='git mergetool --no-prompt --tool=vimdiff'
alias gmum='git merge upstream/$(git_main_branch)'

# git push
alias gpu='git push'
alias gpud='git push --dry-run'
alias gpuod='git push origin --delete'
alias gpuot='git push origin --tags'
alias gpuu='git push --set-upstream origin $(git_current_branch)'
alias gpuv='git push -v'

alias grm='git remote'
alias grmmv='git remote rename'
alias grmrm='git remote remove'
alias grmset='git remote set-url'
alias grma='git remote add'
alias grmup='git remote update'
alias grmv='git remote -v'
alias grmso="git remote show origin"
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase -i'
alias grbm='git rebase $(git_main_branch)'
alias grbom='git rebase origin/$(git_main_branch)'
alias grbs='git rebase --skip'
alias grs='git reset'
alias grsh='git reset HEAD'
alias grshh='git reset HEAD --hard'
alias grt='cd $(git rev-parse --show-toplevel || echo ".")'
alias grsu='git reset --'
alias grst='git restore'
alias grsts='git restore --staged'

# git stash
alias gsta='git stash push'
alias gstam='git stash push -m'
alias gstau='git stash push -u'
alias gstaum='git stash push -u -m'
alias gstaa='git stash apply'
alias gstac='git stash clear'
alias gstad='git stash drop'
alias gstal='git stash list'
alias gstap='git stash pop'
alias gstas='git stash show'
alias gstast='git stash show --text'

alias gsb='git status -sb'
alias gsd='git svn dcommit'
alias gsi='git submodule init'
alias gsps='git show --pretty=short --show-signature'
alias gsr='git svn rebase'
alias gst='git status'
alias gsts='git status -s'
alias gsu='git submodule update'
alias gsw='git switch'
alias gswc='git switch -c'
alias gswm='git switch $(git_main_branch)'

alias gts='git tag -s'
alias gtv='git tag | sort -V'

alias gunignore='git update-index --no-assume-unchanged'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'
alias gup='git pull --rebase'
alias gupv='git pull --rebase -v'
alias glum='git pull upstream $(git_main_branch)'

alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify -m "--wip-- [skip ci]"'
