# Sets a variable for the directory *this* script runs in, for calling elsewhere
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd) 

# Turn the snap block on and off
SNAP="true"
# SNAP="false"

# echo $SCRIPT_DIR # Debug print
sudo apt update #  > /dev/null 2>&1
sudo apt upgrade # > /dev/null 2>&1
# ^ commented out portions will suppress output of commands
#       changes the output from the terminal to the arbitrary possition that gets nulled

# Banner first for *dramatic* purposes
sudo apt install sysvbanner > /dev/null 2>&1

banner "| System |"
banner "| Starts |"
sleep 3

echo "We shall begin with the apt packages...."
sudo apt install -y $(cat "$SCRIPT_DIR/pkg-lists/apt.txt")

echo "Now for the snap packages!"

# Snap installation
    

# More complex route, above would error with how it fed
# the command was passed with all at once
#    quite a headache compared to apt...
#    first while block is normal while second is classic...
#
if [[ "$SNAP" == "true" ]]; then
    while IFS= read -r snap_pkg || [ -n "$snap_pkg" ]; 
        do
	
		# Install the package
		if snap list "$snap_pkg" >/dev/null 2>&1; then
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
    done < ./pkg-lists/snap.txt 

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
    done < ./pkg-lists/snap-classic.txt
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

read -p "Setup Portainer?? (y/n)" port_flag # Ask user if portainer should be setup


if [[ "$install-type" == 'main' ]]; then
    # Zen browser install
    curl -fsSL https://github.com/zen-browser/updates-server/raw/refs/heads/main/install.sh | $SHELL

    git clone https://github.com/HiddenWaste/DND 

fi
        

if [[ "$port_flag" == 'y' ]]; then
    # Docker compose up portainer...
    cwd="$SCRIPT_DIR../dockerfiles/portainer/" # Change working directory to portainer
    sudo docker compose up -d                   # Spin up portainer
    echo "Strait of Hormuz has been opened!"    # Witty finished message
else
    echo "Skipping portainer...."           # Else Message
fi

echo "Save the world. This is my final message. Goodbye."
