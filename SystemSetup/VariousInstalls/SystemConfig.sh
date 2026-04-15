SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# General System settings
## ENFORCE DARK MODE. NO LIGHT MODE PROPAGANDA.
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'
echo "Dark mode engaged." # Debug Print
sleep 1

# Disable activities launcher key shortcut
gsettings set org.gnome.mutter overlay-key ''

## .gitconfig
if ln -s -F "$SCRIPT_DIR/../dotfiles/.gitconfig" ~/.gitconfig; then
	echo ".gitconfig Populated." # debug print
else
	echo "replacing .gitconfig by force...."
	rm -rf ~/.gitconfig && cp "$SCRIPT_DIR/../dotfiles/.gitconfig" ~/.gitconfig
fi

## Gnome terminal profiles
dconf load /org/gnome/terminal/legacy/profiles:/ < "$SCRIPT_DIR/terminal_profiles.dconf"
echo "Gnome Terminal Profiles Populated." # debug print

## Bash RC File
ln -s -f "$SCRIPT_DIR/../dotfiles/.bashrc" ~/.bashrc
echo ".bashrc Populated."

## Vim RC File
ln -s -f "$SCRIPT_DIR/../dotfiles/.vimrc" ~/.vimrc
echo ".vimrc Populated." # debug print

## Zellij Templates
mkdir -p ~/.config/zellij/layouts # Create folder if it doesnt exist
cp "$SCRIPT_DIR/zlayouts/*.kdl" ~/.config/zellij/layouts # Move the templates
echo "Zellij Templates Populated." # debug print

# --- Configure Pinned Apps ---
# This list explicitly defines exactly what you want pinned, in order.
# Note: 'org.gnome.Nautilus.desktop' is the internal name for File Explorer.
# Note: 'snap-store_ubuntu-software.desktop' is the App Center.

WANTED_APPS=(
    "zen.desktop"
    "org.gnome.Terminal.desktop"
    "spotify_spotify.desktop"
    "mullvad-vpn.dektop"
)

# Convert the array into the GSettings format: ['app1', 'app2', 'app3']
FORMATTED_LIST=$(printf "'%s'," "${WANTED_APPS[@]}" | sed 's/,$//')
gsettings set org.gnome.shell favorite-apps "[$FORMATTED_LIST]"
echo "Pinned dashboard apps have been updated."

# Set Zen as default browser
xdg-settings set default-web-browser zen.desktop
echo "Zen set as the default. Namaste."
