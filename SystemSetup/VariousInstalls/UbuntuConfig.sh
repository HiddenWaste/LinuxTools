# This is my config directive for Ubuntu Systems!!
#   (As of 4-12-2026) This is used on Ubuntu 24 systems.
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# General System settings
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'
echo "dark mode enforced" # Debug Print

# Set system accent color to something else!!
gsettings set org.gnome.desktop.interface accent-color 'purple'

# Disable activities launcher key shortcut
gsettings set org.gnome.mutter overlay-key ''

## .gitconfig
###     We check if the symlink already exists because
###     The command will error out otherwise
if ln -sf "$SCRIPT_DIR/../dotfiles/.gitconfig" ~/.gitconfig > /dev/null 2>&1; then
    echo ".gitconfig populated"
else
    echo "Link failed, attempting manual copy..."
    rm -rf ~/.gitconfig && cp "$SCRIPT_DIR/../dotfiles/.gitconfig" ~/.gitconfig
fi

# DOTFILES AND APP SPECIFC CONFIG
## Gnome terminal profiles
###   These have not been used in a while as kitty is my main terminal now
dconf load /org/gnome/terminal/legacy/profiles:/ < "$SCRIPT_DIR/terminal_profiles.dconf"
echo "gnome terminal profiles populated" # debug print

## Bash RC File
ln -s -f "$SCRIPT_DIR/../dotfiles/.bashrc" ~/.bashrc
echo ".bashrc populated."

## Vim RC File
ln -s -f "$SCRIPT_DIR/../dotfiles/.vimrc" ~/.vimrc
echo ".vimrc populated" # debug print

## Zellij Templates
mkdir -p ~/.config/zellij/layouts # Create folder if it doesnt exist
ln -sfn "$SCRIPT_DIR/zlayouts" ~/.config/zellij/layouts
echo "zellij templates populated" # debug print

# --- Configure Pinned and defaultApps ---
# This list explicitly defines exactly what you want pinned, in order.
# Note: 'org.gnome.Nautilus.desktop' is the internal name for File Explorer.
# Note: correct app names to pin are found in /usr/share/applications !!

# Default Apps:
# Kitty as defailt terminal
gsettings set org.gnome.desktop.default-applications.terminal exec 'kitty'

# Pinned Apps:
WANTED_APPS=(
    "zen.desktop"
    "spotify_spotify.desktop"
    "mullvad-vpn.desktop"
    "vlc.desktop"
    "kitty.desktop"
    "org.kde.krusader.desktop"
)

# Convert the array into the GSettings format: ['app1', 'app2', 'app3']
FORMATTED_LIST=$(printf "'%s'," "${WANTED_APPS[@]}" | sed 's/,$//')
gsettings set org.gnome.shell favorite-apps "[$FORMATTED_LIST]"
echo "Pinned dashboard apps have been updated."
