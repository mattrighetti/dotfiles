DISABLE_AUTO_UPDATE="true"
DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_COMPFIX="true"

# Smarter completion initialization
autoload -Uz compinit
if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
    compinit
else
    compinit -C
fi

ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"
ZSH_AUTOSUGGEST_USE_ASYNC=1

######################
#       [Theme]      #
######################
ZSH_THEME="robbyrussell"

plugins=(
    git
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
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

# lazy load fzf
fzf() {
  unfunction fzf
  source ~/.fzf.zsh
  fzf "$@"
}

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

source $ZSH/oh-my-zsh.sh

eval "$($BREW_PREFIX/bin/brew shellenv)"

# Dotfiles alias configuration
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/mattrighetti/.docker/completions $fpath)
