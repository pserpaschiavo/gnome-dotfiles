#!/bin/bash
# Script de instalação de aplicações TUI e ferramentas essenciais
# Para Fedora/RHEL com DNF

set -e

echo "🚀 Instalando aplicações TUI e ferramentas essenciais..."
echo ""

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Função para verificar se um comando existe
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Função para instalar via DNF
install_dnf() {
    local package=$1
    local binary=${2:-$1}
    
    if command_exists "$binary"; then
        echo -e "${GREEN}✓${NC} $binary já está instalado"
    else
        echo -e "${YELLOW}⏳${NC} Instalando $package..."
        sudo dnf install -y "$package"
    fi
}

# Função para instalar via Cargo (Rust)
install_cargo() {
    local package=$1
    local binary=${2:-$1}
    
    if command_exists "$binary"; then
        echo -e "${GREEN}✓${NC} $binary já está instalado"
    else
        echo -e "${YELLOW}⏳${NC} Instalando $package via cargo..."
        cargo install "$package"
    fi
}

echo "📦 Instalando pacotes via DNF..."
echo ""

# Terminal
install_dnf "ghostty" "ghostty"

# File Managers
install_dnf "yazi" "yazi"

# Git TUI
install_dnf "lazygit" "lazygit"

# System Monitors
install_dnf "btop" "btop"
install_dnf "htop" "htop"

# Docker TUI
if ! command_exists lazydocker; then
    echo -e "${YELLOW}⏳${NC} Instalando lazydocker..."
    curl -sSL https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
else
    echo -e "${GREEN}✓${NC} lazydocker já está instalado"
fi

# Kubernetes TUI (se usar K8s)
read -p "Você usa Kubernetes? Deseja instalar k9s? (y/N): " install_k9s
if [[ $install_k9s =~ ^[Yy]$ ]]; then
    if ! command_exists k9s; then
        echo -e "${YELLOW}⏳${NC} Instalando k9s..."
        curl -sS https://webinstall.dev/k9s | bash
    else
        echo -e "${GREEN}✓${NC} k9s já está instalado"
    fi
fi

# Discord TUI
if ! command_exists discordo; then
    echo -e "${YELLOW}⏳${NC} Instalando discordo (Discord TUI)..."
    echo "  https://github.com/ayn2op/discordo"
    go install github.com/ayn2op/discordo@latest 2>/dev/null || echo "  Requer Go instalado"
else
    echo -e "${GREEN}✓${NC} discordo já está instalado"
fi

# Bombadillo (Gopher/Gemini browser)
if ! command_exists bombadillo; then
    echo -e "${YELLOW}⏳${NC} Instalando bombadillo (Gopher/Gemini TUI)..."
    echo "  https://tildegit.org/sloum/bombadillo"
    echo "  Instalação manual necessária - veja o repositório"
else
    echo -e "${GREEN}✓${NC} bombadillo já está instalado"
fi

# Ferramentas essenciais
echo ""
echo "🔧 Instalando ferramentas essenciais..."
install_dnf "git" "git"
install_dnf "git-delta" "delta"
install_dnf "stow" "stow"
install_dnf "zoxide" "zoxide"
install_dnf "fzf" "fzf"
install_dnf "ripgrep" "rg"
install_dnf "fd-find" "fd"
install_dnf "bat" "bat"
install_dnf "eza" "eza"
install_dnf "neovim" "nvim"

# DevOps Tools
echo ""
echo "⚙️  Instalando ferramentas DevOps..."

# Terraform
if ! command_exists terraform; then
    echo -e "${YELLOW}⏳${NC} Instalando Terraform..."
    sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
    sudo dnf install -y terraform
fi

# Ansible
install_dnf "ansible" "ansible"

# Kubectl
install_dnf "kubernetes-client" "kubectl"

# Helm
if ! command_exists helm; then
    echo -e "${YELLOW}⏳${NC} Instalando Helm..."
    curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
fi

# kubectx and kubens
if ! command_exists kubectx; then
    echo -e "${YELLOW}⏳${NC} Instalando kubectx e kubens..."
    sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx
    sudo ln -sf /opt/kubectx/kubectx /usr/local/bin/kubectx
    sudo ln -sf /opt/kubectx/kubens /usr/local/bin/kubens
fi

# Minikube (opcional)
read -p "Instalar Minikube? (y/N): " install_minikube
if [[ $install_minikube =~ ^[Yy]$ ]]; then
    if ! command_exists minikube; then
        echo -e "${YELLOW}⏳${NC} Instalando Minikube..."
        curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
        sudo install minikube-linux-amd64 /usr/local/bin/minikube
        rm minikube-linux-amd64
    fi
fi

# Kind (Kubernetes in Docker)
if ! command_exists kind; then
    echo -e "${YELLOW}⏳${NC} Instalando Kind..."
    curl -Lo /tmp/kind https://kind.sigs.k8s.io/dl/latest/kind-linux-amd64
    chmod +x /tmp/kind
    sudo mv /tmp/kind /usr/local/bin/kind
fi

# Vault (opcional)
read -p "Instalar HashiCorp Vault? (y/N): " install_vault
if [[ $install_vault =~ ^[Yy]$ ]]; then
    install_dnf "vault" "vault"
