# Hardtime.nvim — Treinador de Produtividade para Vim/Neovim

O propósito do Hardtime.nvim é ajudar você a evoluir sua navegação e edição no Vim/Neovim, incentivando o uso de comandos eficientes e penalizando repetições excessivas de hjkl, setas e mouse.

## Como Funciona
- Monitora comandos repetidos e sugere alternativas mais "vim-like".
- Mostra dicas e notificações para melhorar seu fluxo.
- Permite configurar quais teclas e filetypes serão penalizados ou liberados.
- Gera relatórios dos comandos mais penalizados para você acompanhar sua evolução.

## Principais Recursos
- Penaliza repetições excessivas de hjkl, setas, mouse.
- Sugere comandos mais eficientes (saltos, operadores, objetos de texto).
- Notificações pop-up (com nvim-notify).
- Relatório de comandos mais penalizados (`:Hardtime report`).
- Configuração flexível para liberar/penalizar teclas e filetypes.

## Comandos
- `:Hardtime enable`   — Ativa o Hardtime
- `:Hardtime disable`  — Desativa o Hardtime
- `:Hardtime toggle`   — Alterna o estado
- `:Hardtime report`   — Mostra relatório de comandos mais "penalizados"

## Exemplo de Configuração
```lua
{
  "m4xshen/hardtime.nvim",
  dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  opts = {
    disabled_keys = {
      ["<Up>"] = false, -- Permite seta para cima
      ["<Space>"] = { "n", "x" }, -- Desativa espaço em normal/visual
    },
    disabled_filetypes = {
      lazy = false, -- Ativa Hardtime no Lazy
      ["dapui*"] = false, -- Ativa em filetypes que começam com dapui
    },
  },
}
```

## Dicas de Uso
- Use saltos relativos (`5j`, `12-`), operadores + objetos de texto (`ci{`, `y5j`, `dap`), movimentos por palavra (`w`, `b`, `e`), saltos (`f`, `F`, `t`, `T`, `0`, `$`, `%`).
- Consulte o [blog do autor](https://m4xshen.dev/posts/vim-command-workflow/) para aprender mais sobre navegação eficiente.

---

Com Hardtime, você treina e evolui para um uso mais rápido e inteligente do Vim/Neovim!
