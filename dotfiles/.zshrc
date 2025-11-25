

# Path additions (must be first for scripts to work)
export PATH="$HOME/.local/bin:$PATH"

# ==========================================
# Dragon Ball Z Shenron + Stats Startup
# ==========================================
# Only run on interactive shell startup
if [[ -o interactive ]] && [[ -z "$DBZ_SHOWN" ]]; then
    export DBZ_SHOWN=1
    dbz-greeting
fi

# # Node/npm
export NPM_CONFIG_PREFIX="$HOME/.npm-global"
export PATH="$NPM_CONFIG_PREFIX/bin:$PATH"

# # Android storage shortcut
export STORAGE="$HOME/storage/shared"

# eza (better ls) with Catppuccin-inspired colors
alias ls='eza --icons --group-directories-first'
alias ll='eza -lh --icons --group-directories-first'
alias la='eza -lah --icons --group-directories-first'
alias tree='eza --tree --icons'

# Catppuccin Frappe theme for FZF
# # Based on official Catppuccin Frappe palette
export FZF_DEFAULT_OPTS=" \
--color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
--color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
--color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284"

# ==========================================
# Zsh Options & Settings
# ==========================================
#
# History settings
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY

# Directory navigation
setopt AUTO_CD              # Just type directory name to cd
setopt AUTO_PUSHD           # Make cd push old directory onto stack
setopt PUSHD_IGNORE_DUPS    # Don't push duplicates
setopt PUSHD_MINUS          # Swap meaning of + and -

# Enable correction
setopt CORRECT

# Better globbing
setopt EXTENDED_GLOB
setopt GLOB_DOTS  # Include hidden files in glob

# ==========================================
# Completion System Initialization
# ==========================================
# Additional completions (must be before compinit)
fpath=(~/.zsh/zsh-completions/src $fpath)

# Initialize completion system
autoload -Uz compinit
compinit

# Completion settings (must be after compinit)
# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Colored completion (uses LS_COLORS)
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Enable menu selection
zstyle ':completion:*' menu select

# Better completion for kill command
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always

# Group completions by category
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'

# ==========================================
# Zsh Plugins Configuration
# ==========================================
# Autosuggestion settings
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#626880"  # Catppuccin Frappe surface2
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_USE_ASYNC=1

# Load autosuggestion
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Zsh Syntax Highlighting (must be sourced at the end)
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# History substring search (must be after syntax highlighting)
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

# Bind arrow keys to history substring search
bindkey '^[[A' history-substring-search-up   # Up arrow
bindkey '^[[B' history-substring-search-down # Down arrow

# ==========================================
# External Tool Initialization
# ==========================================
# Initialize zoxide
eval "$(zoxide init zsh)"

# Initialize Starship
eval "$(starship init zsh)"

