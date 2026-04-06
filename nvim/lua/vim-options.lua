vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "

-- ==========================================
-- ATALHOS ESTILO VSCODE
-- ==========================================
local map = vim.keymap.set
local opt = { noremap = true, silent = true }

-- Salvar com Ctrl+S (funciona no modo Normal, Inserção e Visual)
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Salvar arquivo" })

-- Deletar a linha atual com Ctrl+Shift+K
map("n", "<C-S-k>", "dd", { desc = "Deletar linha" })
map("i", "<C-S-k>", "<C-o>dd", { desc = "Deletar linha" })
map("v", "<C-S-k>", "d", { desc = "Deletar linha" })

-- Copiar (Ctrl+C) e Colar (Ctrl+V) usando a área de transferência do sistema
map("v", "<C-c>", '"+y', { desc = "Copiar para o sistema" })
map("n", "<C-v>", '"+p', { desc = "Colar do sistema" })
map("i", "<C-v>", '<C-r>+', { desc = "Colar do sistema" })

-- Mover linha para cima/baixo com Alt+Setas (clássico do VSCode)
map("n", "<A-Up>", ":m .-2<CR>==^", { desc = "Mover linha para cima" })
map("n", "<A-Down>", ":m .+1<CR>==^", { desc = "Mover linha para baixo" })
map("i", "<A-Up>", "<Esc>:m .-2<CR>==gi", { desc = "Mover linha para cima" })
map("i", "<A-Down>", "<Esc>:m .+1<CR>==gi", { desc = "Mover linha para baixo" })
map("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "Mover bloco para cima" })
map("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Mover bloco para baixo" })

-- Selecionar tudo com Ctrl+A
map("n", "<C-a>", "ggVG", { desc = "Selecionar tudo" })
map("i", "<C-a>", "<Esc>ggVG", { desc = "Selecionar tudo" })
