enable_epel() {
  sudo amazon-linux-extras enable epel
  sudo yum install -y epel-release
}

install_development_tools() {
 sudo yum groupinstall -y  "Development tools"
}

install_yum_packages() {
  # I don't need any yum packages righ now but I'm keeping this here to make it easy to add them later if I need to
  declare -a yum_packages=(
  "cowsay"
  )
 sudo yum install -y  "${yum_packages[@]}"
}

install_homebrew() {
  if [ ! -d /home/linuxbrew/.linuxbrew/Homebrew ]; then
    echo "installing homebrew"
    sudo mkdir -p /home/linuxbrew/.linuxbrew
    sudo chown -R $(whoami):$(whoami) /home/linuxbrew
    git clone https://github.com/Homebrew/brew /home/linuxbrew/.linuxbrew/Homebrew
    mkdir /home/linuxbrew/.linuxbrew/bin
    ln -s ../Homebrew/bin/brew /home/linuxbrew/.linuxbrew/bin
  fi
}

install_brew_packages() {
  declare -a brew_packages=(
  "zsh"
  "tmux"
  "vim"
  "openssh"
  "shfmt"
  "ctags"
  "ag"
  "python3"
  )
 brew install "${brew_packages[@]}"
}

install_oh_my_zsh(){
  OH_MY_ZSH="$HOME/.oh-my-zsh"
  if [ ! -d "$OH_MY_ZSH" ]; then
    echo "Installing zsh"
    curl -Lo /tmp/install.sh https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
    sh /tmp/install.sh --unattended
  fi
}

install_powerline_fonts(){
  git clone https://github.com/powerline/fonts.git /tmp/fonts --depth=1
  /tmp/fonts/install.sh
  rm -rf /tmp/fonts
}

create_symlinks(){
  touch ~/.transient
  paths=".zshrc .vimrc .tmux.conf .gitconfig .gitignore.global .aliases .git_template"       
  for path in $paths; do
      echo "Creating symlink to $path in home directory."
      ln -sf ~/dotfiles/$path ~/$path
  done
  ln -sf ~/dotfiles/looneym.zsh-theme ~/.oh-my-zsh/themes/looneym.zsh-theme
}

install_zsh_syntax_highlighting(){
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git  ~/.zsh-syntax-highlighting
}

# I don't like this but it's hard to find a vim package which has all the things I want
# Later I should create my own brew package
install_vim8(){
  if vim --version | grep "Vi IMproved 8." > /dev/null 2>&1 ; then
    echo "Vi 8 is already installed"
  else
    sudo yum -y install ncurses-devel git-core
    git clone https://github.com/vim/vim /tmp/vim
    ./configure --prefix=/usr --with-features=huge --enable-multibyte --with-python-config-dir=/usr/lib/python2.7/config --enable-pythoninterp=yes
    make -C /tmp/vim
    sudo make install -C /tmp/vim  
  fi
}

enable_epel
install_development_tools
install_yum_packages
install_homebrew
install_brew_packages
install_oh_my_zsh
install_powerline_fonts
install_zsh_syntax_highlighting
create_symlinks
# Seeing if I can get by with the brew version for now
# install_vim8
