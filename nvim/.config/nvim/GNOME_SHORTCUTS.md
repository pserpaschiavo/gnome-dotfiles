# Atalhos GNOME para Teclado 60% + Neovim Workflow

> 🎯 **Filosofia**: Usar `Super` para GNOME, `Super + Ctrl` para TUI apps, mantendo `Ctrl` livre para Neovim

## 🖥️ Navegação entre Workspaces (estilo Neovim hjkl)

| Atalho | Ação | Comando GNOME |
|--------|------|---------------|
| `Super + h` | Navegar para workspace esquerda | `switch-to-workspace-left` |
| `Super + l` | Navegar para workspace direita | `switch-to-workspace-right` |
| `Super + Shift + h` | Mover janela para workspace esquerda | `move-to-workspace-left` |
| `Super + Shift + l` | Mover janela para workspace direita | `move-to-workspace-right` |

> 💡 **Navegação horizontal otimizada** - Sem necessidade de j/k ou setas!

## 📐 Tiling de Janelas (Teclado 60% - SEM SETAS!)

| Atalho | Ação |
|--------|------|
| `Super + [` | Janela à esquerda (metade) |
| `Super + ]` | Janela à direita (metade) |
| `Super + =` | Maximizar janela |
| `Super + -` | Restaurar janela |

> ✅ **100% compatível com teclado 60%** - Nenhuma tecla Fn necessária!

## 🚀 Lançadores Rápidos

| Atalho | Ação |
|--------|------|
| `Super + Return` | Abrir terminal (Ghostty) |
| `Super + e` | Nautilus (explorador de arquivos GUI) |
| `Super + Space` | Launcher/Overview |
| `Super + /` | Mostrar atalhos |

## 🎯 Aplicações TUI (Terminal User Interface)

> 💡 **Estratégia**: `Super + Ctrl + <letra>` para TUI apps evita conflitos com GNOME e Neovim

### File Managers
| Atalho | App | Ação |
|--------|-----|------|
| `Super + Ctrl + e` | `yazi` | File manager rápido em Rust |
| `Super + Ctrl + r` | `ranger` | File manager estilo vim |

### Development
| Atalho | App | Ação |
|--------|-----|------|
| `Super + Ctrl + g` | `lazygit` | Git TUI (coeso com Neovim) |
| `Super + Ctrl + d` | `lazydocker` | Docker TUI |
| `Super + Ctrl + k` | `k9s` | Kubernetes TUI |

### Monitoring
| Atalho | App | Ação |
|--------|-----|------|
| `Super + Ctrl + b` | `btop` | Monitor de sistema avançado |
| `Super + Ctrl + h` | `htop` | Monitor de processos |
| `Super + Ctrl + n` | `nethogs` | Monitor de tráfego de rede |

### Multimedia
| Atalho | App | Ação |
|--------|-----|------|
| `Super + Ctrl + s` | `spotatui` | Spotify TUI com streaming nativo |
| `Super + Ctrl + m` | `ytui-music` | YouTube Music TUI |
| `Super + y` | `ytfzf` | YouTube TUI |

### Games
| Atalho | App | Ação |
|--------|-----|------|
| `Super + Ctrl + p` | `BrogueCE` | Roguelike dungeon crawler |

### Productivity
| Atalho | App | Ação |
|--------|-----|------|
| `Super + Ctrl + t` | `taskwarrior-tui` | Gerenciador de tarefas |
| `Super + Ctrl + c` | `calcurse` | Calendário/agenda |

> ✅ **Vantagem**: Nenhum conflito com navegação hjkl do GNOME ou comandos do Neovim!

## 🔄 Controle de Janelas

| Atalho | Ação |
|--------|------|
| `Super + q` | Fechar janela |
| `Super + f` | Toggle fullscreen |
| `Super + Tab` | Trocar entre aplicativos |
| `Alt + Tab` | Trocar entre janelas do mesmo app |

## 🎨 Workspaces

| Atalho | Ação |
|--------|------|
| `Super + h/l` | Navegar workspaces horizontalmente (estilo vim) |
| `Super + Shift + h/l` | Mover janela entre workspaces |
| `Super + 1-9` | Ir para workspace específico (se configurado) |
| `Super + Shift + 1-9` | Mover janela para workspace específico |

## 📋 Sistema

| Atalho | Ação |
|--------|------|
| `Super + p` | Configurações de display (projetor) |
| `Super + v` | Notificações |
| `Super + s` | Screenshot interativo |
| `Super + Shift + s` | Screenshot área selecionada |

---

## 🛠️ Comandos de Configuração (gsettings)

