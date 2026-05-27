#!/usr/bin/env bash

set -e

echo "Installing Zsh..."

sudo apt install -y zsh zplug

echo "Setting Zsh as default shell..."

# The old way
# chsh -s $(which zsh)

echo "Configuring default shell..."

ZSH_PATH="$(command -v zsh)"

if ! grep -qx "$ZSH_PATH" /etc/shells; then
  echo "$ZSH_PATH" | sudo tee -a /etc/shells
fi

# chsh -s "$ZSH_PATH"
sudo chsh -s "$ZSH_PATH" "$USER"

echo "Checking for Oh My Zsh installation..."

if [ -d "$HOME/.oh-my-zsh" ]; then
  echo "Oh My Zsh already installed, skipping..."
else
  echo "Installing Oh My Zsh..."
  RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "Installing Powerlevel10k..."

if [ -d "$HOME/powerlevel10k" ]; then
  echo "Powerlevel10k home git folder already exists, skipping..."
else
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
fi


if [ -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
  echo "Powerlevel10k already installed, skipping..."
else
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

echo "Installing Zsh plugins..."

if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}      Zsh setup completed successfully${NC}"
echo -e "${GREEN}========================================${NC}"
echo

echo -e "${YELLOW}IMPORTANT:${NC}"
echo -e "  • Logout/login (or reboot) to apply the default shell changes."
echo

echo -e "${BLUE}Before running GNU Stow:${NC}"
echo -e "  Remove existing files first:"
echo
echo -e "    rm -f ~/.zshrc ~/.p10k.zsh"
echo
echo -e "  Then run:"
echo
echo -e "    cd ~/dotfiles"
echo -e "    stow zsh"
echo

echo -e "${GREEN}Done!${NC}"

echo "Zsh setup complete!"
