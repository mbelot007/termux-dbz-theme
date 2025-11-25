#!/data/data/com.termux/files/usr/bin/bash
# Dragon Ball Z Termux Theme - Auto Installer

set -e

echo "========================================="
echo "Dragon Ball Z Termux Theme Installer"
echo "========================================="
echo ""

# Check if running in Termux
if [ ! -d "/data/data/com.termux" ]; then
    echo "Error: This script must be run in Termux"
    exit 1
fi

# Install dependencies
echo "[1/5] Installing dependencies..."
pkg update -y
pkg install -y zsh figlet fastfetch jq curl

# Create bin directory
echo "[2/5] Setting up directories..."
mkdir -p ~/.local/bin

# Download greeting script
echo "[3/5] Downloading Dragon Ball Z greeting script..."
curl -sL https://raw.githubusercontent.com/mbelot007/termux-dbz-theme/main/dbz-greeting -o ~/.local/bin/dbz-greeting
chmod +x ~/.local/bin/dbz-greeting

# Backup existing zshrc
if [ -f ~/.zshrc ]; then
    echo "[4/5] Backing up existing .zshrc..."
    cp ~/.zshrc ~/.zshrc.backup.$(date +%Y%m%d_%H%M%S)
fi

# Check if already installed
if grep -q "DBZ_SHOWN" ~/.zshrc 2>/dev/null; then
    echo "Dragon Ball Z greeting already configured in .zshrc"
else
    echo "[5/5] Configuring .zshrc..."

    # Add to zshrc
    cat >> ~/.zshrc << 'ZSHRC_EOF'

# Path additions (for dbz-greeting)
export PATH="$HOME/.local/bin:$PATH"

# Dragon Ball Z Greeting
if [[ -o interactive ]] && [[ -z "$DBZ_SHOWN" ]]; then
    export DBZ_SHOWN=1
    dbz-greeting
fi
ZSHRC_EOF
fi

echo ""
echo "========================================="
echo "Installation Complete!"
echo "========================================="
echo ""
echo "Close and reopen Termux to see your"
echo "Dragon Ball Z greeting!"
echo ""
echo "Or test it now: dbz-greeting"
echo ""
