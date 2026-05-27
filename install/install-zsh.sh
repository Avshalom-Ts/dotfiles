#!/usr/bin/env bash

set -e

echo "Installing Zsh..."

sudo apt install -y zsh

echo "Setting Zsh as default shell..."

chsh -s $(which zsh)

echo "Installing Oh My Zsh..."

RUNZSH=no CHSH=no sh -c \
"$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing Powerlevel10k..."

git clone --depth=1 \
https://github.com/romkatv/powerlevel10k.git \
${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo "Installing Zsh plugins..."

git clone https://github.com/zsh-users/zsh-autosuggestions \
${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Done."
