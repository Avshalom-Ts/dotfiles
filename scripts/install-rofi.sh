#!/usr/bin/env bash

set -e

echo "==> Updating system..."
sudo apt update

echo "==> Installing dependencies..."
sudo apt install -y \
  rofi \
  wl-clipboard \
  wtype \
  grim \
  slurp \
  jq

echo "==> Done!"
