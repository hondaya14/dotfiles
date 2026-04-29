-- =========================================================
-- Leader
-- =========================================================
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- =========================================================
-- Basic UI
-- =========================================================
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.showmode = false
vim.opt.laststatus = 3
vim.opt.cmdheight = 1
vim.opt.showcmd = false
vim.opt.ruler = false
vim.opt.scrolloff = 6
vim.opt.sidescrolloff = 8
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.pumheight = 10
vim.opt.pumblend = 0
vim.opt.winblend = 0
vim.opt.conceallevel = 0
vim.opt.fillchars = {
  eob = " ",
  vert = "│",
  fold = " ",
  foldopen = "",
  foldclose = "",
}

-- =========================================================
-- Editing
-- =========================================================
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.updatetime = 200
vim.opt.timeoutlen = 300

-- =========================================================
-- Search / Whitespace
-- =========================================================
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.list = false

-- =========================================================
-- File handling
-- =========================================================
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

-- =========================================================
-- Better splits / keymaps
-- =========================================================
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true })
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { silent = true })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { silent = true })
vim.keymap.set("n", "<leader>h", "<C-w>h", { silent = true })
vim.keymap.set("n", "<leader>j", "<C-w>j", { silent = true })
vim.keymap.set("n", "<leader>k", "<C-w>k", { silent = true })
vim.keymap.set("n", "<leader>l", "<C-w>l", { silent = true })

-- =========================================================
-- Bootstrap lazy.nvim
-- =========================================================
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

-- =========================================================
-- Plugins
-- =========================================================
require("lazy").setup({
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
      require("onedark").setup({
        style = "deep",
        transparent = false,
        term_colors = true,
        ending_tildes = false,
        cmp_itemkind_reverse = false,

        colors = {
          bg0 = "#1b2127",
          bg1 = "#232a32",
          bg2 = "#2d333b",
          bg3 = "#3a424d",
          fg = "#c5cdd9",
          grey = "#6b737c",
          red = "#e06c75",
          green = "#98c379",
          yellow = "#e5c07b",
          blue = "#61afef",
          purple = "#c678dd",
          cyan = "#56b6c2",
          orange = "#d19a66",
        },

        highlights = {
          Normal = { fg = "#c5cdd9", bg = "#1b2127" },
          NormalNC = { fg = "#c5cdd9", bg = "#1b2127" },
          NormalFloat = { fg = "#c5cdd9", bg = "#1b2127" },
          FloatBorder = { fg = "#2d333b", bg = "#1b2127" },

          SignColumn = { bg = "#1b2127" },
          LineNr = { fg = "#4b5563", bg = "#1b2127" },
          CursorLineNr = { fg = "#9aa5b1", bold = true },
          CursorLine = { bg = "#232a32" },

          Visual = { bg = "#2d333b" },
          Search = { fg = "#1b2127", bg = "#e5c07b" },
          IncSearch = { fg = "#1b2127", bg = "#61afef" },

          Comment = { fg = "#6b737c", italic = true },

          VertSplit = { fg = "#2d333b" },
          WinSeparator = { fg = "#2d333b" },

          Pmenu = { fg = "#c5cdd9", bg = "#232a32" },
          PmenuSel = { fg = "#1b2127", bg = "#61afef" },

          StatusLine = { fg = "#c5cdd9", bg = "#232a32" },
          StatusLineNC = { fg = "#6b737c", bg = "#1b2127" },
        },
      })
      require("onedark").load()
    end,
  },

  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local function cwd_name()
        return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
      end

      require("lualine").setup({
        options = {
          globalstatus = true,
          component_separators = "",
          section_separators = "",
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          theme = {
            normal = {
              a = { fg = "#1b2127", bg = "#98c379", gui = "bold" },
              b = { fg = "#c5cdd9", bg = "#232a32" },
              c = { fg = "#c5cdd9", bg = "#232a32" },
            },
            insert = {
              a = { fg = "#1b2127", bg = "#61afef", gui = "bold" },
              b = { fg = "#c5cdd9", bg = "#232a32" },
              c = { fg = "#c5cdd9", bg = "#232a32" },
            },
            visual = {
              a = { fg = "#1b2127", bg = "#c678dd", gui = "bold" },
              b = { fg = "#c5cdd9", bg = "#232a32" },
              c = { fg = "#c5cdd9", bg = "#232a32" },
            },
            replace = {
              a = { fg = "#1b2127", bg = "#e06c75", gui = "bold" },
              b = { fg = "#c5cdd9", bg = "#232a32" },
              c = { fg = "#c5cdd9", bg = "#232a32" },
            },
            command = {
              a = { fg = "#1b2127", bg = "#e5c07b", gui = "bold" },
              b = { fg = "#c5cdd9", bg = "#232a32" },
              c = { fg = "#c5cdd9", bg = "#232a32" },
            },
            inactive = {
              a = { fg = "#6b737c", bg = "#1b2127" },
              b = { fg = "#6b737c", bg = "#1b2127" },
              c = { fg = "#6b737c", bg = "#1b2127" },
            },
          },
        },

        sections = {
          lualine_a = { "mode" },
          lualine_b = {
            { "branch", icon = "" },
          },
          lualine_c = {
            {
              "filename",
              path = 1, -- 0: filename, 1: relative path, 2: absolute path
              symbols = {
                modified = " [+]",
                readonly = " [RO]",
                unnamed = "[No Name]",
                newfile = "[New]",
              },
            },
          },
          lualine_x = {
            {
              cwd_name,
              icon = "󰉋",
            },
            "filetype",
          },
          lualine_y = {
            "progress",
          },
          lualine_z = {
            "location", -- line:column
          },
        },

        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {
            {
              "filename",
              path = 1,
            },
          },
          lualine_x = {},
          lualine_y = {},
          lualine_z = { "location" },
        },
      })
    end,
  },
})

-- =========================================================
-- Final highlight adjustments
-- =========================================================
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "Comment", { fg = "#6b737c", italic = true })
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#4b5563", bg = "#1b2127" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#9aa5b1", bold = true, bg = "#232a32" })
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#232a32" })
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#2d333b" })
  end,
})
