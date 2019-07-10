install_ctags(){
  sudo yum install -y ctags
}

install_zsh(){
  sudo yum install -y zsh 
}

enable_epel() {
  sudo amazon-linux-extras enable epel
  sudo yum install -y epel-release
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

install_ag(){
  sudo yum install -y the_silver_searcher 
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

symlink_files(){
  touch ~/.transient
  dir=~/dotfiles                    
  files=".zshrc .vimrc .tmux.conf .gitconfig .gitignore.global .aliases .git_template"       
  for file in $files; do
      echo "Creating symlink to $file in home directory."
      ln -sf $dir/$file ~/$file
  done
  ln -sf ~/dotfiles/looneym.zsh-theme ~/.oh-my-zsh/themes/looneym.zsh-theme
}

install_syntax_highlighting(){
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git  ~/.zsh-syntax-highlighting
}

install_vim8(){
  if vim --version | grep "Vi IMproved 8." > /dev/null 2>&1 ; then
    echo "Vi 8 is already installed"
  else
    sudo yum -y groupinstall "Development Tools"
    sudo yum -y install ncurses-devel git-core
    git clone https://github.com/vim/vim /tmp/vim
    ./configure --prefix=/usr --with-features=huge --enable-multibyte --with-python-config-dir=/usr/lib/python2.7/config --enable-pythoninterp=yes
    make -C /tmp/vim
    sudo make install -C /tmp/vim  
  fi
}

install_tmux(){
  brew install tmux
}

install_homebrew
enable_epel
install_zsh
install_oh_my_zsh
install_ctags
install_ag
install_powerline_fonts
install_syntax_highlighting
symlink_files
install_vim8
install_tmux
