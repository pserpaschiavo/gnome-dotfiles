# ⚡ Guia Rápido - Dotfiles

## 🚀 Uso Diário

### Neovim - Comandos Mais Usados

#### Navegação & Edição
```vim
gcc             # Comentar/descomentar linha
gc              # Comentar seleção (visual mode)
s               # Flash jump (navegação rápida)
<leader>bd      # Fechar buffer sem fechar janela
```

#### Files & Search
```vim
<leader>ff      # Find files (Telescope)
<leader>fg      # Live grep (busca em arquivos)
<leader>fb      # Buffers
<C-h/j/k/l>     # Navegar janelas
```

#### Git
```vim
<leader>gg      # LazyGit TUI
<leader>gd      # Git Diff
<leader>gh      # Git History
```

#### LSP
```vim
gd              # Go to definition
K               # Hover docs
<leader>ca      # Code action
<leader>rn      # Rename symbol
[d / ]d         # Next/Previous diagnostic
```

#### Markdown
```vim
<leader>mp      # Preview no browser
<leader>mt      # Gerar TOC
```

#### Diagnostics
```vim
<leader>xx      # Trouble (lista erros)
<leader>d       # Diagnostic float
```

### TUI Apps - Comandos

```bash
# File Manager
yazi                    # Navegador de arquivos moderno

# Git
lazygit                 # Git TUI completo

# Docker
lazydocker              # Gerenciar containers/images

# System Monitor
btop                    # Monitor completo
btm                     # bottom (alternativa)

# Network
sudo bandwhich          # Monitor de rede (requer sudo)
trip google.com         # Traceroute visual

# Database
gobang                  # SQL client TUI

# Markdown
glow README.md          # Renderizar Markdown
glow -p README.md       # Pager mode

# Spotify
spotatui                # Spotify TUI
```

## 📝 Workflows Comuns

### Workflow: Escrever Documento Markdown

```bash
# 1. Abrir arquivo
nvim documento.md

# 2. Dentro do Neovim:
<leader>mp              # Preview no browser

# 3. Gerar índice
<leader>mt              # Table of Contents

# 4. Formatar (já configurado)
:w                      # Auto-format com Prettier
```

### Workflow: Trabalhar com LaTeX

```bash
# 1. Criar documento
nvim artigo.tex

# 2. Dentro do Neovim:
:VimtexCompile          # Compilar (abre Zathura)

# 3. Editar e ver mudanças em tempo real
# (VimTeX recompila automaticamente)

# 4. Ver TOC
:VimtexToc              # Table of Contents

# 5. Limpar arquivos auxiliares
:VimtexClean
```

### Workflow: Git com LazyGit

```bash
# Opção 1: Fora do Neovim
lazygit

# Opção 2: Dentro do Neovim
<leader>gg              # Abre LazyGit

# Dentro do LazyGit:
# Space   - Stage/unstage
# c       - Commit
# P       - Push
# p       - Pull
# Tab     - Trocar painel
```

### Workflow: Docker com LazyDocker

```bash
lazydocker

# Dentro:
# ↑/↓     - Navegar
# Enter   - Ver logs/stats
# d       - Delete container
# s       - Start/stop
# r       - Restart
```

### Workflow: Resolver Merge Conflict

```vim
# 1. Abrir Neovim
nvim arquivo-com-conflito.txt

# 2. Ver diff
<leader>gd              # DiffView

# 3. Navegação
]c                      # Next conflict
[c                      # Previous conflict

# 4. Resolver
:diffget LOCAL          # Aceitar versão local
:diffget REMOTE         # Aceitar versão remota

# 5. Fechar DiffView
:DiffviewClose
```

### Workflow: HTTP Requests (API Testing)

```bash
# 1. Criar arquivo .http
cat > api.http << 'EOF'
### Get Users
GET https://jsonplaceholder.typicode.com/users

### Get User by ID
GET https://jsonplaceholder.typicode.com/users/1

### Create Post
POST https://jsonplaceholder.typicode.com/posts
Content-Type: application/json

{
  "title": "Test",
  "body": "Content",
  "userId": 1
}
EOF

# 2. Abrir no Neovim
nvim api.http

# 3. Executar requests
<leader>kr              # Run request sob cursor
<leader>ki              # Inspect response
```

