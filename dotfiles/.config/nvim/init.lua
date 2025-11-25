-- Neovim Configuration with Catppuccin Frappe Theme

-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.termguicolors = true

-- Bootstrap lazy.nvim package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugin configuration
require("lazy").setup({
  -- Catppuccin theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "frappe",
        transparent_background = false,
        term_colors = true,
        integrations = {
          treesitter = true,
          native_lsp = { enabled = true },
          telescope = true,
          gitsigns = true,
          fzf = true,
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  -- Treesitter for syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "vim", "python", "javascript", "bash", "markdown" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  -- Essential Tim Pope plugins
  "tpope/vim-commentary",
  "tpope/vim-surround",
  "tpope/vim-repeat",
  "tpope/vim-fugitive",

  -- Auto-pairs
  "jiangmiao/auto-pairs",

  -- FZF integration (use system fzf from pkg)
  "junegunn/fzf.vim",

  -- Git signs
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "+" },
          change = { text = "~" },
          delete = { text = "-" },
          topdelete = { text = "^" },
          changedelete = { text = "~-" },
        },
      })
    end,
  },

  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          theme = "catppuccin",
          section_separators = "",
          component_separators = "|",
        },
      })
    end,
  },

  -- Start screen (alpha-nvim)
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      -- Pikachu ASCII art header
      dashboard.section.header.val = {
        [[                                ]],
        [[     \`;-.          ___,          ]],
        [[       `.\`\_....\_/`.-"`        ]],
        [[         \        /      ,       ]],
        [[         /()   () \    .' `-._   ]],
        [[        |)  .    ()\  /   _.'    ]],
        [[        \  -'-     ,; '. <       ]],
        [[         ;.__     ,;|   > \      ]],
        [[        / ,    / ,  |.-'.-'      ]],
        [[       (_/    (_/ ,;|.<`         ]],
        [[         \    ,     ;-`          ]],
        [[          >   \    /             ]],
        [[         (_,-'`> .'              ]],
        [[               (_,'               ]],
        [[                                ]],
        [[  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━  ]],
        [[    ⚡ Pika-Code with Power! ⚡   ]],
        [[  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━  ]],
        [[                                ]],
      }

      -- Custom buttons with Catppuccin Frappe colors
      dashboard.section.buttons.val = {
        dashboard.button("f", "  Find file", ":Files<CR>"),
        dashboard.button("n", "  New file", ":ene <BAR> startinsert<CR>"),
        dashboard.button("r", "  Recent files", ":History<CR>"),
        dashboard.button("g", "  Find text", ":Rg<CR>"),
        dashboard.button("c", "  Config", ":e ~/.config/nvim/init.lua<CR>"),
        dashboard.button("z", "  Zshrc", ":e ~/.zshrc<CR>"),
        dashboard.button("l", "󰒲  Lazy (plugins)", ":Lazy<CR>"),
        dashboard.button("q", "  Quit", ":qa<CR>"),
      }

      -- Footer with quote/info
      local function footer()
        local datetime = os.date(" %Y-%m-%d   %H:%M:%S")
        local version = vim.version()
        local nvim_version = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch
        return { "", datetime, nvim_version, "", "⚡ Thunderbolt attacks await! ⚡" }
      end

      dashboard.section.footer.val = footer()

      -- Colors for Catppuccin Frappe
      vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#8caaee" })      -- Blue
      vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#a6d189" })     -- Green
      vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = "#ef9f76" })    -- Peach
      vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#ca9ee6" })      -- Mauve

      dashboard.section.header.opts.hl = "AlphaHeader"
      dashboard.section.buttons.opts.hl = "AlphaButtons"
      dashboard.section.footer.opts.hl = "AlphaFooter"

      alpha.setup(dashboard.config)
    end,
  },
})

-- Key mappings (matching vim config)
vim.g.mapleader = " "
local map = vim.keymap.set

-- Save and quit
map("n", "<leader>w", ":w<CR>")
map("n", "<leader>q", ":q<CR>")
map("n", "<leader>x", ":x<CR>")

-- Clear search
map("n", "<leader>/", ":noh<CR>")

-- FZF shortcuts
map("n", "<leader>f", ":Files<CR>")
map("n", "<leader>b", ":Buffers<CR>")
map("n", "<leader>g", ":GFiles<CR>")
map("n", "<leader>r", ":Rg<CR>")
map("n", "<leader>h", ":History<CR>")

-- Git shortcuts
map("n", "<leader>gs", ":Git<CR>")
map("n", "<leader>gc", ":Git commit<CR>")
map("n", "<leader>gp", ":Git push<CR>")
map("n", "<leader>gl", ":Git log<CR>")
