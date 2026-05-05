sudo add-apt-repository ppa:agornostal/ulauncher

sudo apt update

sudo apt install ulauncher

# Ensure directory exists
mkdir -p ~/.local/share/ulauncher/extensions/

# Loop through your txt file
while read -r repo; do
    # Extract folder name from URL (e.g., ulauncher-ai)
    folder_name=$(basename "$repo" .git)
    target="$HOME/.local/share/ulauncher/extensions/$folder_name"

    if [ ! -d "$target" ]; then
        git clone "$repo" "$target"
    fi
done < ../dotfiles/ulauncher-ext.txt

curl -fsSL https://ollama.com/install.sh | sh
