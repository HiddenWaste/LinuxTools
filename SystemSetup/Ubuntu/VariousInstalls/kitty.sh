# Install kitty from the official Ubuntu repositories
sudo apt update && sudo apt install -y kitty

# Ensure the local bin directory exists
mkdir -p ~/.local/bin

# Create the symbolic link using the $HOME variable
ln -sf "$HOME/.local/kitty.app/bin/kitty" ~/.local/bin/kitty

# Create the applications folder if it's missing
mkdir -p ~/.local/share/applications/

# Copy the desktop entry (assuming the .app directory structure exists)
if [ -d "$HOME/.local/kitty.app" ]; then
    cp "$HOME/.local/kitty.app/share/applications/kitty.desktop" ~/.local/share/applications/

    # Update the icon and executable paths dynamically using $HOME
    sed -i "s|Icon=kitty|Icon=$HOME/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty.desktop
    sed -i "s|Exec=kitty|Exec=$HOME/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty.desktop
fi

# Kitty config files - ensures the target directory exists first
mkdir -p ~/.config/kitty
cp ~/Code/LinuxTools/SystemSetup/dotfiles/kitty/* ~/.config/kitty
