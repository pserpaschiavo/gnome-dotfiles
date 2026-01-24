local mason_status, mason = pcall(require, "mason")
local mason_lsp_status, mason_lsp = pcall(require, "mason-lspconfig")
local lspconfig_status, lspconfig = pcall(require, "lspconfig")

if not (mason_status and mason_lsp_status and lspconfig_status) then return end

-- Provisiona servidores via Mason
mason.setup()
mason_lsp.setup({
  ensure_installed = { "lua_ls", "pyright", "yamlls", "dockerls", "terraformls", "texlab" },
  automatic_installation = true,
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

-- Configurar capabilities para nvim-cmp, compatível com Neovim estável
local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if cmp_status then
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

local servers = { "lua_ls", "pyright", "yamlls", "dockerls", "terraformls", "texlab" }

-- Ajustes específicos por servidor (evita avisos do lua_ls sobre "vim")
local server_settings = {
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = { globals = { "vim" } },
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
      },
    },
  },
}

for _, server in ipairs(servers) do
  local opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  if server_settings[server] then
    opts = vim.tbl_deep_extend("force", opts, server_settings[server])
  end

  lspconfig[server].setup(opts)
end
