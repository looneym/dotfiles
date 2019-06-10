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

export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

################################################################################
#
#  Source additional profile files
#
################################################################################

source ~/.transient
source ~/.aliases

################################################################################
#
#  Seperator to keey auto-added junk away from my settings
#
################################################################################

source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
PS1="
$PS1 \


 🐧 λ "

eval "$(intercom-profile)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source $(which assume-role)
export ss=~/.ssh

function role {
  account=$(jq -r 'keys[]' ~/.aws/accounts | peco)
  assume-role $account team-dev-infra $(get-bastion-otp)
}
