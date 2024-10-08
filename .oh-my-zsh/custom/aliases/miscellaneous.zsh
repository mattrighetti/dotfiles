# Trim new lines and copy to clipboard
alias c="tr -d '\n' | pbcopy"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

alias nv=nvim

# Filesystem
alias ll="eza -l -g --icons"
alias ls="eza --icons"
alias tree='eza -T'
