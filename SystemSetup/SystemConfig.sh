# Sets a variable for the directory *this* script runs in, for calling elsewhere
SCRIPT_DIR=$(cd "$(dirname "..${BASH_SOURCE[0]}")" && pwd) 

# General System settings
echo "Beginning configurations..."
sleep 1

## ENFORCE DARK MODE. NO LIGHT MODE PROPAGANDA.
# For GTK4 and Libadwaita apps (Modern Ubuntu)
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
echo "Dark mode engaged." # Debug Print
sleep 1

# For GTK3 and legacy apps
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'
echo "Darker mode engaged." # Debug print
sleep 1

# New windows open center
gsettings set org.gnome.mutter center-new-windows true
echo "New windows will appear in center." # Debug Print
sleep 1

# Git Configuration
git config --global user.name HiddenWaste
git config --global user.email cartergordon13@gmail.com
echo "Git env populated." # debug print

## .gitconfig
ln -s -f "$SCRIPT_DIR/dotfiles/.gitconfig" ~/.gitconfig
echo ".gitconfig Populated." # debug print

# Terminal Configuration
## Gnome terminal profiles
dconf load /org/gnome/terminal/legacy/profiles:/ < "$SCRIPT_DIR/terminal_profiles.dconf"
echo "Gnome Terminal Profiles Populated." # debug print

## Bash RC File
ln -s -f "$SCRIPT_DIR/dotfiles/.bashrc" ~/.bashrc
echo ".bashrc Populated."

## Vim RC File
ln -s -f "$SCRIPT_DIR/dotfiles/.vimrc" ~/.vimrc
echo ".vimrc Populated." # debug print

## Zellij Templates
mkdir -p ~/.config/zellij/layouts # Create folder if it doesnt exist
cp "$SCRIPT_DIR/zlayouts/"*.kdl ~/.config/zellij/layouts # Move the templates
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


sh ./Installs/SystemConfig.sh

# Convert the array into the GSettings format: ['app1', 'app2', 'app3']
FORMATTED_LIST=$(printf "'%s'," "${WANTED_APPS[@]}" | sed 's/,$//')
gsettings set org.gnome.shell favorite-apps "[$FORMATTED_LIST]"
echo "Pinned dashboard apps have been updated."

# Set Zen as default browser
xdg-settings set default-web-browser zen.desktop
echo "Zen set as the default. Namaste.
