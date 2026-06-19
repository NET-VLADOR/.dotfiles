vim.g.mapleader = " "
-- vim.g.maplocalleader = "\\"

local map = vim.keymap.set

-- Выход из Insert mode через 'jk'
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })

-- "Черные дыры" для регистров
map("n", "x", '"_x', { desc = "Delete char without yank" })
map("v", "p", '"_dP', { desc = "Paste without overwriting register" })

-- Прыжки вниз/вверх с центрированием
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })

-- Переход по результатам поиска с центрированием
map("n", "n", "nzzzv", { desc = "Next search result" })
map("n", "N", "Nzzzv", { desc = "Prev search result" })
