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
      require("oil").open()
    end
  end,
})

