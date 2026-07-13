-- ──  Core ───────────────────────────

local opt = vim.opt

opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.whichwrap = "bs<>[]hl"
opt.numberwidth = 4
opt.breakindent = true
opt.spell = true
opt.spelllang = { "en_us", "ru_ru" }
vim.cmd("language ru_RU.UTF-8")

-- ──  Navigation ─────────────────────

opt.iskeyword:append("-")
opt.hlsearch = false
opt.conceallevel = 2

-- ──  Files ──────────────────────────

opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.undofile = true
opt.fileencoding = "utf-8"

-- ──  Editor ─────────────────────────

opt.completeopt = "menuone,noselect"
opt.shortmess:append("c")
opt.formatoptions:remove({ "c", "r", "o" })
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles")

-- ──  UI ─────────────────────────────

opt.number = true
opt.relativenumber = true
opt.wrap = false
opt.linebreak = true
opt.ignorecase = true
opt.smartcase = true
opt.cursorline = true
opt.splitbelow = true
opt.splitright = true
opt.showmode = false
opt.termguicolors = true
opt.signcolumn = "yes"
opt.timeoutlen = 300
opt.updatetime = 200
