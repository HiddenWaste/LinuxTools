# 1. Update and Graphics (AMD Specific)
sudo pacman -Syyu mesa lib32-mesa libva-mesa-driver vulkan-radeon lib32-vulkan-radeon libelf lib32-libelf

# 2. The Hyprland Core
sudo pacman -S hyprland kitty waybar dunst sddm qt5-wayland qt6-wayland

# 3. Portals and Auth (Essential for screen sharing/apps)
sudo pacman -S xdg-desktop-portal-hyprland xdg-desktop-portal-gtk polkit-kde-agent

# 4. Utilities
sudo pacman -S swww wl-clipboard cliphist pipewire pipewire-pulse pipewire-alsa wireplumber pavucontrol

# 5. Appearance Fixes (Icons & Fonts)
sudo pacman -S ttf-font-awesome otf-font-awesome ttf-jetbrains-mono-nerd papirus-icon-theme

sudo systemctl enable sddm
