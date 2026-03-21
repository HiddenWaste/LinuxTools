echo "Let's install those snap packages."
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

while IFS= read -r snap_pkg || [ -n "$snap_pkg" ];
	do
		#check if package is already installed
		if snap list "$snap_pkg"; then
			echo ">> $snap_pkg is already here!"
		else
			banner "$snap_pkg"
			sudo snap install "snap_pkg"
		fi
	done < "$SCRIPT_DIR/pkg-lists/snap.txt"

while IFS= read -r snap_pkg || [ -n "$snap_pkg" ];
	do
		#check if package is already installed
		if snap list "$snap_pkg"; then
			echo ">> $snap_pkg is already here!"
		else
			banner "$snap_pkg"
			sudo snap install "snap_pkg" --classic
		fi
	done < "$SCRIPT_DIR/pkg-lists/snap-classic.txt"

