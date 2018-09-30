dir=~/dotfiles                    
files=".zshrc .vimrc .vim .tmux.conf .transient .gitconfig .gitignore.global"       

# Use this file for machine-specific configs, secrets and other things you do not want in Git
# It will be sourced in .zshrc
touch .transient

for file in $files; do
    echo "Creating symlink to $file in home directory."
    ln -sf $dir/$file ~/$file
done

ln -sf ~/dotfiles/looneym.zsh-theme ~/.oh-my-zsh/themes/looneym.zsh-theme
