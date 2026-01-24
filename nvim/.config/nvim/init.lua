-- Define leader ANTES de carregar qualquer plugin
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Carrega as opções básicas
require("phil.core.options")

-- Carrega os atalhos
require("phil.core.keymaps")

-- Carrega os plugins
require("phil.plugins")

-- Carrega Colorscheme
require("phil.core.colorscheme")

-- Abrir Oil automaticamente ao iniciar sem arquivo
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 then
      local ok, oil = pcall(require, "oil")
      if ok then
        oil.open()
      end
    end
  end,
})

-- Garantir que TreeSitter inicia para Markdown
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.treesitter.start()
  end,
})

