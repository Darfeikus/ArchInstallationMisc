#!/bin/bash

#install zsh
sudo pacman -Sy zsh fastfetch zsh-autosuggestions zsh-completions

#change shell
chsh -s $(which zsh)

#install oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#install starship
curl -sS https://starship.rs/install.sh | sh
mkdir -p ~/.config && touch ~/.config/starship.toml

#install font
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/FiraCode.zip
unzip -d fonts FiraCode.zip  
mkdir -p /usr/share/fonts
sudo cp fonts/*.ttf /usr/share/fonts
fc-cache
sudo rm -R fonts
sudo rm FiraCode.zip

#copy my current version of ~/.zshrc and /etc/zsh/zshrc to the new installation
sudo cp .zshrc ~/.zshrc
sudo cp zshrc /etc/zsh/zshrc
sudo cp starship.toml ~/.config/starship.toml
sudo cp fastfetch.jsonc ~/.config/fastfetch/config.jsonc

echo "Copied all files and installation completed"
