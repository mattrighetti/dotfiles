# Parse aliases folder
for func ($ZSH_CUSTOM/functions/*.zsh(N)); do
    source $func
done
