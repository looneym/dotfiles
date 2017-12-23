################################################################################
#
#  zsh/oh-my-zsh config stuff
#
################################################################################

# export PATH=$HOME/bin:/usr/local/bin:$PATH
#export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
#PATH=$PATH:/usr/local/bin/; export PATH
export ZSH=~/.oh-my-zsh
ZSH_THEME="looneym"
# ZSH_THEME="cobalt2"
export TERM=xterm-256color
plugins=(git)
#export NVM_DIR="/Users/$USER/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
# pilot is magic
#export PATH=$HOME/.pilot/shims:$HOME/.pilot/bin:$PATH
#eval $(pilot env)
export PATH=$PATH:~/dotfiles/bin
export EDITOR='vim'
source $ZSH/oh-my-zsh.sh

################################################################################
#
#  personal configs
#
################################################################################

# load secrets
source ~/.transient

# ENV variables
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
alias tedit='vim ~/.transient' 
alias zedit='vi ~/.zshrc'
alias zsource='source ~/.zshrc'
alias vedit='vim ~/.vimrc'
alias vsource='source ~/.vimrc'
alias scratchpad="vim ~/.scratchpad.txt"
alias aedit="subl ~/.aws "
alias dotl="mux start dotfiles_l"
alias dotd="mux start dotfiles_d"
# misc utilities
alias venvup='source venv/bin/activate'
alias venvinit='virtualenv venv && source venv/bin/activate'
alias lsdir='ls -d */'
alias procfind="ps ax | grep $1"
alias pysrv='python -m SimpleHTTPServer'
alias dirfind="find $1 -maxdepth 1 -type d -name $2 -print -quit"
alias gattify='cd /Users/Micheal/cse-tools/js-test-app && sudo python -m SimpleHTTPServer 80'
#alias gattify='cd /Users/Micheal/cse-tools/js-test-app && subl . && sudo python -m SimpleHTTPServer 80'
alias s='subl -a .'                
alias pewpew=' hammer console production || hammer cert'
#export PATH=/usr/'local/bin:/Users/looneym/.rvm/gems/ruby-2.4.0/bin:/Users/looneym/.rvm/gems/ruby-2.4.0@global/bin:/Users/looneym/.rvm/rubies/ruby-2.4.0/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/looneym/.rvm/bin:

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

export NVM_DIR="/Users/Micheal/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="$HOME/.yarn/bin:$PATH"
