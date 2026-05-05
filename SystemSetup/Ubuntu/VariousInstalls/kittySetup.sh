sudo apt install kitty

ln -sf ~/.local/kitty.app/bin/kitty ~/.local/bin/kitty

# Create the applications folder if it's missing
mkdir -p ~/.local/share/applications/

# Copy the desktop entry provided by kitty into your system's search path
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/

# Tell the desktop file exactly where the icon and executable are
sed -i "s|Icon=kitty|Icon=/home/remans/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty.desktop
sed -i "s|Exec=kitty|Exec=/home/remans/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty.desktop

# Kitty config files
cp ~/Code/LinuxTools/SystemSetup/dotfiles/kitty/* ~/.config/kitty
