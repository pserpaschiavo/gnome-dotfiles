local mason_status, mason = pcall(require, "mason")
local mason_lsp_status, mason_lsp = pcall(require, "mason-lspconfig")

if not (mason_status and mason_lsp_status) then return end

-- ~/dotfiles/nvim/lua/phil/plugins/lsp.lua

mason.setup()


local m_lsp = require("mason-lspconfig")
m_lsp.setup({
  ensure_installed = { "lua_ls", "pyright", "yamlls", "dockerls", "terraformls" },
  auto_install = true,
})

local on_attach = function(_, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
end

-- Configurar servidores LSP usando a nova API do Neovim 0.11+
local servers = { "lua_ls", "pyright", "yamlls", "dockerls", "terraformls" }

for _, server in ipairs(servers) do
  vim.lsp.config[server] = {
    on_attach = on_attach,
  }
end
