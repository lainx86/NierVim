local opt = vim.opt

opt.autowrite = true
opt.breakindent = true
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
opt.completeopt = { "menu", "menuone", "noselect" }
opt.confirm = true
opt.cursorline = true
opt.expandtab = true
opt.fillchars = { eob = " ", fold = " ", foldopen = "", foldclose = "" }
opt.foldenable = true
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.ignorecase = true
opt.inccommand = "split"
opt.laststatus = 3
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
opt.mouse = "a"
opt.number = true
opt.pumheight = 10
opt.relativenumber = true
opt.scrolloff = 4
opt.shiftround = true
opt.shiftwidth = 2
opt.showmode = false
opt.showtabline = 2
opt.signcolumn = "yes"
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitkeep = "screen"
opt.splitright = true
opt.tabstop = 2
opt.termguicolors = true
opt.timeoutlen = 400
opt.title = true
opt.titlestring = "NierVim - %{fnamemodify(getcwd(), ':t')}"
opt.undofile = true
opt.updatetime = 250
opt.virtualedit = "block"
opt.wrap = false

opt.statusline = "%!v:lua.require'config.ui'.statusline()"
opt.tabline = "%!v:lua.require'config.ui'.tabline()"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
