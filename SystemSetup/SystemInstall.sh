# Sets a variable for the directory *this* script runs in, for calling elsewhere
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd) 

# General System settings
## ENFORCE DARK MODE. NO LIGHT MODE PROPAGANDA.
# For GTK4 and Libadwaita apps (Modern Ubuntu)
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
# For GTK3 and legacy apps
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'

# New windows open center
gsettings set org.gnome.mutter center-new-windows true

read -p "Whoa Nelly! Just what kinda user are YOU?? (main\work" installType

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


# Where the installs begin to differ
if [[ "$installType" == "main" ]]; then
        git config user.name HiddenWaste
        git config user.email cartergordon13@gmail.com

            
    
    # zen-browser
     curl -fsSL https://github.com/zen-browser/updates-server/raw/refs/heads/main/install.sh | $SHELL
    sudo apt install libreoffice
    sudo apt-get install supercollider-ide
    sudo apt install qbittorrent
    echo "Now for the snap packages!"
    # Snap installation
    if [[ "$installType" == "main" ]]; then
        while IFS= read -r snap_pkg || [ -n "$snap_pkg" ];
            do
            
                # Install the package
                if snap list "$snap_pkg"; then
                    echo ">> $snap_pkg already here!"
                else
                    banner "$snap_pkg"
                    sudo snap install "$snap_pkg"
                

                    if [ $? -ne 0 ]; then 
                        echo "$snap_pkg failed, next." 
                    fi

                    #  Watch for it to finish
                    while pgrep -x "snap" > /dev/null; do sleep 1; done
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
                        while pgrep -x "snap" > /dev/null; do sleep 1; done
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

#  --------- VARIOUS DOTFILES ---------- #
## Gnome terminal profiles
dconf load /org/gnome/terminal/legacy/profiles:/ < "$SCRIPT_DIR/terminal_profiles.dconf"
echo "Gnome Terminal Profiles Populated." # debug print

## Vim RC File
ln -s -f "$SCRIPT_DIR/dotfiles/.vimrc" ~/.vimrc
echo ".vimrc Populated." # debug print

## Zellij Templates
mkdir -p ~/.config/zellij/layouts # Create folder if it doesnt exist
cp "$SCRIPT_DIR/zlayouts/"*.kdl ~/.config/zellij/layouts # Move the templates
echo "Zellij Templates Populated." # debug print


echo "Save the world. This is my final message. Goodbye."
