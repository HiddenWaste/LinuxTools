#!/bin/bash

# Variables
THEME_NAME="oxy-neon"
DL_URL="https://dl.opendesktop.org/api/files/download/id/1460734710/137109-oxy-neon-0.2.tar.gz"
ICON_DIR="$HOME/.local/share/icons"

echo "--- Cleaning and Installing $THEME_NAME ---"

# 1. Clear old attempts to ensure a clean slate
rm -rf "$ICON_DIR/$THEME_NAME"
mkdir -p "$ICON_DIR"

# 2. Download and Extract
curl -L "$DL_URL" -o /tmp/cursor.tar.gz
tar -xvf /tmp/cursor.tar.gz -C "$ICON_DIR"

# 3. FIX: Oxy-Neon extracts into a folder that might be named differently
# We ensure the folder matches the theme name apps expect.
if [ -d "$ICON_DIR/oxy-neon" ]; then
    echo "Directory structure looks correct."
else
    # Sometimes it extracts as 'oxy-neon-0.2', let's rename it if so
    mv "$ICON_DIR/oxy-neon"* "$ICON_DIR/$THEME_NAME" 2>/dev/null
fi

# 4. FORCE System Fallback (The "Magic" Step)
# This creates a 'default' theme that just points to your neon theme.
mkdir -p "$ICON_DIR/default"
echo -e "[Icon Theme]\nInherits=$THEME_NAME" > "$ICON_DIR/default/index.theme"

# 5. Apply to current session
hyprctl setcursor "$THEME_NAME" 24

# 6. Update hyprland.conf with the CORRECT env vars
# Note: Since this isn't a 'hyprcursor' format theme, we use XCURSOR variables.
CONF="$HOME/.config/hypr/hyprland.conf"
sed -i '/env = XCURSOR_THEME/d' "$CONF"
sed -i '/env = XCURSOR_SIZE/d' "$CONF"
echo "env = XCURSOR_THEME,$THEME_NAME" >> "$CONF"
echo "env = XCURSOR_SIZE,24" >> "$CONF"

echo "--- Installation Complete ---"
echo "IMPORTANT: Close and reopen your apps (Terminal, Browser, etc.) to see the change."
