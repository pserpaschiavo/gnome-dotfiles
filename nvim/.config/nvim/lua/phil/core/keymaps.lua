--[[
╔══════════════════════════════════════════════════════════════════════════════╗
║                           MAPEAMENTOS DE TECLADO                              ║
╚══════════════════════════════════════════════════════════════════════════════╝

📚 LEGENDA:
  • <leader> = Tecla Espaço (por padrão no Neovim)
  • <C-x>    = Ctrl + x
  • <CR>     = Enter
  • <cmd>    = Executa comando ex
  
🎯 MODOS:
  • "n" = Normal mode (navegação e comandos)
  • "i" = Insert mode (digitação)
  • "v" = Visual mode (seleção de texto)

📋 ESTRUTURA:
  keymap.set(modo, tecla, ação, { desc = "descrição" })
  
🔍 DICA: Use :WhichKey para ver todos os atalhos disponíveis em tempo real

════════════════════════════════════════════════════════════════════════════════
--]]

local keymap = vim.keymap

-- Navegação entre Janelas (Splits) sem usar setas ou teclas distantes
-- No 60%, Ctrl + hjkl é o padrão ouro
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Ir para a janela da esquerda" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Ir para a janela de baixo" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Ir para a janela de cima" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Ir para a janela da direita" })


-- Redimensionar janelas (atalhos amigáveis para 60%)
keymap.set("n", "<leader>=", ":resize +2<CR>", { desc = " Aumentar altura" })
keymap.set("n", "<leader>-", ":resize -2<CR>", { desc = " Diminuir altura" })
keymap.set("n", "<leader>]", ":vertical resize +2<CR>", { desc = " Aumentar largura" })
keymap.set("n", "<leader>[", ":vertical resize -2<CR>", { desc = " Diminuir largura" })

-- Troca de buffers
keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = " Próximo buffer" })
keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = " Buffer anterior" })

-- Salvar arquivo rapidamente
keymap.set("n", "<leader>w", ":w<CR>", { desc = "󰈙 Salvar arquivo" })


keymap.set("n", "<leader>q", ":q<CR>", { desc = "󰅖 Fechar janela" })

-- Mover blocos de texto visualmente
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Mover bloco para baixo" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Mover bloco para cima" })


keymap.set("n", "<leader>to", "<cmd>tabnew<cr>", { desc = " Nova aba" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<cr>", { desc = " Fechar aba" })
keymap.set("n", "<leader>tn", "<cmd>tabnext<cr>", { desc = " Próxima aba" })
keymap.set("n", "<leader>tp", "<cmd>tabprevious<cr>", { desc = " Aba anterior" })

-- Copilot: desativa Tab padrão e mapeia <C-a> para aceitar sugestão
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-a>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