### Workflow: YAML Kubernetes

```vim
# 1. Abrir arquivo K8s
nvim deployment.yaml

# 2. Selecionar schema
<leader>ys              # YAML Schema picker

# 3. Escolher:
# - Kubernetes
# - GitHub Actions
# - Docker Compose
# etc

# 4. LSP ativo com autocomplete!
# 5. Indent guides automáticos
```

## 🔧 Manutenção

### Atualizar Plugins Neovim
```bash
nvim --headless "+Lazy! sync" +qa
```

### Atualizar TUI Apps
```bash
cd ~/dotfiles
./install-packages.sh --yes
```

### Verificar Saúde do Neovim
```vim
:checkhealth
```

### Instalar LSP Server Adicional
```vim
:Mason                  # Abre interface
# i - Install
# u - Update
# x - Uninstall
```

## 🆘 Ajuda Rápida

### Esqueci um Keybinding
```vim
# Pressione <leader> (espaço) e aguarde
# which-key mostrará todas as opções!
```

### LSP não está funcionando
```vim
:LspInfo                # Ver status
:Mason                  # Verificar servers
```

### Copilot não sugere
```vim
:Copilot status
:Copilot setup          # Se não autenticado
```

### Git não integra
```bash
# Verificar git instalado
git --version

# LazyGit disponível?
lazygit --version
```

## 📱 Atalhos de Produtividade

### Surround (nvim-surround)
```vim
# Adicionar aspas ao redor de palavra
ysiw"               # you surround inner word "

# Mudar ( ) para [ ]
cs(]                # change surround ( ]

# Deletar ""
ds"                 # delete surround "

# Em visual mode
S"                  # Surround seleção com "
```

### Text Objects (mini.ai)
```vim
# Enhanced text objects
daa                 # Delete around argument
cia                 # Change inner argument
vii                 # Visual select inner indent
```

### Flash Navigation
```vim
# Pular para qualquer palavra visível
s                   # Flash jump
{digite 2 chars}    # Labels aparecem
{digite label}      # Pula para lá

# Treesitter aware
S                   # Flash treesitter
```

## 🎨 Customização

### Mudar Tema
```vim
# Editar colorscheme.lua
nvim ~/dotfiles/nvim/.config/nvim/lua/phil/core/colorscheme.lua

# Trocar de gruvbox-baby para outro
# Exemplo: "catppuccin/nvim" ou "folke/tokyonight.nvim"
```

### Adicionar Plugin
```vim
# Editar init.lua
nvim ~/dotfiles/nvim/.config/nvim/lua/phil/plugins/init.lua

# Adicionar antes do closing brace:
{
  "user/plugin-name",
  config = function()
    require("plugin").setup()
  end
}

# Sincronizar
:Lazy sync
```

## 📚 Documentação Completa

- [NEOVIM-SETUP.md](NEOVIM-SETUP.md) - Setup completo do Neovim
- [SETUP-VALIDATION.md](SETUP-VALIDATION.md) - Validação e resumo
- [AWESOME-TUI.md](AWESOME-TUI.md) - Lista de TUI apps
- [AWESOME-NVIM.md](AWESOME-NVIM.md) - Lista de plugins Neovim

## 💡 Dicas Pro

1. **Use o Terminal do Neovim**: `<C-\>` toggle terminal flutuante
2. **Abuse do Flash**: `s` para pular rapidamente
3. **LazyGit dentro do Neovim**: `<leader>gg` sem sair do editor
4. **Which-key é seu amigo**: Pressione `<leader>` e veja opções
5. **Trouble para erros**: `<leader>xx` para ver todos diagnostics
6. **Oil para arquivos**: Navegue arquivos como buffer
7. **Markdown Preview**: `<leader>mp` para docs bonitos
8. **HTTP Testing**: Use `.http` files + kulala
9. **YAML Schemas**: `<leader>ys` para K8s autocomplete
10. **Mini.bufremove**: `<leader>bd` fecha buffer, não janela

---

**Tip**: Pressione `<leader>` e aguarde 1 segundo - which-key mostrará TODOS os comandos disponíveis! 🚀
