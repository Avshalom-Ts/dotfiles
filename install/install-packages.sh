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
#  software-properties-common \
  ca-certificates \
  gnupg \
  lsb-release \
  stow \
  btop \
  tree \
#  neofetch \
  bat \
  eza \
  fzf \
  alacritty

# Optional to add:
# tmux
# zoxide
# ripgrep
# fd-find
# jq
# fastfetch
