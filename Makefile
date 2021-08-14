.PHONY: link-linux
link-linux:
	stow -vnS --target=~ zsh

.PHONY: link-macos
link-macos:
	stow -vnS --target=~ zsh