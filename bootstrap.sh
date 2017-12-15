#!/usr/bin/env bash

echo "Installing RVM and the latest Ruby version..."
curl -L https://get.rvm.io | bash -s stable --auto-dotfiles --autolibs=enable --rails
rvm --default  use ruby --latest
echo "... done ✅"


echo "Installing Homebrew - Package manager for OSX..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo "... done ✅"

echo "Installing Brew Cask to extend homebrew"
brew tap caskroom/cask
echo "... done ✅"

echo "Installing applications"
brew cask install iterm2
brew cask install firefox
echo "... done ✅"

echo "Installing Git..."
brew install git
echo "... done ✅"

echo "Installing OhMyZsh!..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "... done ✅"

echo "Installing powerline fonts"
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
echo "... done ✅"

echo "Installing pip and virtualenv..."
sudo easy_install pip
pip install virtualenv
echo "... done ✅"


