# Dragon Ball Z Termux Theme

Epic Dragon Ball Z themed greeting screen for Termux on Android, featuring Shenron and a scouter-style system monitor.

## Features

- **Shenron Dragon** - Beautiful Braille Unicode ASCII art of the Eternal Dragon
- **Power Level Display** - Shows ">9000!" because your phone is legendary
- **Real-time Stats** - Live RAM and Battery percentages
- **Catppuccin Frappe Theme** - Beautiful pastel colors throughout
- **Status Indicator** - "SAIYAN MODE ACTIVE"
- **Figlet Welcome** - Stylish "Welcome Warrior" banner
- **Shenron Quote** - Fullwidth text for dramatic effect

## Preview

```
[Shenron Dragon ASCII Art - 30 lines of majestic dragon]

            ╔═════════════════════════════════════════════════════════════════╗
            ║              POWER LEVEL: ██████████ >9000!                     ║
            ║              RAM: 76%  |  BATTERY: 85%                          ║
            ║              STATUS: SAIYAN MODE ACTIVE                         ║
            ╚═════════════════════════════════════════════════════════════════╝

            __      __   _                   __      __            _
            \ \    / /__| |__ ___ _ __  ___  \ \    / /_ _ _ _ _ _(_)___ _ _
             \ \/\/ / -_) / _/ _ \ '  \/ -_)  \ \/\/ / _` | '_| '_| / _ \ '_|
              \_/\_/\___|_\__\___/_|_|_\___|   \_/\_/\__,_|_| |_| |_\___/_|

            "State your wish... I shall grant it!"
```

## Quick Install

```bash
curl -sL https://raw.githubusercontent.com/YOUR_USERNAME/termux-dbz-theme/main/install.sh | bash
```

## Manual Installation

### Prerequisites

Install required packages in Termux:

```bash
pkg update && pkg upgrade
pkg install zsh figlet fastfetch jq curl
```

### Installation Steps

1. Download the greeting script:

```bash
mkdir -p ~/.local/bin
curl -sL https://raw.githubusercontent.com/YOUR_USERNAME/termux-dbz-theme/main/dbz-greeting -o ~/.local/bin/dbz-greeting
chmod +x ~/.local/bin/dbz-greeting
```

2. Add to your `.zshrc`:

Add this to the top of your `~/.zshrc` file (before any other commands):

```bash
# Path additions (must be first)
export PATH="$HOME/.local/bin:$PATH"

# Dragon Ball Z Greeting
if [[ -o interactive ]] && [[ -z "$DBZ_SHOWN" ]]; then
    export DBZ_SHOWN=1
    dbz-greeting
fi
```

3. Reload your shell:

```bash
source ~/.zshrc
```

Or close and reopen Termux.

## Customization

### Change Colors

Edit `~/.local/bin/dbz-greeting` and modify the color codes:

```bash
local GREEN='\033[38;2;166;209;137m'   # Green accents
local YELLOW='\033[38;2;229;200;144m'  # Yellow/Gold
local MAUVE='\033[38;2;202;158;230m'   # Purple/Mauve
local RED='\033[38;2;231;130;132m'     # Red (>9000!)
local BLUE='\033[38;2;140;170;238m'    # Blue borders
```

These are RGB values from the Catppuccin Frappe palette. You can use any RGB color with the format `\033[38;2;R;G;Bm`.

### Change the Quote

Find this line in the script:

```bash
echo "            ${MAUVE}＂Ｓｔａｔｅ ｙｏｕｒ ｗｉｓｈ．．． Ｉ ｓｈａｌｌ ｇｒａｎｔ ｉｔ！＂${RESET}"
```

Replace with your favorite Dragon Ball quote. Popular options:

- "Your wish has been granted. Farewell!"
- "I am the Eternal Dragon. Speak your wish!"
- "I will grant you any wish. Now, speak!"

### Change the Figlet Text

Replace "Welcome Warrior" with anything you want:

```bash
figlet -f small "Your Text Here" | sed 's/^/            /'
```

Try these:
- "Super Saiyan"
- "Kamehameha"
- "Over 9000"
- Your name

### List available figlet fonts:

```bash
ls /data/data/com.termux/files/usr/share/figlet/
```

## Requirements

- **Termux** (from F-Droid, NOT Play Store)
- **zsh** shell
- **figlet** - ASCII art text generator
- **fastfetch** - System information tool
- **jq** - JSON processor for parsing fastfetch output

## How It Works

The script runs automatically when you start a new interactive zsh session. It:

1. Checks if it's already been shown (prevents duplicate runs)
2. Fetches real-time system stats using fastfetch
3. Displays the Shenron dragon using Braille Unicode characters
4. Shows a scouter-style stats box with your power level
5. Renders "Welcome Warrior" using figlet
6. Displays Shenron's quote in fullwidth characters

The `DBZ_SHOWN` environment variable ensures it only runs once per session, so you won't see it every time you run a command.

## Troubleshooting

**Greeting doesn't show on startup:**
- Verify PATH is set before the greeting code in `.zshrc`
- Check script permissions: `ls -la ~/.local/bin/dbz-greeting`
- Test manually: `dbz-greeting`

**Border alignment issues:**
- Terminal must be at least 80 columns wide
- Some fonts may cause alignment issues
- Try the default Termux font

**Missing or incorrect stats:**
- Install fastfetch: `pkg install fastfetch`
- Install jq: `pkg install jq`
- Test fastfetch: `fastfetch --structure Memory Battery --pipe --format json`

**Dragon doesn't display correctly:**
- Your terminal must support Braille Unicode characters
- Update Termux: `pkg upgrade`
- Try a different font that supports Unicode

## Advanced

### Disable for specific sessions

If you want to skip the greeting for a particular session:

```bash
DBZ_SHOWN=1 zsh
```

### Run manually anytime

```bash
dbz-greeting
```

### Uninstall

Remove the script and zshrc additions:

```bash
rm ~/.local/bin/dbz-greeting
# Then edit ~/.zshrc and remove the Dragon Ball Z greeting section
```

## Contributing

Contributions are welcome! Feel free to:

- Report bugs via GitHub Issues
- Submit pull requests with improvements
- Share your customizations
- Suggest new Dragon Ball themed features

## License

MIT License - Free to use, modify, and distribute.

## Credits

- Shenron Braille Unicode art
- Catppuccin Frappe color palette
- Built for the Termux and Dragon Ball Z communities

---

*"What?! 9000?! There's no way that can be right!"* - Vegeta

**If you enjoyed this, give it a star on GitHub!**
