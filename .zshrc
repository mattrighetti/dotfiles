######################
#       [Theme]      #
######################
ZSH_THEME="robbyrussell"

plugins=(
    fzf
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-completions
)

######################
# [Additional Paths] #
######################

if [[ $(uname) == "Darwin" ]]; then
    export BREW_PREFIX=/opt/homebrew
else
    export BREW_PREFIX=/home/linuxbrew/.linuxbrew
fi

# Fuzzy find
export FZF_BASE=$BREW_PREFIX/opt/fzf

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Default JDK version
# to see all the available versions type `/usr/libexec/java_home -V`
# to change java version just copy code below and change che version after -v
# export JAVA_HOME=$(/usr/libexec/java_home -v11.0.8)

# NPM Global variable
export PATH="$HOME/.npm-global/bin:$PATH"

######################
#[        GO        ]#
######################
export GOPATH=$HOME/Developer/go
export GOROOT=$BREW_PREFIX/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export GOPRIVATE=github.com/crowdbrain

######################
#[       RUST       ]#
######################
export PATH=$HOME/.cargo/bin:$PATH

export PATH=$PATH:$BREW_PREFIX/opt/postgresql/bin

######################
#[        GNU       ]#
######################
# These have to be put before standard /usr/bin to override them
export PATH=$BREW_PREFIX/opt/git/libexec/git-core/git:$PATH
export PATH=$BREW_PREFIX/opt/coreutils/libexec/gnubin:$PATH
export PATH=$BREW_PREFIX/opt/gnu-indent/libexec/gnubin:$PATH
export PATH=$BREW_PREFIX/opt/gnu-getopt/libexec/gnubin:$PATH
export PATH=$BREW_PREFIX/opt/gnu-sed/libexec/gnubin:$PATH
export PATH=$BREW_PREFIX/opt/gnu-tar/libexec/gnubin:$PATH
export PATH=$BREW_PREFIX/opt/gnutls/libexec/gnubin:$PATH
export PATH=$BREW_PREFIX/opt/gawk/libexec/gnubin:$PATH
export PATH=$BREW_PREFIX/opt/grep/libexec/gnubin:$PATH
export PATH=$BREW_PREFIX/opt/flex/bin:$PATH
export PATH=$BREW_PREFIX/opt/bison/bin:$PATH
export PATH=$BREW_PREFIX/opt/ruby/bin:/usr/local/lib/ruby/gems/3.0.0/bin:$PATH
# This is needed because OpenBSD openssh that comes
# with macOS is not happy to work with yubikeys.
export PATH=$BREW_PREFIX/opt/openssh/bin:$PATH

export PATH=$BREW_PREFIX/opt/openjdk/bin:$PATH

# PSQL
export PATH=$BREW_PREFIX/opt/postgresql@15/bin:$PATH

######################
#[Plugins and source]#
######################
ZSH_DISABLE_COMPFIX=true
DISABLE_UPDATE_PROMPT=true
ZSH_COMPDUMP="${HOME}/.cache/zsh/zcompdump-${SHORT_HOST}-${ZSH_VERSION}"
source $ZSH/oh-my-zsh.sh

eval "$($BREW_PREFIX/bin/brew shellenv)"

# Dotfiles alias configuration
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

### Dev
#export PATH=~/Downloads/nvim-macos/bin:$PATH
