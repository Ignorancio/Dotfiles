#!/bin/bash

if [ ! -f "terminal" ]; then
  echo "Packages file not found!"
  exit
fi

echo "Updating system..."
sudo pacman -Syu --noconfirm

echo "Installing packages..."
sudo pacman -S --needed --noconfirm - < terminal

echo "Copy configuration files..."
cp -rf .config/ ~/
cp .config/.zshrc ~/

mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes

sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER

echo "Installation complete!"