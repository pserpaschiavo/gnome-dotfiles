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

# Screenshots (teclado 60% - sem Print Screen)
gsettings set org.gnome.shell.keybindings show-screenshot-ui "['<Super>s']"
gsettings set org.gnome.shell.keybindings screenshot "['<Super><Alt>s']"
gsettings set org.gnome.shell.keybindings screenshot-window "['<Super>w']"
gsettings set org.gnome.shell.keybindings area-screenshot "['<Super><Shift>s']"

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
echo "  • discordo    - Discord TUI"
echo "  • bombadillo  - Gopher/Gemini browser"
echo "  • quorum      - Session messaging TUI"
echo "  • brogue      - BrogueCE roguelike game"
echo ""
echo "💡 Pressione Super+/ para ver todos os atalhos no GNOME"
