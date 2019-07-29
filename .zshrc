################################################################################
#
#  zsh/oh-my-zsh config stuff
#
################################################################################

export ZSH=~/.oh-my-zsh
ZSH_THEME="looneym"
# ZSH_THEME="robbyrussell"
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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source $(which assume-role)
export ss=~/.ssh


# eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"


eval "$(intercom-profile)"
# This needs to be at the start of the path so that it finds python there and not from pyenv
export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
