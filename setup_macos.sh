#!/bin/bash

# Start config

WALLPAPER="https://i.redd.it/cb12p2q4rocx.png"

BREW="fish httpie jq mas wallpaper wget node watchman android-sdk"

CASK="android-studio bartender cakebrew dropbox firefox google-chrome google-drive intellij-idea java macpass numi textmate xamarin appcode slack"

#   "Xcode     Todoist  "
MAS="497799835 585829637"

NPM="react-native-cli"

# End config

read -p "Your name: " NAME
read -p "Your email address: " EMAIL
read -p "Your Apple account password: " MASPASS

echo "Will install from brew: $BREW"
echo "Will install from npm: $NPM"
echo "Will install from brew cask: $CASK"
echo "Will install from app store: $MAS"

read -p "Press Enter to continue"

echo Installing Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo Installing packages from Brew
brew install $BREW

echo Installing packages from NPM
npm install -g $NPM

echo Installing a CLI for the Mac App Store
mas signin "$EMAIL" "$MASPASS"

echo Installing apps from App Store
mas install $MAS

echo Tapping into Brew Cask
brew tap caskroom/cask

echo Installing apps from Brew Cask
brew cask install $CASK

echo Installing Xamarin
open "/usr/local/Caskroom/xamarin/latest/Install Xamarin.app"

echo Setting up SSH key
ssh-keygen -t rsa -b 4096 -C "$EMAIL"
cat ~/.ssh/id_rsa.pub | pbcopy
open https://github.com/settings/ssh

echo Setting up Git
git config --global user.name "$NAME"
git config --global user.email "$EMAIL"
echo .DS_Store >> ~/.gitignore
echo local.properties >> ~/.gitignore
git config --global core.excludesfile ~/.gitignore

echo Setting wallpaper
wget $WALLPAPER -O ~/Pictures/wallpaper.png
wallpaper ~/Pictures/wallpaper.png

echo Setting up Android SDK
echo "export ANDROID_HOME=/usr/local/opt/android-sdk" >> ~/.bashrc
android