fi

# Packer (opcional)
read -p "Instalar HashiCorp Packer? (y/N): " install_packer
if [[ $install_packer =~ ^[Yy]$ ]]; then
    install_dnf "packer" "packer"
fi

# Zsh e Oh My Zsh
echo ""
echo "🐚 Configurando Zsh + Oh My Zsh..."
install_dnf "zsh" "zsh"

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo -e "${YELLOW}⏳${NC} Instalando Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo -e "${GREEN}✓${NC} Oh My Zsh já está instalado"
fi

# Powerlevel10k
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    echo -e "${YELLOW}⏳${NC} Instalando Powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
else
    echo -e "${GREEN}✓${NC} Powerlevel10k já está instalado"
fi

# Zsh plugins
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
    echo -e "${YELLOW}⏳${NC} Instalando zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
else
    echo -e "${GREEN}✓${NC} zsh-autosuggestions já está instalado"
fi

if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    echo -e "${YELLOW}⏳${NC} Instalando zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
else
    echo -e "${GREEN}✓${NC} zsh-syntax-highlighting já está instalado"
fi

# Ferramentas Rust via Cargo (opcional)
echo ""
read -p "Instalar aplicações TUI extras via Cargo? (y/N): " install_extras
if [[ $install_extras =~ ^[Yy]$ ]]; then
    # Verificar se cargo está instalado
    if ! command_exists cargo; then
        echo -e "${YELLOW}⏳${NC} Instalando Rust..."
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
        source "$HOME/.cargo/env"
    fi
    
    # Spotify TUI com streaming nativo
    install_cargo "spotatui" "spotatui"
    
    # YouTube Music TUI
    if ! command_exists ytui-music; then
        echo -e "${YELLOW}⏳${NC} ytui-music requer instalação manual:"
        echo "  https://github.com/sudipghimire533/ytui-music"
        echo "  cargo install --git https://github.com/sudipghimire533/ytui-music.git"
    fi
    
    # Quorum CLI (Session messaging TUI)
    if ! command_exists quorum; then
        echo -e "${YELLOW}⏳${NC} Instalando quorum-cli..."
        echo "  https://github.com/Detrol/quorum-cli"
        cargo install --git https://github.com/Detrol/quorum-cli.git 2>/dev/null || echo "  Erro na instalação"
    fi
    
    # BrogueCE (roguelike game)
    read -p "Instalar BrogueCE (roguelike game)? (y/N): " install_brogue
    if [[ $install_brogue =~ ^[Yy]$ ]]; then
        if ! command_exists brogue; then
            echo -e "${YELLOW}⏳${NC} Instalando BrogueCE..."
            echo "  https://github.com/tmewett/BrogueCE"
            echo "  Baixe release em: https://github.com/tmewett/BrogueCE/releases"
            echo "  Ou compile do source"
        fi
    fi
fi

# Extensões do Gnome
echo ""
echo "🎨 Recomendações para Gnome Shell Extensions..."
echo ""
echo "Instale via Extension Manager (gnome-shell-extension-manager):"
echo "  • Dash to Dock - Dock personalizável"
echo "  • Blur my Shell - Efeitos de blur"
echo "  • Clipboard Indicator - Gerenciador de clipboard"
echo "  • GSConnect - Integração com Android"
echo "  • Just Perfection - Customização da UI"
echo "  • Vitals - Monitor de sistema na barra"
echo "  • Caffeine - Prevenir suspensão automática"
echo "  • AppIndicator Support - Suporte para app indicators"
echo ""

# Instalar Extension Manager
install_dnf "gnome-shell-extension-manager" "gnome-extensions"

echo ""
echo -e "${GREEN}✅ Instalação concluída!${NC}"
echo ""
echo "� Aplicações TUI instaladas/disponíveis:"
echo "  • yazi        - File manager rápido (Rust)"
echo "  • lazygit     - Git TUI fantástico"
echo "  • lazydocker  - Docker TUI (https://github.com/jesseduffield/lazydocker)"
echo "  • btop        - Monitor de sistema moderno"
echo "  • k9s         - Kubernetes TUI (https://github.com/derailed/k9s)"
echo "  • spotatui    - Spotify TUI com streaming nativo"
echo "  • ytui-music  - YouTube Music TUI (https://github.com/sudipghimire533/ytui-music)"
echo "  • discordo    - Discord TUI (https://github.com/ayn2op/discordo)"
echo "  • bombadillo  - Gopher/Gemini browser (https://tildegit.org/sloum/bombadillo)"
echo "  • quorum      - Session messaging TUI (https://github.com/Detrol/quorum-cli)"
echo "  • brogue      - BrogueCE roguelike (https://github.com/tmewett/BrogueCE)"
echo ""
echo "�📝 Próximos passos:"
echo "  1. Execute ./setup-stow.sh para criar symlinks das configurações"
echo "  2. Execute ./setup-gnome-keys.sh para configurar atalhos do Gnome"
echo "  3. Reinicie o shell do Gnome: Alt+F2 → digite 'r' → Enter"
echo "  4. Configure extensões do Gnome via Extension Manager"
