

# sudo apt update && sudo apt upgrade

sudo apt install flatpak

# We add the flathub repository
#   installing this allows us to later on install things from flathub
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Now we can install bambulab studio!
flatpak install flathub com.bambulab.BambuStudio -y

# AFTER INSTALLATION:

