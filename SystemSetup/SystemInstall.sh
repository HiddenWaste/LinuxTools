sudo apt update # > /dev/null 2>&1
sudo apt upgrade # > /dev/null 2>&1

# Banner first for *dramatic* purposes
sudo apt install sysvbanner # > /dev/null 2>&1

banner "| System |"
banner "| Starts |"
sleep 3

echo "We shall begin with the apt packages...."
sudo apt install -y $(cat ./pkg-lists/apt.txt)

echo "Now for the snap packages!"

# Snap installation
# xargs -a ./pkg-lists/snap.txt sudo snap install
# With classic flag
#xargs -a ./pkg-lists/snap-classic.txt sudo snap install --classic

# More complex route, above would error with how it fed
# the command was passed with all at once
#    quite a headache compared to apt...
#    first while block is normal while second is classic...
#
#while IFS= read -r snap_pkg || [ -n "$snap_pkg" ]; 
#	do
#	
#		# Install the package
#		if snap list "$snap_pkg" >/dev/null 2>&1; then
#			echo ">> $snap_pkg already here!"
#		else
#			banner "$snap_pkg"
#			sudo snap install "$snap_pkg"
		
#
	#	if [ $? -ne 0 ]; then 
#	#		echo "$snap_pkg failed, next." 
	#	fi

		# Watch for it to finish
#			while pgrep -x "snap" > /dev/null; do sleep 1; done
#	fi
#done < ./pkg-lists/snap.txt 

# --- CLASSIC FLAGGED PACKAGES ------ #

#while IFS= read -r snap_pkg || [ -n "$snap_pkg" ]; 
#	do
	
		# Install the package
#		if snap list "$snap_pkg" >/dev/null 2>&1; then
#			echo ">> $snap_pkg already here!"
#		else
#			banner "$snap_pkg"
#			sudo snap install "$snap_pkg" --classic
		

	#	if [ $? -ne 0 ]; then 
#	#		echo "$snap_pkg failed, next." 
	#	fi

		# Watch for it to finish
#			while pgrep -x "snap" > /dev/null; do sleep 1; done
#	fi
#done < ./pkg-lists/snap-classic.txt

#  Various dotfiles

## Gnome terminal profiles
dconf load /org/gnome/terminal/legacy/profiles:/ < terminal_profiles.dconf

## Vim RC File
ln -s -f ./dotfiles/.vimrc ~/.vimrc

## Zellij Templates
mkdir -p ~/.config/zellij/layouts # Create folder if it doesnt exist
mv ./zlayouts/*.kdl ~/.config/zellij/layouts # Move the templates

echo "Rise up gamer."


