################################################################################
#
#  zsh/oh-my-zsh config stuff
#
################################################################################

export ZSH=~/.oh-my-zsh
ZSH_THEME="cobalt2"
source $ZSH/oh-my-zsh.sh
export TERM=xterm-256color
plugins=(
  git
  bundler
  dotenv
  osx
  rbenv
  ruby
)
 autoload -U compinit && compinit
# zmodload -i zsh/complist
################################################################################
#
#  set $PATH
#
################################################################################

export PATH=$PATH:~/dotfiles/bin

################################################################################
#
plugins=( git )
#  personal configs
#
################################################################################

export VISUAL=vim
export EDITOR="$VISUAL"

# load machine-specific config
source ~/.transient.zshrc

# # tmuxinator stuff
# export DEFAULT_USER='looneym'
# alias muxc="cd ~/.config/tmuxinator/"
# alias mux="tmuxinator"
# export TMUXINATOR_CONFIG=$HOME/dotfiles/tmuxinator

# # Set correct vim version based on OS version
# osx_version=$(defaults read loginwindow SystemVersionStampAsString)
# function version_gt() { test "$(printf '%s\n' "$@" | sort  | head -n 1)" != "$1"; }
# yosemite=10.10.5
# if version_gt $osx_version $yosemite; then
#   alias vim='/usr/local/Cellar/vim/8.0.1350/bin/vim' 
# else
#   alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
# fi
    
# manipulate dotfiles
alias te='vim ~/.transient.zshrc' 
alias ze='vim ~/.zshrc'
alias zs='source ~/.zshrc && echo Succesfully reloaded .zshrc! 🎉'

# misc utilities

function pr_and_review() {
  if [ "$2" == "" ]
  then
    channel='team-respond-eng'
  else
   channel=$2   
 fi
  git push origin `git branch | grep \* | cut -d ' ' -f2`
  vim /tmp/hub_pr_message.txt < `tty` > `tty`
  hub pull-request -F - < /tmp/hub_pr_message.txt > /tmp/hub_pr_url.txt
  read -r pr_title</tmp/hub_pr_message.txt
  pull-to-slack $channel  ":pr: ${pr_title} `cat /tmp/hub_pr_url.txt`"
  rm /tmp/hub_pr_url.txt
  rm /tmp/hub_pr_message.txt
}

alias venvup='source venv/bin/activate'
alias venvinit='virtualenv venv && source venv/bin/activate'
alias lsdir='ls -d */'
alias procfind="ps ax | grep $1"
alias pysrv='python -m SimpleHTTPServer'
alias dirfind="find $1 -maxdepth 1 -type d -name $2 -print -quit"
alias extip='curl ipinfo.io/ip'
alias intip="ipconfig getifaddr en0"
alias gp="git push origin `git branch | grep \* | cut -d ' ' -f2`"
alias gg=pr_and_review
alias git=hub
alias be="bundle exec"
alias bi="bundle install"
alias gca="git commit --amend --no-edit"
alias glo="git log --oneline"
alias scr="vim scratch"
alias gca="git commit --amend --no-edit"
alias cb="git rev-parse --abbrev-ref HEAD"
alias gp="git push origin `cb`"
alias gpf="git push -f origin `cb`"

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH=$HOME/.eshead/bin:$PATH
