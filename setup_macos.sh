#!/bin/bash

# Start config

BREW="fish httpie jq"

CASK="android-studio bartender cakebrew dropbox firefox google-chrome google-drive intellij-idea java macpass numi textmate xamarin"

#   "Xcode     Todoist  "
MAS="497799835 585829637"

# End config

echo "Will install from brew: $BREW"
echo "Will install from brew cask: $CASK"
echo "Will install from mas: $MAS"

echo Installing Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo Installing a CLI for the Mac App Store
brew install mas
read -p "Apple account email: " masemail
read -p "Apple account password: " maspass
mas signin "$masemail" "$masspass"

echo Tapping into Brew Cask
brew tap caskroom/cask

echo Installing packages from Brew
brew install $BREW

echo Installing apps from App Store
mas install $MAS

echo Installing apps from Brew Cask
brew cask install $CASK

echo Installing Xamarin
open "/usr/local/Caskroom/xamarin/latest/Install Xamarin.app"