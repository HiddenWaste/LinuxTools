#!/bin/bash

# Define variables
URL="https://w.wallhaven.cc/full/9o/wallhaven-9o8k9w.jpg"
DEST_DIR="$HOME/Pictures/Wallpapers" # Better location than .icons
FILE_NAME="wallpaper_9o8k9w.jpg"
FULL_PATH="$DEST_DIR/$FILE_NAME"

# 1. Create the directory if it doesn't exist
mkdir -p "$DEST_DIR"

# 2. Download the image
if [ ! -f "$FULL_PATH" ]; then
    echo "Downloading wallpaper to $DEST_DIR..."
    curl -L -o "$FULL_PATH" "$URL"
fi

# 3. Set the wallpaper using awww
if command -v awww >/dev/null 2>&1; then
    # 'awww img' sends the image to the running daemon
    awww img "$FULL_PATH"
    echo "Wallpaper set successfully with awww!"
else
    echo "Error: 'awww' command not found. Is awww-daemon running?"
fi
