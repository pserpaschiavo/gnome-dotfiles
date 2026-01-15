# Atalhos GNOME para Teclado 60% + Neovim Workflow

> 🎯 **Filosofia**: Usar `Super` (tecla Windows) para GNOME, mantendo `Ctrl` livre para Neovim

## 🖥️ Gerenciamento de Janelas (estilo Neovim hjkl)

| Atalho | Ação | Comando GNOME |
|--------|------|---------------|
| `Super + h` | Mover janela para workspace esquerda | `switch-to-workspace-left` |
| `Super + l` | Mover janela para workspace direita | `switch-to-workspace-right` |
| `Super + j` | Mover janela para workspace baixo | `switch-to-workspace-down` |
| `Super + k` | Mover janela para workspace cima | `switch-to-workspace-up` |
| `Super + Shift + h` | Mover janela para monitor esquerdo | `move-to-monitor-left` |
| `Super + Shift + l` | Mover janela para monitor direito | `move-to-monitor-right` |

## 📐 Tiling de Janelas (sem setas)

| Atalho | Ação |
|--------|------|
| `Super + Left` | Janela à esquerda (metade) |
| `Super + Right` | Janela à direita (metade) |
| `Super + Up` | Maximizar janela |
| `Super + Down` | Restaurar/Minimizar |

**Alternativa para 60% (sem setas):**
| Atalho | Ação |
|--------|------|
| `Super + [` | Janela à esquerda (metade) |
| `Super + ]` | Janela à direita (metade) |
| `Super + =` | Maximizar janela |
| `Super + -` | Restaurar janela |

## 🚀 Lançadores Rápidos

| Atalho | Ação |
|--------|------|
| `Super + Return` | Abrir terminal (Ghostty) |
| `Super + e` | Abrir explorador de arquivos |
| `Super + b` | Abrir navegador |
| `Super + Space` | Launcher/Overview |
| `Super + /` | Mostrar atalhos |

## 🎯 Aplicações TUI Recomendadas

### File Managers
| Atalho | App | Ação |
|--------|-----|------|
| `Super + r` | `yazi` | File manager rápido em Rust |
| `Super + Ctrl + e` | `ranger` | File manager estilo vim |

### Dashboards & Monitoring
| Atalho | App | Ação |
|--------|-----|------|
| `Super + Ctrl + b` | `btop` | Monitor de sistema avançado |
| `Super + i` | `htop` | Monitor de processos |
| `Super + Ctrl + n` | `nethogs` | Monitor de tráfego de rede |

### Development
| Atalho | App | Ação |
|--------|-----|------|
| `Super + g` | `lazygit` | Git TUI (coeso com Neovim) |
| `Super + d` | `lazydocker` | Docker TUI |
| `Super + Ctrl + k` | `k9s` | Kubernetes TUI |

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

> ⚠️ **Nota sobre Ctrl**: `Super + Ctrl + h/l` já está mapeado para navegação de workspaces. Se preferir, remova esses e use apenas hjkl sem modificador.

## 🔄 Controle de Janelas

| Atalho | Ação |
|--------|------|
| `Super + q` | Fechar janela |
| `Super + f` | Toggle fullscreen |
| `Super + m` | Minimizar |
| `Super + Tab` | Trocar entre aplicativos |
| `Alt + Tab` | Trocar entre janelas do mesmo app |

## 🎨 Workspaces (inspirado em Neovim tabs)

| Atalho | Ação |
|--------|------|
| `Super + 1-9` | Ir para workspace 1-9 |
| `Super + Shift + 1-9` | Mover janela para workspace 1-9 |
| `Super + h/l/j/k` | Navegar workspaces (direções vim) |

## 📋 Sistema

| Atalho | Ação |
|--------|------|
| `Super + p` | Configurações de display (projetor) |
| `Super + v` | Notificações |
| `Super + s` | Screenshot área selecionada |
| `Super + Shift + s` | Screenshot tela completa |

---

## 🛠️ Aplicar Configurações (gsettings)

### 1. Navegação entre Workspaces (hjkl style)

```bash
# Navegar workspaces
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Super>h']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Super>l']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['<Super>k']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['<Super>j']"

# Mover janelas entre workspaces
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left "['<Super><Shift>h']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right "['<Super><Shift>l']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up "['<Super><Shift>k']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down "['<Super><Shift>j']"
```

### 2. Tiling sem Setas (60% friendly)

