#!/usr/bin/env bash

set -e

echo "==> Updating system..."
sudo apt update

echo "==> Installing dependencies..."
sudo apt install -y \
    git \
    curl \
    wget \
    unzip \
    tar \
    gzip \
    ripgrep \
    fd-find \
    build-essential \
    gcc \
    g++ \
    make \
    python3 \
    python3-pip \
    python3-venv \
    nodejs \
    npm \
    cargo \
    luarocks \
    xclip \
    fzf

echo "==> Removing old Neovim..."
sudo apt remove -y neovim || true

echo "==> Downloading latest Neovim..."

cd /tmp

NVIM_URL="https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz"

wget -O nvim.tar.gz $NVIM_URL

rm -rf nvim-linux-x86_64

tar xzf nvim.tar.gz

echo "==> Installing Neovim..."
sudo rm -rf /opt/nvim

sudo mv nvim-linux-x86_64 /opt/nvim

echo "==> Adding Neovim to PATH..."

if ! grep -q '/opt/nvim/bin' ~/.zshrc; then
    echo 'export PATH="$PATH:/opt/nvim/bin"' >> ~/.zshrc
fi

if ! grep -q '/opt/nvim/bin' ~/.bashrc; then
    echo 'export PATH="$PATH:/opt/nvim/bin"' >> ~/.bashrc
fi

export PATH="$PATH:/opt/nvim/bin"

echo "==> Backing up old config..."

mv ~/.config/nvim ~/.config/nvim.backup 2>/dev/null || true
mv ~/.local/share/nvim ~/.local/share/nvim.backup 2>/dev/null || true
mv ~/.local/state/nvim ~/.local/state/nvim.backup 2>/dev/null || true
mv ~/.cache/nvim ~/.cache/nvim.backup 2>/dev/null || true

echo "==> Installing LazyVim starter..."

git clone https://github.com/LazyVim/starter ~/.config/nvim

rm -rf ~/.config/nvim/.git

echo "==> Installing Nerd Font..."

mkdir -p ~/.local/share/fonts

cd /tmp

wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip

unzip -o JetBrainsMono.zip -d JetBrainsMono

cp JetBrainsMono/*.ttf ~/.local/share/fonts/

fc-cache -fv

echo "==> Done!"
