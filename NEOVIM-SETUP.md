# 🚀 Neovim Setup - Configuração Completa

**Localização:** `~/dotfiles/nvim/.config/nvim/`

## 📦 Gerenciador de Plugins

**lazy.nvim** - Plugin manager moderno e assíncrono

## 🎯 Plugins Instalados

### 🔧 Core & LSP
- **mason.nvim** - Gerenciador de LSP servers
- **mason-lspconfig.nvim** - Integração Mason + lspconfig
- **nvim-lspconfig** - Configuração LSP
  - `lua_ls` - Lua/Neovim
  - `pyright` - Python
  - `yamlls` - YAML
  - `dockerls` - Docker
  - `terraformls` - Terraform
  - `texlab` - LaTeX
- **lspsaga.nvim** - UI melhorada para LSP

### 💬 Completion
- **nvim-cmp** - Engine de completion
- **cmp-nvim-lsp** - LSP source
- **cmp-buffer** - Buffer source
- **cmp-path** - Path source
- **LuaSnip** - Snippet engine
- **cmp_luasnip** - LuaSnip source
- **friendly-snippets** - Coleção de snippets

### 🎨 Syntax & UI
- **nvim-treesitter** - Syntax highlighting avançado
- **lualine.nvim** - Statusline bonita
- **bufferline.nvim** - Buffer tabs
- **which-key.nvim** - Mostrar keybindings
- **noice.nvim** - UI melhorada para cmd/messages
- **nvim-notify** - Notificações bonitas
- **dashboard-nvim** - Tela inicial
- **nvim-web-devicons** - Ícones

### 📁 File Management
- **telescope.nvim** - Fuzzy finder
  - `<leader>ff` - Find files
  - `<leader>fg` - Live grep
  - `<leader>fb` - Buffers
  - `<leader>fh` - Help tags
- **oil.nvim** - File explorer tipo buffer (abre no startup)
- **neo-tree.nvim** - File explorer sidebar

### 🔀 Git Integration
- **gitsigns.nvim** - Git decorations in signcolumn
- **lazygit.nvim** - LazyGit TUI integrado
  - `<leader>gg` - Abrir LazyGit
  - `<leader>gc` - LazyGit (arquivo atual)
- **diffview.nvim** - Resolver merge conflicts visualmente
  - `<leader>gd` - Git Diff
  - `<leader>gh` - Git History
  - `<leader>gf` - File History

### 🤖 AI & Copilot
- **copilot.vim** - GitHub Copilot
  - `<C-a>` - Accept suggestion

### 🧪 Code Quality
- **conform.nvim** - Formatter
  - Prettier para JS/TS/JSON/Markdown
- **nvim-lint** - Linter integration

### ⚡ Productivity Essentials
- **Comment.nvim** - Comentar código facilmente
  - `gcc` - Toggle comment linha
  - `gc` - Toggle comment (visual mode)
- **nvim-autopairs** - Auto-fechar parênteses/aspas/etc
- **nvim-surround** - Surround text objects
  - `ys{motion}{char}` - Add surrounding
  - `ds{char}` - Delete surrounding
  - `cs{old}{new}` - Change surrounding
- **flash.nvim** - Navegação ultrarrápida com labels
  - `s` - Flash jump
  - `S` - Flash treesitter
- **indent-blankline.nvim** - Guias visuais de indentação (crucial para YAML!)
- **mini.nvim** - Collection útil
  - `mini.ai` - Enhanced text objects
  - `mini.bufremove` - Smart buffer delete
  - `<leader>bd` - Delete buffer (sem fechar janela)

### 🐛 Debugging & Diagnostics
- **trouble.nvim** - Lista bonita de diagnósticos/erros/TODOs
  - `<leader>xx` - Diagnostics (Trouble)
  - `<leader>xX` - Buffer Diagnostics
  - `<leader>cs` - Symbols (Trouble)
  - `<leader>cl` - LSP Definitions
  - `<leader>xq` - Quickfix List

### 🖥️ Terminal
- **toggleterm.nvim** - Terminal flutuante
  - `<C-\>` - Toggle terminal

### 📝 Markdown Support
- **markdown-preview.nvim** - Preview Markdown no browser
  - `<leader>mp` - Toggle Markdown Preview
  - Funciona com sync scroll
- **render-markdown.nvim** - Visualizar Markdown no buffer
  - Headings com ícones
  - Code blocks estilizados
  - Bullets customizados
- **markdown-toc** - Gerar Table of Contents
  - `<leader>mt` - Generate TOC

### 📐 LaTeX Support
- **vimtex** - Suporte completo para LaTeX
  - Viewer: Zathura
  - Compiler: latexmk
  - TOC integrado
  - Syntax highlighting
- **luasnip-latex-snippets** - Snippets prontos para LaTeX
- **texlab LSP** - Language server para LaTeX

