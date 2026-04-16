# Sets a variable for the directory *this* script runs in, for calling elsewhere
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd) 
# echo "SystemInstall.sh: $SCRIPT_DIR" && pause # Debug print

# Allow for more modular installation
read -p "Whoa Nelly! Just what kinda user are YOU?? (main \ work) :" installType

sudo apt update # This is also just best practice to do before
sudo apt upgrade # each time you install something new

echo "Now, for just a mass of apt packages."
sudo apt install -y $(cat "$SCRIPT_DIR/pkg-lists/apt.txt")

# This section is for all my preferred applications I can
# programmaticaly populate so far, you can find reasonings in
# The inventory script, here will be basic *what* it is
./VariousInstalls/kittySetup.sh # Preffered Terminal Emulator
                                # Pretty well customized
./VariousInstalls/fastfetch.sh # Gotta have the vibes right
./VariousInstalls/ulauncher.sh # AMazing app launcher!
./VariousInstalls/zen.sh

# Where the installs begin to differ
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
./VariousInstalls/SystemConfig.sh

echo "Change da world. My final message. Goodbye."
