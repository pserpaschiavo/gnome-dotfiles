local opt = vim.opt

-- Indentação (Essencial para DevOps/YAML)
opt.relativenumber = true -- Números relativos (ajuda a pular linhas rápido)
opt.number = true         -- Mostra o número da linha atual
opt.tabstop = 2           -- 2 espaços para TAB (padrão YAML)
opt.shiftwidth = 2
opt.expandtab = true      -- Transforma TAB em espaços
opt.smartindent = true

-- Usa FileType (case correto) para garantir que o autocmd dispare
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = true
  end,
})

-- UI e Performance
opt.termguicolors = true  -- Suporte a cores reais (Ghostty agradece)
opt.cursorline = true     -- Destaca a linha onde o cursor está
opt.ignorecase = true     -- Busca ignora maiúsculas...
opt.smartcase = true      -- ...a menos que você digite uma maiúscula

-- Desativar providers inúteis (Limpando o checkhealth)
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
