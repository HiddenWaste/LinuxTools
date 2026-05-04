sudo pacman -Syyu mesa lib32-mesa intel-media-driver libelf lib32-libelf
sudo pacman -S hyprland kitty waybar dunst sddm qt5-wayland qt6-wayland
sudo systemctl enable sddm
sudo pacman -S polkit-kde-agent
sudo pacman -S xdg-desktop-portal-hyprland xdg-desktop-portal-gtk
sudo pacman -S swww wl-clipboard cliphist
# kitty vim ~/.config/hypr/hyprland.conf
