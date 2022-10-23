#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")"

git pull origin main

POWERLEVEL10K_URL="https://github.com/romkatv/powerlevel10k.git"
POWERLEVEL10K_PATH="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

ZSH_SUGGESTIONS_URL="https://github.com/zsh-users/zsh-autosuggestions"
ZSH_SUGGESTIONS_PATH="${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

function setup_ohmyzsh() {
	REPLACE_RC='no' sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	git clone --depth=1 ${POWERLEVEL10K_URL} "${POWERLEVEL10K_PATH}" 2> /dev/null || echo "Power Level 10K Already installed."
	git clone ${ZSH_SUGGESTIONS_URL} "${ZSH_SUGGESTIONS_PATH}" 2> /dev/null || echo "ZSH suggestion already installed."
}

function install_dotfiles() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		-avh --no-perms . ~
	source ~/.bash_profile
}

read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
	install_dotfiles
	setup_ohmyzsh
fi

sed -i "s,HOME_PLACEHOLDER,${HOME},g" "${HOME}/.zshrc"
