vim.opt.guicursor = ""

-- config.lsp.progress.enabled = false
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
--
vim.opt.hlsearch = false
vim.opt.incsearch = true
--
vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
vim.opt.cursorline = true
-- vim.opt.cursorcolumn = true

-- local opt = vim.opt
--
-- ----- Interesting Options -----
--
-- -- You have to turn this one on :)
-- opt.inccommand = "split"
--
-- -- Best search settings :)
-- opt.smartcase = true
-- opt.ignorecase = true
--
-- ----- Personal Preferences -----
-- opt.number = true
-- opt.relativenumber = true
--
-- opt.splitbelow = true
-- opt.splitright = true
--
-- opt.signcolumn = "yes"
-- opt.shada = { "'10", "<0", "s10", "h" }
--
-- opt.clipboard = "unnamedplus"
--
-- -- Don't have `o` add a comment
-- opt.formatoptions:remove "o"
--
-- opt.wrap = true
-- opt.linebreak = true
-- opt.conceallevel = 1
--
-- vim.g.walh_dimming = 1
-- vim.opt.relativenumber = true
-- vim.opt.number = true
-- vim.opt.showcmd = true
-- vim.opt.emoji = false
-- vim.opt.list = true
-- vim.opt.listchars = { tab = "▷ ", trail = "·" }
-- vim.opt.signcolumn = "auto"
-- vim.opt.ruler = true
-- vim.opt.laststatus = 2
-- vim.opt.cmdheight = 2
-- vim.opt.wrap = true
-- vim.opt.textwidth = 79
-- vim.opt.colorcolumn = "+1"
-- vim.opt.scrolloff = 8
-- vim.opt.tabstop = 2
-- vim.opt.guicursor = require("dev.utils.options").list {
--     "n-v-c-sm:block",
--     "i-ci-ve:ver25",
--     "r-cr-o:hor20",
-- }
--
-- vim.cmd([[
-- autocmd VimResized * :wincmd =
--
-- highlight! Normal ctermbg=NONE guibg=NONE
-- highlight! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
-- ]])
--
-- vim.keymap.set({ "n" },
--     "<silent><Leader>ww",
--     ":syntax sync fromstart<CR>",
--     { noremap = true }
-- )
