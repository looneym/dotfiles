dir=~/dotfiles                    
files=".zshrc .vimrc .tmux.conf .transient .gitconfig .gitignore.global"       

# Use this file for machine-specific configs, secrets and other things you do not want in Git
# It will be sourced in .zshrc
touch .transient

for file in $files; do
    echo "Creating symlink to $file in home directory."
    ln -sf $dir/$file ~/$file
done

ln -sf ~/dotfiles/looneym.zsh-theme ~/.oh-my-zsh/themes/looneym.zsh-theme

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

sudo apt install build-essential cmake python3-dev ctags silversearcher-ag fzf
cd ~/.vim/bundle/YouCompleteMe
python3 install.py

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --bin

git remote set-url origin git@github.com:looneym/dotfiles.git
