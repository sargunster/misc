#!/bin/bash

# Start config

WALLPAPER="https://i.redd.it/cb12p2q4rocx.png"

BREW="fish httpie jq mas wallpaper wget"

CASK="android-studio bartender cakebrew dropbox firefox google-chrome google-drive intellij-idea java macpass numi textmate xamarin"

#   "Xcode     Todoist  "
MAS="497799835 585829637"

# End config

echo "Will install from brew: $BREW"
echo "Will install from brew cask: $CASK"
echo "Will install from mas: $MAS"

echo Installing Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo Installing packages from Brew
brew install $BREW

echo Installing a CLI for the Mac App Store
read -p "Apple account email: " masemail
read -p "Apple account password: " maspass
mas signin "$masemail" "$masspass"

echo Installing apps from App Store
mas install $MAS

echo Tapping into Brew Cask
brew tap caskroom/cask

echo Installing apps from Brew Cask
brew cask install $CASK

echo Installing Xamarin
open "/usr/local/Caskroom/xamarin/latest/Install Xamarin.app"

echo Setting up SSH key
read -p "SSH Email: " sshemail
ssh-keygen -t rsa -b 4096 -C "$sshemail"
cat ~/.ssh/id_rsa.pub | pbcopy
open https://github.com/settings/ssh

echo Setting up Git
read -p "Git Name: " gitname
read -p "Git Email: " gitemail
git config --global user.name "$gitname"
git config --global user.email "$gitemail"

echo Setting wallpaper
wget $WALLPAPER -o ~/Pictures/wallpaper.png
wallpaper ~/Pictures/wallpaper.png