### 1. Navegação entre Workspaces (horizontal h/l)

```bash
# Navegar workspaces (horizontal apenas - otimizado para 60%)
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Super>h']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Super>l']"

# Mover janelas entre workspaces
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left "['<Super><Shift>h']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right "['<Super><Shift>l']"
```

### 2. Tiling SEM SETAS (100% compatível com teclado 60%)

```bash
# Tiling usando colchetes (substitui as setas completamente!)
gsettings set org.gnome.mutter.keybindings toggle-tiled-left "['<Super>bracketleft']"
gsettings set org.gnome.mutter.keybindings toggle-tiled-right "['<Super>bracketright']"
gsettings set org.gnome.desktop.wm.keybindings maximize "['<Super>equal']"
gsettings set org.gnome.desktop.wm.keybindings unmaximize "['<Super>minus']"
```

### 3. Controle de Janelas

```bash
# Fechar/Fullscreen
gsettings set org.gnome.desktop.wm.keybindings close "['<Super>q', '<Alt>F4']"
gsettings set org.gnome.desktop.wm.keybindings toggle-fullscreen "['<Super>f']"

# Toggle overview
gsettings set org.gnome.shell.keybindings toggle-overview "['<Super>space']"
```

### 4. Lançadores de Aplicações TUI

```bash
# Configurar lista de custom keybindings
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom7/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom8/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom9/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom10/']"

# Ghostty terminal - Super+Return
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Ghostty'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'ghostty'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Super>Return'

# Nautilus (file manager GUI) - Super+e
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom10/ name 'Nautilus'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom10/ command 'nautilus'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom10/ binding '<Super>e'

# Yazi file manager - Ctrl+Super+e
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name 'Yazi File Manager'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command 'ghostty -e yazi'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding '<Control><Super>e'

# Lazygit - Ctrl+Super+g
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ name 'Lazygit'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ command 'ghostty -e lazygit'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ binding '<Control><Super>g'

# Btop - Ctrl+Super+b
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ name 'Btop System Monitor'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ command 'ghostty -e btop'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ binding '<Super><Ctrl>b'

# Lazydocker - Ctrl+Super+d
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/ name 'Lazydocker'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/ command 'ghostty -e lazydocker'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/ binding '<Control><Super>d'

# Htop - Ctrl+Super+h
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/ name 'Htop'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/ command 'ghostty -e htop'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/ binding '<Control><Super>h'

# K9s - Ctrl+Super+k
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/ name 'K9s Kubernetes'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/ command 'ghostty -e k9s'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/ binding '<Super><Ctrl>k'

# Spotatui - Ctrl+Super+s
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom7/ name 'Spotatui'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom7/ command 'ghostty -e spotatui'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom7/ binding '<Super><Ctrl>s'

# BrogueCE - Ctrl+Super+p
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom8/ name 'BrogueCE'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom8/ command 'ghostty -e brogue'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom8/ binding '<Super><Ctrl>p'

# ytui-music - Ctrl+Super+m
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom9/ name 'ytui-music'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom9/ command 'ghostty -e ytui-music'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom9/ binding '<Super><Ctrl>m'
```

### 5. Screenshots

```bash
gsettings set org.gnome.shell.keybindings show-screenshot-ui "['<Super>s']"
gsettings set org.gnome.shell.keybindings screenshot "['<Super><Shift>s']"
```

---

## 🚀 Script de Instalação Completo

Salve em `~/setup-gnome-keys.sh` e execute com `bash ~/setup-gnome-keys.sh`:

