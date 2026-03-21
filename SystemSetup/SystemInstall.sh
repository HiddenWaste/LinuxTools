# Sets a variable for the directory *this* script runs in, for calling elsewhere
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd) 

echo "Good lord, it's too bright in here, forcing dark mode."
# General System settings
## ENFORCE DARK MODE. NO LIGHT MODE PROPAGANDA.
# For GTK4 and Libadwaita apps (Modern Ubuntu)
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
# For GTK3 and legacy apps
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'

# New windows open center
gsettings set org.gnome.mutter center-new-windows true

read -p "Whoa Nelly! Just what kinda user are YOU?? (main \ work) :" installType

# Do banner first to also get the prompt out of the way
sudo apt install sysvbanner

banner "||HOWDY||" # Debug print, also ensure packages install correctly
sleep 3

# echo $SCRIPT_DIR # Debug print
echo "WHOA that was a big ol thing of text huh?"
echo "Alrighty then. first, we start with the absolute basics. Update and upgrade."
sleep 1


sudo apt update
sudo apt upgrade
# ^ commented out portions will suppress output of commands
#       changes the output from the terminal to the arbitrary possition that gets nulled

# Banner first for *dramatic* purposes
echo "Now we do them apt packages I put on *every* system. My EDC if you will"
sudo apt install -y $(cat "$SCRIPT_DIR/pkg-lists/apt.txt")

echo "Gotta get the best browser out there!"
# zen-browser
curl -fsSL https://github.com/zen-browser/updates-server/raw/refs/heads/main/install.sh | $SHELL

echo "Now for my preferred terminal: Kitty"
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# Where the installs begin to differ
if [[ "$installType" == "main" ]]; then
    git config --global user.name HiddenWaste
    git config --global user.email cartergordon13@gmail.com
     
    # mullvadvpn
    
    sudo apt install libreoffice
    sudo apt-get install supercollider-ide
    sudo apt install qbittorrent
   
     
    # Snap installation
    echo "Now for the snap packages!"
    
    if [[ "$installType" == "main" ]]; then
        while IFS= read -r snap_pkg || [ -n "$snap_pkg" ];
            do
            
                # Install the package
                if snap list "$snap_pkg"; then
                    echo ">> $snap_pkg already here!"
                else
                    banner "$snap_pkg"
                    sudo snap install "$snap_pkg" --no-wait
                

                    if [ $? -ne 0 ]; then 
                        echo "$snap_pkg failed, next." 
                    fi

                    #  Watch for it to finish
                    # while pgrep -x "snap" > /dev/null; do sleep 1; done
                fi
            done < "$SCRIPT_DIR/pkg-lists/snap.txt" 

            # --- CLASSIC FLAGGED PACKAGES ------ #

            while IFS= read -r snap_pkg || [ -n "$snap_pkg" ]; 
                do
                    # Install the package
                    if snap list "$snap_pkg" >/dev/null 2>&1; then

                    echo ">> $snap_pkg already here!"
                    else
                        banner "$snap_pkg"
                        sudo snap install "$snap_pkg" --classic
                

                        if [ $? -ne 0 ]; then 
                            echo "$snap_pkg failed, next." 
                        fi

                        # Watch for it to finish
                    #    while pgrep -x "snap" > /dev/null; do sleep 1; done
                    fi
        done < "$SCRIPT_DIR/pkg-lists/snap-classic.txt"
    fi 
    echo "Now we got the snappy stuffy out the way, what say you we get a bit frisky?"
    sleep  2
           
     # Docker compose up portainer...
    cwd="$SCRIPT_DIR../dockerfiles/portainer/" # Change working directory to portainer
    sudo docker compose up -d                   # Spin up portainer
    echo "Strait of Hormuz has been opened!"    # Witty finished message
else
    echo "Skipping portainer...."           # Else Message
fi


if [[ "$installType" == "work" ]]; then
    git config user.name cartergordon
    git config user.email carter.gordon@usiouxfalls.edu
fi


#!/bin/bash

# --- 1. Conditional Installation of Zen Browser ---
#if command -v zen &> /dev/null; then
#    echo "Zen Browser is already installed. Skipping..."
#else
#    echo "Installing Zen Browser..."
#    curl -fsSL https://github.com/zen-browser/updates-server/raw/refs/heads/main/install.sh | $SHELL
#fi

# --- 2. Configure Pinned Apps (The Dock) ---
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

#  --------- PERSONALIZATION & DOTFILES ---------- #
## Gnome terminal profiles
dconf load /org/gnome/terminal/legacy/profiles:/ < "$SCRIPT_DIR/terminal_profiles.dconf"
echo "Gnome Terminal Profiles Populated." # debug print

## Vim RC File
ln -s -f "$SCRIPT_DIR/dotfiles/.vimrc" ~/.vimrc
echo ".vimrc Populated." # debug print

## Bash RC File
ln -s -f "$SCRIPT_DIR/dotfiles/.bashrc" ~/.bashrc
echo ".bashrc Populated."

## .gitconfig
ln -s -f "$SCRIPT_DIR/dotfiles/.gitconfig" ~/.gitconfig
echo ".gitconfig Populated." # debug print

## Zellij Templates
mkdir -p ~/.config/zellij/layouts # Create folder if it doesnt exist
cp "$SCRIPT_DIR/zlayouts/"*.kdl ~/.config/zellij/layouts # Move the templates
echo "Zellij Templates Populated." # debug print

echo "Save the world. This is my final message. Goodbye."
