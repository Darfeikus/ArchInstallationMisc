#!/bin/bash

#install zsh
sudo pacman -Sy zsh fastfetch

#add nano syntax highlihting
sudo cat nanoHighlighting | sudo tee -a /etc/nanorc


#create initial config
fastfetch --gen-config

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

#install zsh mods
git clone https://github.com/zsh-users/zsh-completions.git \
  ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


#copy my current version of ~/.zshrc and /etc/zsh/zshrc to the new installation
sudo cp .zshrc ~/.zshrc
sudo cp zshrc /etc/zsh/zshrc
sudo cp starship.toml ~/.config/starship.toml
sudo cp fastfetch.jsonc ~/.config/fastfetch/config.jsonc

#additional setting for per system configurations
if [ ! -f "/etc/zsh/myconfigs" ]; then
  sudo touch "/etc/zsh/myconfigs"
fi

echo "Copied all files and installation completed"
