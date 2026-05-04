#!/bin/bash

# Define variables
URL="https://w.wallhaven.cc/full/9o/wallhaven-9o8k9w.jpg"
DEST_DIR="$HOME/.icons"
FILE_NAME="wallpaper_9o8k9w.jpg"
FULL_PATH="$DEST_DIR/$FILE_NAME"

# 1. Create the directory if it doesn't exist
mkdir -p "$DEST_DIR"

# 2. Download the image
echo "Downloading wallpaper to $DEST_DIR..."
curl -L -o "$FULL_PATH" "$URL"

# 3. Set the wallpaper
# Note: This requires 'feh'. Install it with: sudo pacman -S feh
if command -v feh >/dev/null 2>&1; then
    feh --bg-fill "$FULL_PATH"
    echo "Wallpaper set successfully!"
else
    echo "Image downloaded to $FULL_PATH"
    echo "Error: 'feh' is not installed. Use 'sudo pacman -S feh' to set the wallpaper via script."
fi
