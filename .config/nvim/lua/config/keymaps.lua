-- ──  Keys ───────────────────────────

vim.g.mapleader = " "

local map = vim.keymap.set

-- ──  Insert ─────────────────────────

map("i", "jk", "<ESC>", { desc = "Exit insert mode" })

-- ──  Registers ─────────────────────

map("n", "x", '"_x', { desc = "Delete char without yank" })
map("v", "p", '"_dP', { desc = "Paste without overwriting register" })

-- ──  Scroll ─────────────────────────

map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })

-- ──  Search ─────────────────────────

map("n", "n", "nzzzv", { desc = "Next search result" })
map("n", "N", "Nzzzv", { desc = "Prev search result" })
