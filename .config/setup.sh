#!/usr/bin/env bash

echo "Changing mbp default names"
sudo scutil --set LocalHostName "localhost"
sudo scutil --set ComputerName "mbp"

# Install Xcode tools
echo "Installing Xcode codechain..."
xcode-select --install

echo "Creating npm global directory"
mkdir -p $HOME/.npm-global/lib

echo "Installing Oh My ZSH..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

echo "Downloading zsh plugins..."
ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git  $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git      $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions.git          $ZSH_CUSTOM/plugins/zsh-completions

echo "Creating Developer folder..."
mkdir $HOME/Developer

echo "Done!"