```bash
# Tiling alternativo
gsettings set org.gnome.mutter.keybindings toggle-tiled-left "['<Super>bracketleft']"
gsettings set org.gnome.mutter.keybindings toggle-tiled-right "['<Super>bracketright']"
gsettings set org.gnome.desktop.wm.keybindings maximize "['<Super>equal']"
gsettings set org.gnome.desktop.wm.keybindings unmaximize "['<Super>minus']"
```

### 3. Controle de Janelas

```bash
# Fechar/Minimizar/Fullscreen
gsettings set org.gnome.desktop.wm.keybindings close "['<Super>q', '<Alt>F4']"
gsettings set org.gnome.desktop.wm.keybindings toggle-fullscreen "['<Super>f']"
gsettings set org.gnome.desktop.wm.keybindings minimize "['<Super>m']"

# Toggle overview
gsettings set org.gnome.shell.keybindings toggle-overview "['<Super>space']"
```

### 4. Lançadores Personalizados

```bash
# Terminal (ajuste o comando para Ghostty)
gsettings set org.gnome.settings-daemon.plugins.media-keys terminal "['<Super>Return']"

# File Manager TUI (yazi)
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/']"

# Ghostty
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Ghostty'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'ghostty'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Super>Return'

# Yazi file manager
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name 'Yazi'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command 'ghostty -e yazi'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding '<Super>r'

# Lazygit
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ name 'Lazygit'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ command 'ghostty -e lazygit'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ binding '<Super>g'

# Btop system monitor
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ name 'Btop'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ command 'ghostty -e btop'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ binding '<Super><Shift>h'

# Lazydocker
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/ name 'Lazydocker'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/ command 'ghostty -e lazydocker'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/ binding '<Super>d'

# Htop
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/ name 'Htop'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/ command 'ghostty -e htop'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/ binding '<Super>i'

# K9s (se usar Kubernetes)
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/ name 'K9s'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/ command 'ghostty -e k9s'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/ binding '<Super><Shift>k'

# Spotatui (Spotify TUI)
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom7/ name 'Spotatui'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom7/ command 'ghostty -e spotatui'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom7/ binding '<Super><Ctrl>s'

# BrogueCE (Roguelike game)
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom8/ name 'BrogueCE'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom8/ command 'ghostty -e brogue'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom8/ binding '<Super><Ctrl>p'

# ytui-music (YouTube Music TUI)
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom9/ name 'ytui-music'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom9/ command 'ghostty -e ytui-music'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom9/ binding '<Super><Ctrl>m'
```

### 5. Screenshots

```bash
gsettings set org.gnome.shell.keybindings screenshot "['<Super><Shift>s']"
gsettings set org.gnome.shell.keybindings show-screenshot-ui "['<Super>s']"
```

### 6. Workspaces Numéricos

```bash
# Ir para workspace específico
for i in {1..9}; do
  gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$i "['<Super>$i']"
  gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-$i "['<Super><Shift>$i']"
done
```

---

## 🚀 Script de Instalação Rápida

Salve isso em `~/setup-gnome-keys.sh`:

