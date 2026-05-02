#!/bin/bash

# --- 1. SET VARIABLES ---
CURSOR_REPO="ful1e5/Bibata_Cursor"
CURSOR_NAME="Bibata-Modern-Classic"
ICONS_DIR="$HOME/.icons"
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
# Direct link for Wallhaven k7q9m7 (3840x2160 PNG)
WALLPAPER_URL="https://w.wallhaven.cc/full/k7/wallhaven-k7q9m7.png"
WALLPAPER_PATH="$WALLPAPER_DIR/piano-forest.png"

# Create directories
mkdir -p "$ICONS_DIR"
mkdir -p "$WALLPAPER_DIR"

# --- 2. INSTALL BIBATA CURSOR ---
echo "Step 1: Installing Bibata Cursor..."

# Fetch the latest release URL from GitHub API
CURSOR_URL=$(curl -s https://api.github.com/repos/$CURSOR_REPO/releases/latest | \
             grep "browser_download_url" | \
             grep "Bibata-Modern-Classic.tar.xz" | \
             cut -d '"' -f 4)

if [ -z "$CURSOR_URL" ]; then
    echo "Error: Could not find cursor download URL. Check your internet connection."
else
    curl -L "$CURSOR_URL" -o /tmp/bibata.tar.xz
    tar -xf /tmp/bibata.tar.xz -C "$ICONS_DIR"
    
    # Set the cursor theme in GNOME
    gsettings set org.gnome.desktop.interface cursor-theme "$CURSOR_NAME"
    echo "Cursor theme installed and applied."
fi

# --- 3. SET WALLPAPER ---
echo "Step 2: Downloading and setting wallpaper..."

curl -L "$WALLPAPER_URL" -o "$WALLPAPER_PATH"

if [ -f "$WALLPAPER_PATH" ]; then
    # GNOME requires setting both light and dark mode versions in Ubuntu 22.04+
    gsettings set org.gnome.desktop.background picture-uri "file://$WALLPAPER_PATH"
    gsettings set org.gnome.desktop.background picture-uri-dark "file://$WALLPAPER_PATH"
    echo "Wallpaper updated successfully."
else
    echo "Error: Wallpaper download failed."
fi

echo "--- Automation Complete ---"
echo "Note: You might need to restart some open windows for the cursor to change inside them."
