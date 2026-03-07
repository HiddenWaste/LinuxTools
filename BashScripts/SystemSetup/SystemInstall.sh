sudo apt update

sudo apt install -y $(cat ../sudo-apt-pkgs.txt)

echo "Now for the snap packages!"

xargs -a ../snap-packages.txt sudo snap install

echo "Rise up gamer."
