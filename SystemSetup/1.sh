# Sets a variable for the directory *this* script runs in, for calling elsewhere
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd) 
# echo $SCRIPT_DIR # Debug print

read -p "Whoa Nelly! Just what kinda user are YOU?? (main \ work) :" installType

echo "Alrighty then! first, we start with the absolute basics. Update and upgrade."
sleep 1

sudo apt update
sudo apt upgrade

echo "Now, for just a mass of apt packages."
sudo apt install -y $(cat "$SCRIPT_DIR/pkg-lists/apt.txt")

# -- ZEN BROWSER -- #
echo "Gotta get the best browser out there!"
if command -v zen &> /dev/null; then
    echo "Zen Browser is already installed. Skipping..."
else
    echo "Installing Zen Browser..."
    curl -fsSL https://github.com/zen-browser/updates-server/raw/refs/heads/main/install.sh | $SHELL
fi

# -- KITTY -- #
echo "Now for my preferred terminal: Kitty"
# sh ./VariousInstalls/kittySetup.sh

# Where the installs begin to differ
if [[ "$installType" == "main" ]]; then
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
    sleep  2
fi
           
if [[ "$installType" == "work" ]]; then
    git config --global user.name cartergordon
    git config --global user.email carter.gordon@usiouxfalls.edu
fi

# sh $SCRIPT_DIR/VariousInstalls/SystemConfig.sh

echo "Save the world. This is my final message. Goodbye."
