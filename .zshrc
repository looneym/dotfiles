################################################################################
#
#  zsh/oh-my-zsh config stuff
#
################################################################################

export ZSH=~/.oh-my-zsh
ZSH_THEME="looneym"
source $ZSH/oh-my-zsh.sh
export TERM=screen-256color
plugins=(
  git
)
autoload -U compinit && compinit
 export KEYTIMEOUT=1
################################################################################
#
#  Misc
#
################################################################################

export PATH=$PATH:~/dotfiles/bin
export EDITOR=vim
# Vim mode for command line editing
# bindkey -v
# load machine-specific config
source ~/.transient

export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

################################################################################
#
#  Aliases
#
################################################################################

# manipulate dotfiles
alias te='vim ~/.transient' 
alias ze='vim ~/.zshrc'
alias zs='source ~/.zshrc && echo Succesfully reloaded .zshrc! 🎉'

# Git
function git() { hub $@; }
alias gb="git branch"
alias gca="git commit --amend --no-edit"
alias gcae="git commit --amend"
alias gcm="git commit"
alias gco="git checkout"
alias gd="git difftool"
alias gdm="echo 'Comparing changes against origin/master' &&git difftool origin/master"
alias gfa="git fetch --all"
alias glo="git log --oneline"
alias gs="git status"
alias gc="git commit -m "
alias gpub="git publish | grep 'pull/new' | awk '{ print $2 }' | pbcopy && echo 'Link copied to clipboard'"
alias gzoom="gco master && git pull"
alias gzoom!="git stash && gco master && git pull"

# What's my ip?
alias eip='curl ipinfo.io/ip'
alias iip="ipconfig getifaddr en0"

alias ic="ruby ~/src/intercom/bin/intercom-cli" 
# This must be loaded last
# plugins=( zsh-syntax-highlighting )
# echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
alias scr="vim ~/notes/scratch"
alias src="cd ~/src"
alias tmp="cd ~/tmp"

# alias for dev version of bundler
alias dbundle="/Users/micheallooney/src/bundler/bin/bundle"

alias v="vim -"
alias up="cd $( pwd | awk -F/  '{project_root=""; for(i=2;i<=5;i++){project_root=project_root"/"$i}; print project_root}')"
alias noop="git checkout master && git pull && git checkout -b ml/noop && git commit --allow-empty -m \"noop\""

alias intercom="cd ~/src/intercom"
alias embercom="cd ~/src/embercom"
alias muster="cd ~/src/muster"
alias buildkite="cd ~/src/buildkite-test-pipeline/"
alias hustle="cd ~/src/hustle"

################################################################################
#
#  Seperator to keey auto-added junk away from my settings
#
################################################################################

source $HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
PS1="
$PS1 \


  λ "

eval "$(intercom-linux-env)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source $(which assume-role)
