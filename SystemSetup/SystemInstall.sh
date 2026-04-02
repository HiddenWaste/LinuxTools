# Sets a variable for the directory *this* script runs in, for calling elsewhere
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd) 
# echo "SystemInstall.sh: $SCRIPT_DIR" && pause # Debug print

read -p "Whoa Nelly! Just what kinda user are YOU?? (main \ work) :" installType

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
./VariousInstalls/kittySetup.sh

# Fastfetch since neofetch is dead...
./VariousInstalls/fastfetch.sh


# Where the installs begin to differ
if [[ "$installType" == "main" ]]; then
    ./VariousInstalls/mullvad.sh

    sudo apt install libreoffice
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
