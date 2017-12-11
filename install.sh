dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files=".zshrc .vimrc .vim .tmux.conf"        # list of files/folders to symlink in homedir
transient="$HOME/.transient"
##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -f $dir/$file ~/$file
done

# create the transient file for secrets if it does not exist
echo Creating transient file if it does not exist...""
if [ ! -e "$transient" ] ; then
    touch "$transient"
fi
echo "...done"

# Pull down each vim plugin from source
git submodule init
git submodule update

