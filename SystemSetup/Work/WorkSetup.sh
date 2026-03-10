sudo chmod +x ../SystemSetup.sh

bash ../SystemInstall.sh

cwd=$(pwd)

# Set Variables
USER="cartergordon"
USER_EMAIL="carter.gordon@usiouxfalls.edu"

read -p "BitBucket API-Key:" $BIT_API

# Git Config
git config user.name $USER
git config user.name $USER_EMAIL

mkdir -p ~/Code/

# Install work repositories
while IFS= read -r repo || [ -n "$repo" ];
do
	git clone https://$USER:$BIT_API@bitbucket.org/usiouxfalls/$repo ~/Code/$repo

	echo "Installed $repo!"
done < ../pkg-lists/

