#!/bin/bash

# Define your target color
# HEX: #086EBD
# RGB: rgb(8, 110, 189)

echo "Applying blue accent and window hint colors..."

# 1. Set the system-wide Ubuntu accent color to Blue
# This affects buttons, toggles, and folder icons
gsettings set org.gnome.shell.ubuntu color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface accent-color 'blue'

# 2. Set the Tiling Assistant active window hint to your specific hex/rgb
# Reference: org.gnome.shell.extensions.tiling-assistant active-window-hint-color
gsettings set org.gnome.shell.extensions.tiling-assistant active-window-hint-color 'rgb(8,110,189)'

# 3. Optional: Match the TextEditor window recoloring
gsettings set org.gnome.TextEditor recolor-window true

echo "Accent colors updated!"
