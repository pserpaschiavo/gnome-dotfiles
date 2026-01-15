local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-k>"] = cmp.mapping.select_prev_item(), -- sobe na lista
    ["<C-j>"] = cmp.mapping.select_next_item(), -- desce na lista
    ["<C-Space>"] = cmp.mapping.complete(),     -- força o menu a abrir
    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- 'Enter' confirma a escolha
  }),
  formatting = {
    format = lspkind.cmp_format({
      maxwidth = 50,
      ellipsis_char = "...",
    }),
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" }, -- Prioridade 1: Sugestões do LSP
    { name = "luasnip" },  -- Prioridade 2: Snippets
    { name = "buffer" },   -- Prioridade 3: Palavras no texto
    { name = "path" },     -- Prioridade 4: Caminhos de arquivos
  }),
})