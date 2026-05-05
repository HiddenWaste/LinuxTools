#!/bin/bash

# 1. Install Ulauncher
if ! command -v ulauncher &> /dev/null; then
    yay -S --noconfirm ulauncher
fi

# 2. Define the extensions directory
EXT_DIR="$HOME/.local/share/ulauncher/extensions"
mkdir -p "$EXT_DIR"

# 3. Loop through your list and clone them
while IFS= read -r url || [ -n "$url" ]; do
    # Get the folder name from the URL (e.g., "ulauncher-timer")
    folder_name=$(basename "$url")
    
    dest_path="$EXT_DIR/$folder_name"

    if [ ! -d "$dest_path" ]; then
        echo "Installing: $url"
        git clone "$url" "$dest_path"
    else
        echo "Extension $folder_name already exists, skipping..."
    fi
done < "../dotfiles/ulauncher-extensions.txt"

echo "Ulauncher extensions populated!"
