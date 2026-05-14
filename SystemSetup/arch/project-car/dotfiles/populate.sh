ln -sf $(pwd)/.bashrc ~/.bashrc
ln -sf $(pwd)/.vimrc ~/.vimrc
ln -sf $(pwd)/.bash_aliases ~/.bash_aliases
ln -sf $(pwd)/.gitconfig ~/.gitconfig

# 1. Remove the existing config folder (back it up first if needed!)
rm -rf ~/.config/hypr

# 2. Symlink your dotfiles folder to the config location
ln -s $(pwd)/hypr ~/.config/hypr

# 1. Remove the existing config folder (back it up first if needed!)
rm -rf ~/.config/kitty

# 2. Symlink your dotfiles folder to the config location
ln -s $(pwd)/kitty ~/.config/kitty
