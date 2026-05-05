#!/bin/bash
echo 'Installing GNOME Extension Manager...'
flatpak install -y flathub com.mattjakeman.ExtensionManager

echo 'Installing gnome-shell-extension-installer...'
sudo apt install -y wget unzip
wget -O gnome-shell-extension-installer 'https://github.com/brunelli/gnome-shell-extension-installer/raw/master/gnome-shell-extension-installer'
chmod +x gnome-shell-extension-installer
sudo mv gnome-shell-extension-installer /usr/local/bin/

sudo apt update
sudo apt install git make gettext -y

# Dash2Dock Animated!
mkdir -p ~/Code/gnome-extensions/dash2dock-lite/
git clone https://github.com/icedman/dash2dock-lite.git ~/Code/gnome-extensions/dash2dock-lite/

cd ~/Code/gnome-extensions/dash2dock-lite
make install

gnome-extensions enable dash2dock-lite@icedman.github.com

echo 'disabling ubuntu dock'
gnome-extensions disable ubuntu-dock@ubuntu.com

# Open Bar
mkdir -p ~/Code/gnome-extensions/openbar/
git clone https://github.com/neuromorph/openbar.git  ~/Code/gnome-extensions/openbar/

cd ~/Code/gnome-extensions/openbar
make install

gnome-extensions enable openbar@neuromorph

# Vitals
mkdir -p ~/Code/gnome-extensions/vitals
git clone https://github.com/corecoding/Vitals.git ~/Code/gnome-extensions/vitals/

cd ~/Code/gnome-extensions/vitals

gnome-extensions enable Vitals@CoreCoding.com
