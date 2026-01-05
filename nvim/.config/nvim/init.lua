vim.g.mapleader = " "

-- line numbers
vim.o.number = true
vim.o.relativenumber = true

-- tabs
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true

-- search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- colorscheme
vim.o.termguicolors = true
vim.cmd.colorscheme('retrobox')
-- local ok_theme = pcall(vim.cmd.colorscheme, 'retrobox')
-- if not ok_theme then
--     vim.cmd.colorscheme('habamax')
-- end

vim.o.signcolumn = 'yes'
vim.o.cursorline = true
vim.o.colorcolumn = "80"

vim.opt.clipboard = "unnamedplus"

-- <leader>d deletes text without overwriting clipboard
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])


-- <leader>pv opens netrw file browser
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- netrw settings

-- plugins
require("config.lazy")
