sudo pacman -S bluez 
sudo pacman -Sy bluez-utils bluez-deprecated-tools
modprobe btusb
systemctl enable bluetooth
systemctl start bluetooth
# use bluetui for configuration or the waybar widget.
