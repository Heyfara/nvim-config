vim.opt.number = true
vim.opt.mouse = ''

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
-- sync buffers automatically
vim.opt.autoread = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.wo.cursorline = true
vim.opt.scrolloff = 8
vim.opt.colorcolumn = "80"

vim.opt.termguicolors = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.splitright = true
vim.opt.splitbelow = true