```bash
#!/bin/bash

echo "🎹 Configurando atalhos GNOME para teclado 60%..."

# Workspaces (hjkl)
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Super>h']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Super>l']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['<Super>k']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['<Super>j']"

# Mover janelas
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left "['<Super><Shift>h']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right "['<Super><Shift>l']"

# Tiling (sem setas)
gsettings set org.gnome.mutter.keybindings toggle-tiled-left "['<Super>bracketleft']"
gsettings set org.gnome.mutter.keybindings toggle-tiled-right "['<Super>bracketright']"
gsettings set org.gnome.desktop.wm.keybindings maximize "['<Super>equal']"
gsettings set org.gnome.desktop.wm.keybindings unmaximize "['<Super>minus']"

# Controle
gsettings set org.gnome.desktop.wm.keybindings close "['<Super>q']"
gsettings set org.gnome.desktop.wm.keybindings toggle-fullscreen "['<Super>f']"
gsettings set org.gnome.shell.keybindings toggle-overview "['<Super>space']"

# Screenshots
gsettings set org.gnome.shell.keybindings show-screenshot-ui "['<Super>s']"

echo "🎯 Configurando lançadores de aplicações TUI..."

# Configurar custom keybindings
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom7/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom8/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom9/']"

# Ghostty terminal
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Ghostty'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'ghostty'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Super>Return'

# Yazi (file manager TUI)
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name 'Yazi File Manager'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command 'ghostty -e yazi'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding '<Super>r'

# Lazygit (Git TUI)
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ name 'Lazygit'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ command 'ghostty -e lazygit'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ binding '<Super>g'

# Btop (system monitor) - TUI apps usam Ctrl
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ name 'Btop System Monitor'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ command 'ghostty -e btop'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/ binding '<Super><Ctrl>b'

# Lazydocker (Docker TUI)
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/ name 'Lazydocker'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/ command 'ghostty -e lazydocker'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/ binding '<Super>d'

# Htop (process monitor)
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/ name 'Htop'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/ command 'ghostty -e htop'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/ binding '<Super>i'

# K9s (Kubernetes TUI) - TUI apps usam Ctrl
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/ name 'K9s Kubernetes'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/ command 'ghostty -e k9s'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/ binding '<Super><Ctrl>k'

# Spotatui - TUI Spotify com streaming nativo
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom7/ name 'Spotatui'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom7/ command 'ghostty -e spotatui'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom7/ binding '<Super><Ctrl>s'

# ytui-music - YouTube Music TUI
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom9/ name 'ytui-music'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom9/ command 'ghostty -e ytui-music'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom9/ binding '<Super><Ctrl>m'

# BrogueCE - Roguelike game
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom8/ name 'BrogueCE'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom8/ command 'ghostty -e brogue'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom8/ binding '<Super><Ctrl>p'

echo "✅ Atalhos configurados!"
echo ""
echo "📦 Aplicações TUI recomendadas para instalar:"
echo "  • yazi        - File manager rápido (Rust)"
echo "  • lazygit     - Git TUI fantástico"
echo "  • lazydocker  - Docker TUI"
echo "  • btop        - Monitor de sistema moderno"
echo "  • k9s         - Kubernetes TUI (se usar K8s)"
echo "  • spotatui    - Spotify TUI com streaming nativo"
echo "  • ytui-music  - YouTube Music TUI"
echo "  • brogue      - BrogueCE roguelike game"
echo "  • ranger      - File manager alternativo"
echo ""
echo "💡 Pressione Super+/ para ver todos os atalhos no GNOME"
```

**Execute:**
```bash
chmod +x ~/setup-gnome-keys.sh
~/setup-gnome-keys.sh
```

---

## 🎯 Consistência com Neovim

| Conceito | Neovim | GNOME |
|----------|--------|-------|
| Navegação básica | `hjkl` | `Super + hjkl` (workspaces) |
| Fechar | `<leader>q` | `Super + q` |
| Maximizar/Resize | `<leader>=/−` | `Super + =/−` |
| Tiling horizontal | `<leader>[/]` | `Super + [/]` |
| Explorer | `<leader>e` | `Super + e` |
| Search/Find | `<leader>f` | `Super + space` (launcher) |

## 📝 Notas

- ✅ **Super (Windows)** não conflita com Neovim (que usa Ctrl/Leader)
- ✅ **hjkl** para navegação (mesma lógica do Vim)
- ✅ **Sem dependência de setas** (perfeito para 60%)
- ✅ **Consistência** entre terminal e desktop
- 💡 Use `Super + /` para lembrar dos atalhos no GNOME

## 🎯 Apps TUI Essenciais para DevOps/Python

Baseado na sua stack, recomendo instalar:

```bash
# File Management
yay -S yazi              # File manager moderno em Rust
yay -S ranger            # Alternativa clássica

# Development
yay -S lazygit           # Git TUI (Must-have!)
yay -S lazydocker        # Docker TUI
yay -S k9s               # Kubernetes TUI (se usar)

# Monitoring
yay -S btop              # System monitor moderno
yay -S htop              # Process monitor clássico
yay -S nethogs           # Network traffic monitor

# Multimedia
yay -S spotatui          # Spotify TUI com streaming nativo (Go)
yay -S ytui-music        # YouTube Music TUI (Rust)

# Games
yay -S brogue-ce         # Beautiful roguelike dungeon crawler

# Productivity (opcional)
yay -S taskwarrior-tui   # Task management
yay -S cmus              # Music player
```

### Alternativas Ubuntu/Debian:
```bash
sudo apt install yazi lazygit btop htop ranger
# lazydocker, k9s e brogue-ce: baixar releases do GitHub
# spotatui: baixar release do GitHub (LargeModGames/spotatui)
# ytui-music: cargo install ytui-music
```

## 🔗 Integração com Neovim

Muitas dessas ferramentas compartilham keybindings vim-like:

| App | Navegação | Filosofia |
|-----|-----------|-----------|
| `yazi` | hjkl | Vim-native |
| `lazygit` | hjkl | Vim-inspired |
| `ranger` | hjkl | Vim-native |
| `btop` | hjkl + vim | Vim-friendly |

**Vantagem**: Muscle memory compartilhada entre Neovim e TUIs!
