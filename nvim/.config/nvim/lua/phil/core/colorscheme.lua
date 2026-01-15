-- Habilita o tema específico para o Telescope (estilo NvChad)
vim.g.gruvbox_baby_telescope_theme = 1

-- Ativa o modo transparente (combinando com seu Ghostty)
vim.g.gruvbox_baby_transparent_mode = 1

-- Estilização de código
vim.g.gruvbox_baby_function_style = "bold"
vim.g.gruvbox_baby_keyword_style = "italic"

-- Comando para carregar o esquema de cores
local status, _ = pcall(vim.cmd, "colorscheme gruvbox-baby")
if not status then
    print("Cores ainda não instaladas! Aguarde o Lazy terminar.")
    return
end
