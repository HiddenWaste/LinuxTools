#!/bin/bash

# URL of the no-logo wallpaper
WALLPAPER_URL="https://www.gnome-look.org/dl?file_id=1685867543&has_torrent=0&project_id=2036892&link_type=download&is_external=0"
# Local filename
WALLPAPER_FILE="$HOME/.local/share/backgrounds/gnome-look-789-no-logo.jpg"

# Create the background directory if it doesn't exist
mkdir -p "$(dirname "$WALLPAPER_FILE")"

# Download the wallpaper
echo "Downloading wallpaper..."
wget -q -O "$WALLPAPER_FILE" "$WALLPAPER_URL"

# Check if download succeeded
if [ ! -f "$WALLPAPER_FILE" ]; then
    echo "Error: Failed to download the wallpaper."
    exit 1
fi

# Set the wallpaper for GNOME
echo "Setting wallpaper..."
gsettings set org.gnome.desktop.background picture-uri "file://$WALLPAPER_FILE"
gsettings set org.gnome.desktop.background picture-uri-dark "file://$WALLPAPER_FILE"

echo "Wallpaper set successfully!"
