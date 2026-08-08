#!/bin/bash

if [ ! -f "pacman.txt" ]; then
  echo "Packages file not found!"
  exit
fi

if [ ! -f "aur.txt" ]; then
  echo "AUR packages file not found!"
  exit
fi

echo "Updating system..."
sudo pacman -Syu --noconfirm

echo "Installing packages..."
sudo pacman -S --needed --noconfirm - < pacman.txt

echo "Copy configuration files..."
cp -rf .config/ ~/
cp .config/.zshrc ~/

mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

cd ..
yay -S < aur.txt

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER

sudo systemctl enable ly@tty2

echo "Installation complete!"