### ☁️ DevOps Extras
- **yaml-companion.nvim** - Schema detection para K8s/GitHub Actions
  - `<leader>ys` - YAML Schema picker
- **kulala.nvim** - HTTP Client (tipo Postman!)
  - `<leader>kr` - Run Request
  - `<leader>ki` - Inspect
  - `<leader>kt` - Toggle View
- **octo.nvim** - GitHub PRs/Issues no Neovim
  - `<leader>gp` - List PRs
  - `<leader>gi` - List Issues

### 🎯 Challenges & Learning
- **leetcode.nvim** - Resolver LeetCode no Neovim
- **exercism.nvim** - Praticar programação
- **hardtime.nvim** - Treinar Vim motions

### 🎨 Colorscheme
- **gruvbox-baby** - Tema principal

## ⌨️ Keybindings Principais

### Window Navigation
- `<C-h/j/k/l>` - Navegar entre janelas

### General
- `<leader>w` - Save file
- `<leader>q` - Quit
- `<leader>bd` - Delete buffer (sem fechar janela)

### Visual Mode
- `J` - Mover texto para baixo
- `K` - Mover texto para cima

### LSP (quando disponível)
- `gd` - Go to definition
- `K` - Hover documentation
- `gr` - Go to references
- `<leader>rn` - Rename
- `<leader>ca` - Code action
- `<leader>d` - Diagnostic float
- `[d` / `]d` - Previous/Next diagnostic

### Git (lazygit.nvim)
- `<leader>gg` - LazyGit
- `<leader>gc` - LazyGit (arquivo atual)
- `<leader>gd` - Git Diff
- `<leader>gh` - Git History
- `<leader>gf` - File History

### Markdown
- `<leader>mp` - Markdown Preview
- `<leader>mt` - Generate TOC

### HTTP/GitHub
- `<leader>kr` - Run HTTP Request
- `<leader>gp` - List GitHub PRs
- `<leader>gi` - List GitHub Issues

### YAML
- `<leader>ys` - Select YAML Schema

### Copilot
- `<C-a>` - Accept suggestion

## 📁 Estrutura de Arquivos

```
nvim/.config/nvim/
├── init.lua                    # Entry point
├── lua/phil/
│   ├── core/
│   │   ├── options.lua        # Configurações gerais
│   │   ├── keymaps.lua        # Keybindings
│   │   └── colorscheme.lua    # Tema
│   └── plugins/
│       ├── init.lua           # Plugins com lazy.nvim
│       ├── lsp.lua            # LSP configuration
│       ├── completion.lua     # nvim-cmp setup
│       ├── treesitter.lua     # Treesitter config
│       ├── telescope.lua      # Telescope config
│       └── lualine.lua        # Statusline
```

## 🔧 Manutenção

### Atualizar Plugins
```bash
nvim --headless "+Lazy! sync" +qa
```

### Verificar Erros
```vim
:checkhealth
```

### Instalar LSP Server
```vim
:Mason
```

### Ver Plugins Instalados
```vim
:Lazy
```

## 📚 Dependências Externas

### LaTeX (vimtex)
```bash
sudo dnf install -y zathura zathura-pdf-mupdf latexmk texlive-scheme-medium
```

### Markdown Preview
```bash
# Auto-instalado pelo plugin na primeira execução
# Requer Node.js
```

### HTTP Client (kulala)
```bash
# Requer curl (já instalado)
```

### GitHub Integration (octo)
```bash
# Requer gh CLI
sudo dnf install -y gh
gh auth login
```

## 🎯 Próximos Passos Recomendados

1. **Configurar GitHub CLI** para octo.nvim:
   ```bash
   gh auth login
   ```

2. **Testar LaTeX**:
   ```bash
   nvim teste.tex
   ```

3. **Explorar Keybindings**:
   - Abra Neovim e pressione `<leader>` (espaço) - which-key mostrará todas opções

4. **Personalizar** conforme seu workflow em `lua/phil/core/options.lua`

## 🐛 Troubleshooting

### LSP não está funcionando
```vim
:LspInfo
:Mason
```

### Markdown Preview não abre
```bash
cd ~/.local/share/nvim/lazy/markdown-preview.nvim/app
npm install
```

### Copilot não autentica
```vim
:Copilot setup
```

### Zathura não abre PDF (LaTeX)
```bash
sudo dnf install -y zathura zathura-pdf-mupdf
```

## 📖 Recursos de Aprendizado

- `:Tutor` - Tutorial interativo do Vim
- `:help` - Documentação completa
- `<leader>` + aguardar - which-key mostra opções
- [Neovim Documentation](https://neovim.io/doc/)
- [Lazy.nvim](https://github.com/folke/lazy.nvim)
- [VimTeX Documentation](https://github.com/lervag/vimtex)

---

**Última atualização:** 19/01/2026
**Neovim versão:** 0.10+
**Total de plugins:** 50+
