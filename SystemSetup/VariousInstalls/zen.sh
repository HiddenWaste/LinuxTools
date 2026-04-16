# -- ZEN BROWSER -- #
echo "Gotta get the best browser out there!"
if command -v zen &> /dev/null; then
    echo "Zen Browser is already installed. Skipping..."
else
    echo "Installing Zen Browser..."
    curl -fsSL https://github.com/zen-browser/updates-server/raw/refs/heads/main/install.sh | $SHELL
fi
