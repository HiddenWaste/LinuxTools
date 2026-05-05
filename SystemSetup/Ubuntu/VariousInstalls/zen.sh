# -- ZEN BROWSER -- #
# Only install if it doesn't already exist
if command -v zen &> /dev/null; then
    echo "zen already installed..."
else
    echo "finding inner peace with zen..."
    curl -fsSL https://github.com/zen-browser/updates-server/raw/refs/heads/main/install.sh | $SHELL
fi

xdg-settings set default-web-browser zen.desktop
echo "zen set as default browser"
