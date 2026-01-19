# Plugins Recomendados para Neovim

## 📝 Markdown

### Markview.nvim
**Repositório:** https://github.com/OXY2DEV/markview.nvim  
**Por que:** Renderização linda de Markdown no próprio Neovim

**Instalação (lazy.nvim):**
```lua
{
  "OXY2DEV/markview.nvim",
  lazy = false, -- Recommended
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    require("markview").setup({
      modes = { "n", "no", "c" }, -- Mudar para: "n", "i", "no", "c" para hybrid mode
      hybrid_modes = { "n" }, -- Usar hybrid mode em normal mode
      
      -- Configuração do tema Gruvbox Material Dark
      headings = {
        enable = true,
        heading_1 = { style = "icon", icon = "󰼏 " },
        heading_2 = { style = "icon", icon = "󰎨 " },
        heading_3 = { style = "icon", icon = "󰼑 " },
        heading_4 = { style = "icon", icon = "󰎲 " },
        heading_5 = { style = "icon", icon = "󰼓 " },
        heading_6 = { style = "icon", icon = "󰎴 " },
      },
      
      code_blocks = {
        style = "language",
        position = "overlay",
        min_width = 60,
        pad_amount = 3,
      },
      
      inline_codes = {
        enable = true,
      },
      
      checkboxes = {
        enable = true,
        checked = { text = "󰄲", hl = "MarkviewCheckboxChecked" },
        unchecked = { text = "󰄱", hl = "MarkviewCheckboxUnchecked" },
      },
    })
  end
}
```

**Keymaps sugeridos:**
```lua
-- No seu which-key ou keymaps
vim.keymap.set("n", "<leader>mt", ":Markview toggle<CR>", { desc = "Toggle Markview" })
vim.keymap.set("n", "<leader>ms", ":Markview splitToggle<CR>", { desc = "Split Toggle Markview" })
```

## 🎨 Tema Gruvbox Material

### gruvbox-material
**Repositório:** https://github.com/sainnhe/gruvbox-material  
**Por que:** Tema Gruvbox Material Dark consistente com todo o setup

**Instalação (lazy.nvim):**
```lua
{
  "sainnhe/gruvbox-material",
  lazy = false,
  priority = 1000,
  config = function()
    -- Configuração do tema
    vim.g.gruvbox_material_background = 'hard' -- 'soft', 'medium', 'hard'
    vim.g.gruvbox_material_foreground = 'material' -- 'material', 'mix', 'original'
    vim.g.gruvbox_material_enable_italic = true
    vim.g.gruvbox_material_enable_bold = true
    vim.g.gruvbox_material_transparent_background = 0 -- 0, 1, 2
    vim.g.gruvbox_material_visual = 'reverse' -- 'grey background', 'green background', 'blue background', 'red background', 'reverse'
    vim.g.gruvbox_material_statusline_style = 'material'
    vim.g.gruvbox_material_better_performance = 1
    
    -- Aplicar tema
    vim.cmd.colorscheme('gruvbox-material')
  end,
}
```

## 📚 Outros Plugins Úteis para Markdown

### markdown-preview.nvim
**Repositório:** https://github.com/iamcco/markdown-preview.nvim

```lua
{
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = function() vim.fn["mkdp#util#install"]() end,
  config = function()
    vim.g.mkdp_theme = 'dark'
    vim.g.mkdp_filetypes = { 'markdown' }
  end
}
```

### render-markdown.nvim (Alternativa ao Markview)
**Repositório:** https://github.com/MeanderingProgrammer/render-markdown.nvim

```lua
{
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  opts = {},
  ft = { "markdown" },
}
```

## 🔧 Configuração Completa Sugerida

Adicione ao seu `~/.config/nvim/lua/plugins/markdown.lua`:

```lua
return {
  -- Tema Gruvbox Material
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_background = 'hard'
      vim.g.gruvbox_material_foreground = 'material'
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_enable_bold = true
      vim.g.gruvbox_material_transparent_background = 0
      vim.g.gruvbox_material_better_performance = 1
      vim.cmd.colorscheme('gruvbox-material')
    end,
  },

  -- Markview para renderização de Markdown
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require("markview").setup({
        modes = { "n", "no", "c" },
        hybrid_modes = { "n" },
      })
    end
  },

  -- Preview de Markdown no browser
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
    config = function()
      vim.g.mkdp_theme = 'dark'
    end
  },
}
```

## 🎯 Keymaps Recomendados

```lua
-- Markdown keymaps
vim.keymap.set("n", "<leader>mt", ":Markview toggle<CR>", { desc = "Toggle Markview" })
vim.keymap.set("n", "<leader>mp", ":MarkdownPreview<CR>", { desc = "Markdown Preview" })
vim.keymap.set("n", "<leader>ms", ":MarkdownPreviewStop<CR>", { desc = "Stop Markdown Preview" })
```

---

**Nota:** Certifique-se de ter Treesitter configurado com parser de Markdown:
```lua
require('nvim-treesitter.configs').setup {
  ensure_installed = { "markdown", "markdown_inline" },
}
```
