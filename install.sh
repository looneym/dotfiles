install_ctags(){
  sudo apt install -y ctags
}

install_vundle(){
  mkdir -p ~/.vim/bundle/
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
}

install_ycm_deps(){
  sudo apt install -y build-essential cmake python3-dev
}

install_zsh(){
  sudo apt install -y zsh 
}

install_ag(){
  sudo apt install -y ag 
}

install_oh_my_zsh(){
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

install_fzf(){
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
}

install_powerline_fonts(){
  sudo apt install -y fonts-powerline
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
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git  ~/zsh-syntax-highlighting
}

install_zsh
install_oh_my_zsh
install_ctags
install_fzf
install_ag
install_vundle
install_ycm_deps
install_powerline_fonts
install_syntax_highlighting
symlink_files
