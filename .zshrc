################################################################################
#
#  zsh/oh-my-zsh config stuff
#
################################################################################

export ZSH=~/.oh-my-zsh
ZSH_THEME="cobalt2"
source $ZSH/oh-my-zsh.sh
plugins=(git)
export TERM=xterm-256color

################################################################################
#
#  set $PATH
#
################################################################################

export PATH=$PATH:~/dotfiles/bin

################################################################################
#
#  personal configs
#
################################################################################

export EDITOR='vim'

# load machine-specific config
source ~/.transient.zshrc

# tmuxinator stuff
export DEFAULT_USER='looneym'
alias muxc="cd ~/.config/tmuxinator/"
alias mux="tmuxinator"
export TMUXINATOR_CONFIG=$HOME/dotfiles/tmuxinator

# Set correct vim version based on OS version
osx_version=$(defaults read loginwindow SystemVersionStampAsString)
function version_gt() { test "$(printf '%s\n' "$@" | sort  | head -n 1)" != "$1"; }
yosemite=10.10.5
if version_gt $osx_version $yosemite; then
  alias vim='/usr/local/Cellar/vim/8.0.1350/bin/vim' 
else
  alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
fi
    
# manipulate dotfiles
alias tedit='vim ~/.transient.zshrc' 
alias zedit='vim ~/.zshrc'
alias zsource='source ~/.zshrc'
alias vedit='vim ~/.vimrc'
alias vsource='source ~/.vimrc'

# misc utilities
alias venvup='source venv/bin/activate'
alias venvinit='virtualenv venv && source venv/bin/activate'
alias lsdir='ls -d */'
alias procfind="ps ax | grep $1"
alias pysrv='python -m SimpleHTTPServer'
alias dirfind="find $1 -maxdepth 1 -type d -name $2 -print -quit"
alias myip='curl ipinfo.io/ip'
alias gp="git push origin `git branch | grep \* | cut -d ' ' -f2`"
