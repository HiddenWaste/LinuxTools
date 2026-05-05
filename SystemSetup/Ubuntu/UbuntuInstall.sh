# Sets a variable for the directory *this* script runs in, for calling elsewhere
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd) 
# echo "SystemInstall.sh: $SCRIPT_DIR" && pause # Debug print

# Allow for more modular installation
read -p "Whoa Nelly! Just what kinda user are YOU?? (main \ work) :" installType

sudo apt update # This is also just best practice to do before
sudo apt upgrade # each time you install something new

# echo "Now, for just a mass of apt packages." # debug print
sudo apt install -y $(cat "$SCRIPT_DIR/pkg-lists/apt.txt")

./VariousInstalls/kittySetup.sh # Preffered Terminal Emulator
./VariousInstalls/fastfetch.sh # Gotta have the vibes right
./VariousInstalls/ulauncher.sh # Amazing app launcher!
./VariousInstalls/zen.sh        # Favorite browser so far

# Where the installs differ slightly
if [[ "$installType" == "main" ]]; then
    ./VariousInstalls/mullvad.sh

    sudo apt-get install supercollider-ide
    sudo apt install qbittorrent
   
    # Snap installation
    ./snap-install.sh
fi
           
if [[ "$installType" == "work" ]]; then
    git config --global user.name cartergordon
    git config --global user.email carter.gordon@usiouxfalls.edu
    ./VariousInstalls/chrome.sh
fi

echo "Now we add all the little bells and whistles."
# If we are on an Ubuntu system, use that specific config..
if [[ lsb_release --id -s == "Ubuntu" ]]
    ./VariousInstalls/UbuntuConfig.sh
else
    echo "os could not be determined or not included."
fi

echo "Change da world. My final message. Goodbye."
