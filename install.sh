dir=~/dotfiles                    
files=".zshrc .vimrc .vim .tmux.conf .transient .gitconfig .gitignore.global"       

# Use this file for machine-specific configs, secrets and other things you do not want in Git
# It will be sourced in .zshrc
touch .transient

for file in $files; do
    echo "Creating symlink to $file in home directory."
    ln -sf $dir/$file ~/$file
done

theme_url=https://raw.githubusercontent.com/wesbos/Cobalt2-iterm/master/cobalt2.zsh-theme
curl $theme_url >> ~/.oh-my-zsh/themes/cobalt2.zsh-theme
# pip install --user powerline-status
# git clone https://github.com/powerline/fonts
# cd fonts
# ./install.sh
