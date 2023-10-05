#!/usr/bin/env bash

# Check for Homebrew
# Install if not present
if test ! $(which brew); then
    echo "Installing Homebrew 🍺..."
    echo | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Updating brew..."
brew update
echo "Upgrading brew..."
brew upgrade

tools=(
    git
    node
    nvim
    rustup
    go
    cargo
    openjdk
)

rust_bins=(
    bat
    exa
    fd
    git-delta
    procs
    tokei
    ripgrep
    rustfmt
)

other_bin=(
    fzf
    htop
    jq
    tree
    tmux
    wget
    tldr
    aria2
    ack
    grpcurl
)

gnu_tools=(
    coreutils
    moreutils
    findutils
    gnu-indent
    gnu-getopt
    gnu-sed
    gnu-tar
    gnutls
    gawk
    grep
    stow
    flex
    bison
)

ctf_tools=(
    aircrack-ng
    bfg
    binutils
    binwalk
    cifer
    dex2jar
    dns2tcp
    fcrackzip
    foremost
    hashpump
    hydra
    john
    knock
    netpbm
    pngcheck
    socat
    sqlmap
    tcpflow
    tcpreplay
    tcptrace
    xz
    nmap
)

fonts=(
    font-jetbrains-mono
    font-fira-mono
    font-fira-code
    font-fira-code-nerd-font
)

apps=(
    rectangle
    alacritty
    discord
    jetbrains-toolbox
    spotify
    telegram
    firefox
    visual-studio-code
    bartender
    alfred
    cyberduck
    vlc
    appcleaner
    tor-browser
    docker
    sf-symbols
    keka
    transmission
    stats
)

echo "Installing tools..."
brew install ${tools[@]}

echo "Installing gnu_tools..."
brew install ${gnu_tools[@]}

echo "Installing rust_bins..."
brew install ${rust_bins[@]}

echo "Installing ctf_tools..."
brew install ${ctf_tools[@]}

echo "Installing other tools..."
brew install ${other_bin[@]}

echo "Installing fonts..."
brew tap homebrew/cask-fonts
brew install --cask ${fonts[@]}

echo "Installing Applications"
brew install --cask --appdir="/Applications" ${apps[@]}

brew cleanup