```bash
#!/bin/bash

echo "🎹 Configurando atalhos GNOME para teclado 60%..."
echo ""

# 1. Workspaces (navegação horizontal h/l)
echo "📐 Configurando navegação de workspaces..."
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Super>h']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Super>l']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left "['<Super><Shift>h']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right "['<Super><Shift>l']"

# 2. Tiling SEM SETAS
echo "🪟 Configurando tiling de janelas (SEM SETAS)..."
gsettings set org.gnome.mutter.keybindings toggle-tiled-left "['<Super>bracketleft']"
gsettings set org.gnome.mutter.keybindings toggle-tiled-right "['<Super>bracketright']"
gsettings set org.gnome.desktop.wm.keybindings maximize "['<Super>equal']"
gsettings set org.gnome.desktop.wm.keybindings unmaximize "['<Super>minus']"

# 3. Controle de janelas
echo "🎛️  Configurando controle de janelas..."
gsettings set org.gnome.desktop.wm.keybindings close "['<Super>q']"
gsettings set org.gnome.desktop.wm.keybindings toggle-fullscreen "['<Super>f']"
gsettings set org.gnome.shell.keybindings toggle-overview "['<Super>space']"

# 4. Screenshots
echo "📸 Configurando screenshots..."
gsettings set org.gnome.shell.keybindings show-screenshot-ui "['<Super>s']"
gsettings set org.gnome.shell.keybindings screenshot "['<Super><Shift>s']"

# 5. Custom keybindings para TUI apps
echo "🚀 Configurando lançadores de aplicações TUI..."
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom7/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom8/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom9/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom10/']"

# Ghostty terminal
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Ghostty'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'ghostty'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Super>Return'

# Nautilus (GUI file manager)
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom10/ name 'Nautilus'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom10/ command 'nautilus'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom10/ binding '<Super>e'

# Yazi (TUI file manager)
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name 'Yazi File Manager'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command 'ghostty -e yazi'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding '<Control><Super>e'

# Lazygit
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ name 'Lazygit'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ command 'ghostty -e lazygit'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ binding '<Control><Super>g'

# Btop
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ name 'Btop System Monitor'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ command 'ghostty -e btop'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ binding '<Super><Ctrl>b'

# Lazydocker
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/ name 'Lazydocker'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/ command 'ghostty -e lazydocker'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/ binding '<Control><Super>d'

# Htop
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/ name 'Htop'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/ command 'ghostty -e htop'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/ binding '<Control><Super>h'

# K9s
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/ name 'K9s Kubernetes'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/ command 'ghostty -e k9s'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/ binding '<Super><Ctrl>k'

# Spotatui
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom7/ name 'Spotatui'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom7/ command 'ghostty -e spotatui'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom7/ binding '<Super><Ctrl>s'

# BrogueCE
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom8/ name 'BrogueCE'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom8/ command 'ghostty -e brogue'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom8/ binding '<Super><Ctrl>p'

# ytui-music
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom9/ name 'ytui-music'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom9/ command 'ghostty -e ytui-music'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom9/ binding '<Super><Ctrl>m'

echo ""
echo "✅ Configuração concluída!"
echo ""
echo "📋 Resumo dos atalhos principais:"
echo "  • Super+h/l           - Navegar workspaces"
echo "  • Super+[/]           - Tile esquerda/direita"
echo "  • Super+=/−           - Maximizar/Restaurar"
echo "  • Super+Return        - Ghostty terminal"
echo "  • Super+e             - Nautilus (GUI)"
echo "  • Ctrl+Super+e        - Yazi (TUI)"
echo "  • Ctrl+Super+g        - Lazygit"
echo "  • Ctrl+Super+d        - Lazydocker"
echo "  • Ctrl+Super+b        - Btop"
echo "  • Ctrl+Super+h        - Htop"
echo ""
echo "💡 Pressione Super+/ para ver todos os atalhos no GNOME"
```

---

## 🎯 Consistência com Neovim

| Conceito | Neovim | GNOME (teclado 60%) |
|----------|--------|---------------------|
| Navegação horizontal | `h/l` | `Super + h/l` (workspaces) |
| Fechar | `<leader>q` | `Super + q` |
| Maximizar/Resize | Custom | `Super + =/−` |
| Tiling horizontal | Custom | `Super + [/]` |
| Explorer | `<leader>e` | `Super + e` (Nautilus), `Ctrl+Super+e` (Yazi) |
| Search/Find | `<leader>f` | `Super + space` (launcher) |

> ✅ **Zero conflitos**: Super para GNOME, Ctrl para Neovim, Super+Ctrl para TUI apps

---

## 📝 Notas Importantes

### ✅ Vantagens desta Configuração

- **100% sem setas** - Perfeito para teclado 60%
- **Sem tecla Fn** - Todos os atalhos usam teclas nativas
- **Navegação horizontal** - Super+h/l para workspaces (como abas no Neovim)
- **Tiling intuitivo** - Super+[/] (esquerda/direita), Super+=/− (maximizar/restaurar)
- **Separação clara**:
  - `Super` → GNOME (navegação, tiling)
  - `Super + Ctrl` → TUI apps (yazi, lazygit, btop, etc)
  - `Ctrl` → Livre para Neovim!

### 🎯 Muscle Memory Compartilhada

Muitas ferramentas TUI usam navegação vim-like:

| App | Navegação | Filosofia |
|-----|-----------|-----------|
| `yazi` | hjkl | Vim-native |
| `lazygit` | hjkl | Vim-inspired |
| `btop` | hjkl + vim | Vim-friendly |
| `ranger` | hjkl | Vim-native |

**Resultado**: Mesma navegação em Neovim, GNOME e apps TUI!
