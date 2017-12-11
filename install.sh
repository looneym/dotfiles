dir=~/dotfiles                    
files=".zshrc .vimrc .vim .tmux.conf"       
transient="$HOME/.transient"

for file in $files; do
    echo "Creating symlink to $file in home directory."
    ln -sf $dir/$file ~/$file
done

# create the transient file for secrets if it does not exist
if [ ! -e "$transient" ] ; then
    touch "$transient"
fi
echo "...done"

# Pull down latest version of Vundle from source
git submodule init
git submodule update

