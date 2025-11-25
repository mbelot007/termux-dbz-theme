# Dotfiles - Complete Termux Configuration

My complete Termux setup with Catppuccin Frappe theme across all tools.

## What's Included

### Shell Configuration
- `.zshrc` - Zsh configuration with plugins, aliases, and Dragon Ball Z greeting
- `.gitconfig` - Git configuration with git-delta integration

### Editor Configurations
- `.vimrc` - Vim setup with vim-startify and plugins (Pikachu theme)
- `.config/nvim/init.lua` - Neovim with lazy.nvim and alpha-nvim (Pikachu theme)

### Tool Configurations
- `.config/starship.toml` - Starship prompt with Catppuccin Frappe colors
- `.config/bat/config` - Bat syntax highlighting theme
- `.config/lazygit/config.yml` - Lazygit with Catppuccin Frappe theme
- `.config/micro/settings.json` - Micro editor settings

### Termux Settings
- `.termux/termux.properties` - Extra keys and Termux preferences

## Installation

### Full Setup (All Dotfiles)

```bash
cd ~
git clone https://github.com/mbelot007/termux-dbz-theme.git
cd termux-dbz-theme/dotfiles

# Backup your existing configs
mkdir -p ~/dotfiles-backup
cp ~/.zshrc ~/dotfiles-backup/ 2>/dev/null
cp ~/.vimrc ~/dotfiles-backup/ 2>/dev/null
cp ~/.gitconfig ~/dotfiles-backup/ 2>/dev/null

# Copy dotfiles
cp .zshrc ~/
cp .vimrc ~/
cp .gitconfig ~/
cp -r .config/* ~/.config/
cp -r .termux/* ~/.termux/

# Reload settings
source ~/.zshrc
termux-reload-settings
```

### Individual Configs

Pick and choose what you want:

**Just the shell config:**
```bash
cp dotfiles/.zshrc ~/
source ~/.zshrc
```

**Just the vim/neovim configs:**
```bash
cp dotfiles/.vimrc ~/
cp dotfiles/.config/nvim/init.lua ~/.config/nvim/
vim +PlugInstall +qa  # Install vim plugins
```

**Just the prompt:**
```bash
cp dotfiles/.config/starship.toml ~/.config/starship/
```

## What You Get

### Color Scheme
Everything themed with **Catppuccin Frappe**:
- Blue: #8caaee
- Mauve: #ca9ee6
- Green: #a6d189
- Yellow: #e5c890
- Red: #e78284
- Text: #c6d0f5

### Zsh Features
- Syntax highlighting
- Autosuggestions
- History substring search
- Starship prompt
- Zoxide (smart cd)
- Eza aliases (better ls)
- FZF with Catppuccin colors

### Vim/Neovim Plugins
- Catppuccin theme
- vim-commentary (easy commenting)
- vim-surround (surround text)
- vim-fugitive (git integration)
- auto-pairs (bracket closing)
- fzf.vim (fuzzy finder)
- Pikachu start screens

### Tools Configured
- **bat** - Syntax highlighting with Catppuccin
- **lazygit** - Git TUI with Catppuccin theme
- **git-delta** - Beautiful diffs
- **starship** - Fast, customizable prompt
- **micro** - Simple editor with Catppuccin

## Dependencies

Install these packages first:

```bash
pkg update && pkg upgrade
pkg install zsh git vim neovim starship zoxide eza fzf bat lazygit \
            git-delta micro ripgrep fd figlet fastfetch jq curl
```

### Zsh Plugins

The .zshrc expects these plugins in `~/.zsh/`:

```bash
mkdir -p ~/.zsh
cd ~/.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-completions
```

## Customization

All configs are heavily commented. Edit any file to customize:

- Colors: Search for RGB values (#8caaee format)
- Aliases: Check .zshrc for all shortcuts
- Keybindings: Both vim and zsh have custom mappings
- Prompt: Edit starship.toml for prompt customization

## Notes

- Configs assume Termux on Android
- Some paths are Termux-specific (`/data/data/com.termux/...`)
- The .zshrc includes the Dragon Ball Z greeting
- Vim plugins need to be installed with `:PlugInstall`
- Neovim plugins auto-install on first launch

---

These are my personal configs built over time. Feel free to use what you like and modify the rest!
