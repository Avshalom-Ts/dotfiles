#!/usr/bin/env bash

set -e

echo "Updating system..."

sudo apt update

echo "Installing core packages..."

sudo apt install -y \
  git \
  curl \
  wget \
  unzip \
  zip \
  build-essential \
  lsb-release \
  stow \
  btop \
  tree \
  bat \
  eza \
  fzf \
  alacritty \
  ripgrep \
  fd-find \
  gcc \
  g++ \
  make \
  python3 \
  python3-pip \
  nodejs \
  npm \
  luarocks \

# Optional to add:
#  neofetch
# tmux
# zoxide
# jq
# fastfetch
#  software-properties-common \
#  ca-certificates \
#  gnupg \
