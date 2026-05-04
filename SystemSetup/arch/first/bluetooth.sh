  216  sudo pacman -S bluez
  217  sudo pacman -Sy bluez-utils bluez-deprecated-tools
  218  modprobe btusb
  220  systemctl enable bluetooth
  221  systemctl start bluetooth
