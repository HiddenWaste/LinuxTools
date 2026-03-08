sudo apt update

sudo apt install -y $(cat ../sudo-apt-pkgs.txt)

echo "Now for the snap packages!"

# Snap installation
xargs -a ../snap-packages.txt sudo snap install
# With classic flag

# Various dotfiles

# Below is for terminal profiles
dconf load /org/gnome/terminal/legacy/profiles:/ < terminal_profiles.dconf

echo "Rise up gamer."
