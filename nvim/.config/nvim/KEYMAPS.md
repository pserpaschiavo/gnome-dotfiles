# Atalhos do Teclado - Neovim Config

## 🎯 Navegação

| Atalho | Modo | Ação |
|--------|------|------|
| `<C-h>` | Normal | Ir para janela esquerda |
| `<C-j>` | Normal | Ir para janela abaixo |
| `<C-k>` | Normal | Ir para janela acima |
| `<C-l>` | Normal | Ir para janela direita |

## 📏 Redimensionar Janelas

| Atalho | Modo | Ação |
|--------|------|------|
| `<leader>=` | Normal | ⬆️ Aumentar altura |
| `<leader>-` | Normal | ⬇️ Diminuir altura |
| `<leader>]` | Normal | ➡️ Aumentar largura |
| `<leader>[` | Normal | ⬅️ Diminuir largura |

## 📂 File Explorer (Neo-tree)

| Atalho | Modo | Ação |
|--------|------|------|
| `<leader>e` | Normal | Toggle Neo-tree (abrir/fechar) |
| `<leader>o` | Normal | Focar no Neo-tree |
| `-` | Normal | Abrir Oil (gerenciador avançado) |

## 🔍 Telescope (Busca)

| Atalho | Modo | Ação |
|--------|------|------|
| `<leader>ff` | Normal | Buscar arquivos |
| `<leader>fs` | Normal | Buscar texto no projeto (grep) |
| `<leader>fb` | Normal | Listar buffers abertos |

## 📑 Buffers e Abas

| Atalho | Modo | Ação |
|--------|------|------|
| `<leader>bn` | Normal | Próximo buffer |
| `<leader>bp` | Normal | Buffer anterior |
| `<leader>bb` | Normal | Escolher buffer (picker) |
| `<leader>to` | Normal | Nova aba |
| `<leader>tx` | Normal | Fechar aba |
| `<leader>tn` | Normal | Próxima aba |
| `<leader>tp` | Normal | Aba anterior |

## 💾 Salvar/Fechar

| Atalho | Modo | Ação |
|--------|------|------|
| `<leader>w` | Normal | 💾 Salvar arquivo |
| `<leader>q` | Normal | ❌ Fechar janela |

## ✂️ Edição

| Atalho | Modo | Ação |
|--------|------|------|
| `J` | Visual | Mover bloco para baixo |
| `K` | Visual | Mover bloco para cima |

## 💻 Terminal

| Atalho | Modo | Ação |
|--------|------|------|
| `<C-\>` | Normal | Toggle terminal flutuante |
| `<leader>tt` | Normal | Abrir terminal flutuante |

## 🔧 LSP (Language Server)

| Atalho | Modo | Ação |
|--------|------|------|
| `gd` | Normal | Ir para definição |
| `gr` | Normal | Mostrar referências |
| `K` | Normal | Mostrar documentação (hover) |
| `<leader>rn` | Normal | Renomear símbolo |
| `<leader>ca` | Normal | Code actions |
| `<leader>d` | Normal | Mostrar diagnóstico |
| `[d` | Normal | Diagnóstico anterior |
| `]d` | Normal | Próximo diagnóstico |

## 🔧 Formatação

| Atalho | Modo | Ação |
|--------|------|------|
| `<leader>mp` | Normal/Visual | Formatar arquivo ou seleção |
| Automático ao salvar | - | Formatação automática (Python/YAML/Terraform) |

## 🔀 Git (Gitsigns)

| Atalho | Modo | Ação |
|--------|------|------|
| `]c` | Normal | Próximo hunk git |
| `[c` | Normal | Hunk git anterior |
| `<leader>hs` | Normal/Visual | Stage hunk |
| `<leader>hr` | Normal/Visual | Reset hunk |
| `<leader>hS` | Normal | Stage buffer inteiro |
| `<leader>hR` | Normal | Reset buffer inteiro |
| `<leader>hu` | Normal | Undo stage hunk |
| `<leader>hp` | Normal | Preview hunk |
| `<leader>hb` | Normal | Blame line (completo) |
| `<leader>tb` | Normal | Toggle blame line |
| `<leader>hd` | Normal | Diff this |
| `<leader>td` | Normal | Toggle deleted |

## 🤖 GitHub Copilot

| Atalho | Modo | Ação |
|--------|------|------|
| `<C-a>` | Insert | Aceitar sugestão do Copilot |

## 🧠 Autocompletar (nvim-cmp)

| Atalho | Modo | Ação |
|--------|------|------|
| `<C-k>` | Insert | Item anterior na lista |
| `<C-j>` | Insert | Próximo item na lista |
| `<C-Space>` | Insert | Forçar menu de completar |
| `<CR>` | Insert | Confirmar seleção |

## 📚 Plugins de Aprendizado

| Comando | Ação |
|---------|------|
| `:Leet` | Abrir LeetCode |
| `:Exercism` | Abrir Exercism |

---

**Nota**: `<leader>` está mapeado para a tecla Espaço por padrão no Neovim.
