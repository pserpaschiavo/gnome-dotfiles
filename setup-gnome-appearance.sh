#!/bin/bash
# Script para configurar extensões e aparência do Gnome
# Cria um ambiente coeso e elegante

set -e

echo "🎨 Configurando aparência e extensões do Gnome..."
echo ""

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Verificar se está rodando Gnome
if [ "$XDG_CURRENT_DESKTOP" != "GNOME" ]; then
    echo "⚠️  Este script é para Gnome Shell"
    exit 1
fi

echo "📦 Instalando Extension Manager..."
if ! command -v gnome-extensions >/dev/null 2>&1; then
    sudo dnf install -y gnome-shell-extension-manager
fi

echo ""
echo -e "${BLUE}🎨 Configurando tema e aparência...${NC}"

# Interface (tema escuro)
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'

# Fontes
gsettings set org.gnome.desktop.interface font-name 'Cantarell 11'
gsettings set org.gnome.desktop.interface document-font-name 'Cantarell 11'
gsettings set org.gnome.desktop.interface monospace-font-name 'ProFont IIx Nerd Font Mono 13'
gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Cantarell Bold 11'

# Comportamento das janelas
gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'
gsettings set org.gnome.desktop.wm.preferences focus-mode 'click'
gsettings set org.gnome.mutter center-new-windows true
gsettings set org.gnome.mutter edge-tiling true

# Animações mais rápidas
gsettings set org.gnome.desktop.interface enable-animations true
gsettings set org.gnome.desktop.interface show-battery-percentage true

# Touchpad
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll true
gsettings set org.gnome.desktop.peripherals.touchpad speed 0.3

# Power settings (não suspender ao fechar tampa se conectado)
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-timeout 1800

# Workspaces
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 4
gsettings set org.gnome.mutter workspaces-only-on-primary false

# Files (Nautilus)
gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'
gsettings set org.gnome.nautilus.preferences show-hidden-files true
gsettings set org.gtk.Settings.FileChooser show-hidden true

echo -e "${GREEN}✓${NC} Configurações de aparência aplicadas"

echo ""
echo -e "${BLUE}🧩 Extensões recomendadas do Gnome${NC}"
echo ""
echo "Instale via Extension Manager (gnome-shell-extension-manager):"
echo ""
echo "=== ESSENCIAIS ==="
echo "  1. Dash to Dock - Dock personalizável"
echo "     https://extensions.gnome.org/extension/307/dash-to-dock/"
echo ""
echo "  2. Blur my Shell - Efeitos de blur"
echo "     https://extensions.gnome.org/extension/3193/blur-my-shell/"
echo ""
echo "  3. Just Perfection - Customização da UI"
echo "     https://extensions.gnome.org/extension/3843/just-perfection/"
echo ""
echo "  4. AppIndicator Support - App indicators"
echo "     https://extensions.gnome.org/extension/615/appindicator-support/"
echo ""
echo "=== PRODUTIVIDADE ==="
echo "  5. Clipboard Indicator - Gerenciador de clipboard"
echo "     https://extensions.gnome.org/extension/779/clipboard-indicator/"
echo ""
echo "  6. Vitals - Monitor de sistema na barra"
echo "     https://extensions.gnome.org/extension/1460/vitals/"
echo ""
echo "  7. Caffeine - Prevenir suspensão"
echo "     https://extensions.gnome.org/extension/517/caffeine/"
echo ""
echo "  8. GSConnect - Integração Android (KDE Connect)"
echo "     https://extensions.gnome.org/extension/1319/gsconnect/"
echo ""
echo "=== WORKFLOW ==="
echo "  9. Grand Theft Focus - Previne roubo de foco"
echo "     https://extensions.gnome.org/extension/5410/grand-theft-focus/"
echo ""
echo " 10. No overview at Start-up"
echo "     https://extensions.gnome.org/extension/4099/no-overview/"
echo ""
echo "=== ESTÉTICA (OPCIONAL) ==="
echo " 11. Compiz alike magic lamp effect"
echo "     https://extensions.gnome.org/extension/3740/compiz-alike-magic-lamp-effect/"
echo ""
echo " 12. Burn My Windows - Efeitos de fechar janela"
echo "     https://extensions.gnome.org/extension/4679/burn-my-windows/"
echo ""

read -p "Abrir Extension Manager agora? (y/N): " open_manager
if [[ $open_manager =~ ^[Yy]$ ]]; then
    gnome-extensions-app &
fi

echo ""
echo -e "${BLUE}🎨 Configurações recomendadas para Dash to Dock:${NC}"
echo "  • Position: Bottom"
echo "  • Icon size: 48px"
echo "  • Show trash: No"
echo "  • Show mounted volumes: No"
echo "  • Intelligent autohide: Yes"
echo "  • Customize opacity: 80%"
echo ""

echo -e "${BLUE}🎨 Configurações recomendadas para Blur my Shell:${NC}"
echo "  • Panel blur: Yes"
echo "  • Dash blur: Yes"
echo "  • Overview blur: Yes"
echo "  • Blur amount: 30"
echo ""

echo ""
echo -e "${GREEN}✅ Setup do Gnome concluído!${NC}"
echo ""
echo "📝 Próximos passos:"
echo "  1. Instale as extensões via Extension Manager"
echo "  2. Reinicie o Gnome Shell: Alt+F2 → 'r' → Enter"
echo "  3. Configure as extensões instaladas"
echo "  4. Aproveite seu ambiente coeso e elegante! 🎉"
