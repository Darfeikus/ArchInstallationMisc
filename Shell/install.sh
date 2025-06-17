#!/bin/bash

#install zsh
sudo pacman -S zsh

#change shell
chsh -s $(which zsh)

#install oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#install starship
curl -sS https://starship.rs/install.sh | sh
mkdir -p ~/.config && touch ~/.config/starship.toml

#copy my current version of ~/.zshrc and /etc/zsh/zshrc to the new installation
sudo cp .zshrc ~/.zshrc
sudo cp zshrc /etc/zsh/zshrc
sudo cp starship.toml ~/.config/starship.toml
