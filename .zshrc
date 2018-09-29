################################################################################
#
#  zsh/oh-my-zsh config stuff
#
################################################################################

export ZSH=~/.oh-my-zsh
ZSH_THEME="looneym"
source $ZSH/oh-my-zsh.sh
export TERM=xterm-256color
plugins=(
  git
  rbenv
  ruby
)
autoload -U compinit && compinit

################################################################################
#
#  Misc
#
################################################################################

export PATH=$PATH:~/dotfiles/bin
export PATH=$PATH:~/.fzf/bin
export EDITOR=vim
# load machine-specific config
source ~/.transient

################################################################################
#
#  Aliases
#
################################################################################

# manipulate dotfiles
alias te='vim ~/.transient.zshrc' 
alias ze='vim ~/.zshrc'
alias zs='source ~/.zshrc && echo Succesfully reloaded .zshrc! 🎉'

# Git
alias gb="git branch"
alias gca="git commit --amend --no-edit"
alias gcae="git commit --amend"
alias gcm="git commit"
alias gco="git checkout"
alias gd="echo 'Comparing changes against previous local commit' && git difftool"
alias gdm="echo 'Comparing changes against origin/master' &&git difftool origin/master"
alias gfa="git fetch --all"
alias glo="git log --oneline"
alias gs="git status"

# What's my ip?
alias eip='curl ipinfo.io/ip'
alias iip="ipconfig getifaddr en0"

# This must be loaded last
plugins=( zsh-syntax-highlighting)

################################################################################
#
#  Seperator to keey auto-added junk away from my settings
#
################################################################################
