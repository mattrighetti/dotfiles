#!/usr/bin/env bash

sudo apt update
sudo apt upgrade -y
sudo apt install vim fonts-firacode

if test ! $(which zsh); then
    sudo apt install zsh -y
    chsh -s /bin/zsh
fi

# Parse Utils functions
curl -fsSL https://raw.githubusercontent.com/mattrighetti/dotfiles/master/scriptUtils.sh -o scriptUtils.sh
source scriptUtils.sh

# Install all commands, apps, tools, fonts with Homebrew
curl -fsSL https://raw.githubusercontent.com/mattrighetti/dotfiles/master/linux/brew.sh -o brew.sh
source brew.sh

infoln "Creating npm global directory"
mkdir -p $HOME/.npm-global/lib

infoln "Installing Vue CLI..."
npm install -g @vue/cli

infoln "Installing Oh My ZSH..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

infoln "Downloading zsh plugins..."
ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git  $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git      $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions.git          $ZSH_CUSTOM/plugins/zsh-completions

infoln "Creating Developer folder..."
mkdir $HOME/Developer

infoln "Setting up dotfiles"
packages=(
    git
    htop
    npm
    vim
    zsh
    omz
)

git clone https://github.com/mattrighetti/dotfiles.git $HOME/Developer/dotfiles
stow --dir=$HOME/Developer/dotfiles/linux --target=$HOME ${packages[@]}

infoln "Installing docker..."
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
sudo usermod -aG docker $USER

successln "Done!"

infoln "Removing downloaded scripts"
rm scriptUtils.sh
rm brew.sh
rm get-docker.sh

read -p "Press [Enter] and enter password to reboot"
sudo reboot
