-- use space as leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

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
--vim.opt.hlsearch = false
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
vim.o.scrolloff = 8

-- new splits go to the right or bottom
vim.o.splitright = true
vim.o.splitbelow = true

vim.o.clipboard = "unnamedplus"
-- highlight text on yank
vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('highlight_yank', {}),
    desc = 'Hightlight selection on yank',
    pattern = '*',
    callback = function()
        vim.highlight.on_yank { higroup = 'IncSearch', timeout = 250 }
    end,
})

vim.o.timeoutlen = 500

-- <leader>d deletes text without overwriting clipboard
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- clear highlights on search using <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- <leader>pv opens netrw file browser
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- exit terminal mode with <Esc><Esc>
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- automatically switch between j/k and gj/gk
-- k moves by display line (gk) when no count is given
-- 5k moves by actual lines
vim.keymap.set("n", "j", function()
    return vim.v.count == 0 and "gj" or "j"
end, { expr = true, noremap = true })
vim.keymap.set("n", "k", function()
    return vim.v.count == 0 and "gk" or "k"
end, { expr = true, noremap = true })

-- netrw settings

-- plugins
require("config.lazy")
