install_ctags(){
  sudo yum install -y ctags
}

install_zsh(){
  sudo zsh install -y zsh 
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

install_fzf(){
  if fzf > /dev/null 2>&1 ; then
    echo "fzf is already installed"
  else
   wget https://github.com/junegunn/fzf-bin/releases/download/0.18.0/fzf-0.18.0-linux_amd64.tgz /tmp/fzf
   sudo tar -xzf /tmp/fzf-0.18.0-linux_amd64.tgz -C /usr/local/bin
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
  files=".zshrc .vimrc .vim .tmux.conf .gitconfig .gitignore.global .aliases"       
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

install_zsh
install_oh_my_zsh
install_ctags
install_fzf
install_ag
install_powerline_fonts
install_syntax_highlighting
symlink_files
