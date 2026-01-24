#!/bin/bash
# Script de instalação de aplicações TUI e ferramentas essenciais
# Para Ubuntu/Debian com APT
# Uso: ./install-packages-ubuntu.sh [--dry-run] [--debug] [--yes]

set -e

# Variáveis de controle
DRY_RUN=false
DEBUG=false
AUTO_YES=false

# Processar argumentos
while [[ $# -gt 0 ]]; do
  case $1 in
    --dry-run)
      DRY_RUN=true
      shift
      ;;
    --debug)
      DEBUG=true
      set -x
      shift
      ;;
    --yes|-y)
      AUTO_YES=true
      shift
      ;;
    --help|-h)
      echo "Uso: $0 [OPÇÕES]"
      echo ""
      echo "Opções:"
      echo "  --dry-run    Simula instalação sem fazer mudanças"
      echo "  --debug      Ativa modo debug (set -x)"
      echo "  --yes, -y    Responde 'sim' automaticamente para todas as perguntas"
      echo "  --help, -h   Mostra esta mensagem"
      exit 0
      ;;
    *)
      echo "Opção desconhecida: $1"
      echo "Use --help para ver opções disponíveis"
      exit 1
      ;;
  esac
done

if $DRY_RUN; then
  echo "🔍 MODO DRY-RUN: Nenhuma instalação será realizada"
  echo ""
fi

echo "🚀 Instalando aplicações TUI e ferramentas essenciais (Ubuntu/Debian)..."
echo ""

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Log file
LOG_FILE="$HOME/.dotfiles-install.log"
echo "📝 Log: $LOG_FILE"
echo "" > "$LOG_FILE"
echo "=== Instalação iniciada em $(date) ===" >> "$LOG_FILE"

# Função para logging
log() {
    echo "[$(date '+%H:%M:%S')] $*" >> "$LOG_FILE"
    if $DEBUG; then
        echo -e "${BLUE}[DEBUG]${NC} $*"
    fi
}

# Função para verificar se um comando existe
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Função para verificar dependências
check_dependency() {
    local dep=$1
    local package=${2:-$1}
    
    if ! command_exists "$dep"; then
        echo -e "${RED}✗${NC} Dependência faltando: $dep"
        echo "  Instale com: sudo apt install $package"
        log "ERRO: Dependência faltando - $dep"
        return 1
    fi
    log "OK: Dependência $dep encontrada"
    return 0
}

# Função para instalar via APT
install_apt() {
    local package=$1
    local binary=${2:-$1}
    
    if command_exists "$binary"; then
        echo -e "${GREEN}✓${NC} $binary já está instalado"
        log "SKIP: $binary já instalado"
    else
        echo -e "${YELLOW}⏳${NC} Instalando $package..."
        log "INSTALL: Iniciando instalação de $package"
        
        if $DRY_RUN; then
            echo -e "${BLUE}[DRY-RUN]${NC} sudo apt install -y $package"
        else
            if sudo apt install -y "$package" >> "$LOG_FILE" 2>&1; then
                echo -e "${GREEN}✓${NC} $package instalado com sucesso"
                log "SUCCESS: $package instalado"
            else
                echo -e "${RED}✗${NC} Erro ao instalar $package"
                log "ERROR: Falha na instalação de $package"
                return 1
            fi
        fi
    fi
}

# Função para instalar via Cargo (Rust)
install_cargo() {
    local package=$1
    local binary=${2:-$1}
    
    if command_exists "$binary"; then
        echo -e "${GREEN}✓${NC} $binary já está instalado"
        log "SKIP: $binary já instalado"
    else
        echo -e "${YELLOW}⏳${NC} Instalando $package via cargo..."
        log "INSTALL: Iniciando instalação via cargo - $package"
        
        if $DRY_RUN; then
            echo -e "${BLUE}[DRY-RUN]${NC} cargo install $package"
        else
            if cargo install "$package" >> "$LOG_FILE" 2>&1; then
                echo -e "${GREEN}✓${NC} $package instalado com sucesso"
                log "SUCCESS: $package instalado via cargo"
            else
                echo -e "${RED}✗${NC} Erro ao instalar $package via cargo"
                log "ERROR: Falha na instalação via cargo - $package"
                return 1
            fi
        fi
    fi
}

# Verificar dependências críticas
echo ""
echo "🔍 Verificando dependências do sistema..."
log "Verificando dependências críticas"

DEPS_OK=true
check_dependency "curl" || DEPS_OK=false
check_dependency "git" || DEPS_OK=false
check_dependency "sudo" || DEPS_OK=false

if ! $DEPS_OK; then
    echo -e "${RED}✗${NC} Dependências críticas faltando!"
    echo "  Instale as dependências básicas e tente novamente."
    exit 1
fi

echo -e "${GREEN}✓${NC} Todas dependências críticas presentes"
echo ""

echo "📝 Atualizando lista de pacotes..."
echo ""
log "Atualizando índices do APT"

if $DRY_RUN; then
    echo -e "${BLUE}[DRY-RUN]${NC} sudo apt update"
else
    if ! sudo apt update >> "$LOG_FILE" 2>&1; then
        echo -e "${RED}✗${NC} Erro ao atualizar repositórios APT"
        log "ERROR: Falha em apt update"
        exit 1
    fi
fi

echo ""
echo "📦 Instalando pacotes via APT..."
echo ""
log "Iniciando instalação de pacotes"

# Terminal
if ! command_exists ghostty; then
    echo -e "${YELLOW}⏳${NC} Ghostty não está nos repos do Ubuntu"
    echo "  Visite: https://ghostty.org para instalação manual"
    echo "  Ou compile do source"
fi

# File Managers
install_apt "yazi" "yazi" || {
    echo -e "${YELLOW}⚠${NC} Yazi não encontrado no APT, instalando via cargo..."
    if command_exists cargo; then
        cargo install --locked yazi-fm yazi-cli
    else
        echo "  Instale Rust primeiro: curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"
    fi
}

# Git TUI
if ! command_exists lazygit; then
    echo -e "${YELLOW}⏳${NC} Instalando lazygit..."
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    curl -Lo /tmp/lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar xf /tmp/lazygit.tar.gz -C /tmp lazygit
    sudo install /tmp/lazygit /usr/local/bin
    rm /tmp/lazygit /tmp/lazygit.tar.gz
else
    echo -e "${GREEN}✓${NC} lazygit já está instalado"
fi

# System Monitors
install_apt "btop" "btop"
install_apt "htop" "htop"

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

# Ferramentas essenciais
echo ""
echo "🔧 Instalando ferramentas essenciais..."
install_apt "git" "git"
install_apt "git-delta" "delta" || {
    echo -e "${YELLOW}⚠${NC} git-delta não encontrado, instalando manualmente..."
    DELTA_VERSION=$(curl -s "https://api.github.com/repos/dandavison/delta/releases/latest" | grep -Po '"tag_name": "\K[^"]*')
    curl -Lo /tmp/delta.deb "https://github.com/dandavison/delta/releases/latest/download/git-delta_${DELTA_VERSION}_amd64.deb"
    sudo dpkg -i /tmp/delta.deb
    rm /tmp/delta.deb
}
install_apt "stow" "stow"
install_apt "zoxide" "zoxide"
install_apt "fzf" "fzf"
install_apt "ripgrep" "rg"
install_apt "fd-find" "fd" || sudo ln -sf $(which fdfind) /usr/local/bin/fd
install_apt "bat" "bat" || sudo ln -sf $(which batcat) /usr/local/bin/bat

# eza pode não estar em repos - tentar APT, cargo ou binário
if ! command_exists eza; then
    echo -e "${YELLOW}⏳${NC} Instalando eza..."
    log "INSTALL: Tentando instalar eza"
    
    if $DRY_RUN; then
        echo -e "${BLUE}[DRY-RUN]${NC} sudo apt install -y eza || cargo install eza || wget binary"
    else
        # Tentar APT primeiro
        if sudo apt install -y eza >> "$LOG_FILE" 2>&1; then
            echo -e "${GREEN}✓${NC} eza instalado via APT"
            log "SUCCESS: eza instalado via APT"
        # Tentar Cargo como fallback
        elif command_exists cargo && cargo install eza >> "$LOG_FILE" 2>&1; then
            echo -e "${GREEN}✓${NC} eza instalado via cargo"
            log "SUCCESS: eza instalado via cargo"
        # Instalar via binário pré-compilado do GitHub
        else
            echo -e "${YELLOW}⚠${NC} Instalando eza via binário pré-compilado..."
            log "INFO: Tentando instalar eza via binário GitHub"
            
            EZA_VERSION=$(curl -s "https://api.github.com/repos/eza-community/eza/releases/latest" | grep -Po '"tag_name": "v\K[^"]*' || echo "0.18.0")
            EZA_URL="https://github.com/eza-community/eza/releases/download/v${EZA_VERSION}/eza_x86_64-unknown-linux-gnu.tar.gz"
            
            if curl -sL "$EZA_URL" -o /tmp/eza.tar.gz >> "$LOG_FILE" 2>&1; then
                tar -xzf /tmp/eza.tar.gz -C /tmp
                sudo install -m 755 /tmp/eza /usr/local/bin/
                rm -f /tmp/eza /tmp/eza.tar.gz
                echo -e "${GREEN}✓${NC} eza instalado via binário GitHub"
                log "SUCCESS: eza instalado via binário"
            else
                echo -e "${RED}✗${NC} Falha ao instalar eza"
                echo "  Instale manualmente: cargo install eza"
                log "ERROR: Todas tentativas de instalação do eza falharam"
            fi
        fi
    fi
else
    echo -e "${GREEN}✓${NC} eza já está instalado"
    log "SKIP: eza já instalado"
fi

install_apt "neovim" "nvim"

# DevOps Tools
echo ""
echo "⚙️  Instalando ferramentas DevOps..."

# Terraform
if ! command_exists terraform; then
    echo -e "${YELLOW}⏳${NC} Instalando Terraform..."
    wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
    sudo apt update && sudo apt install -y terraform
fi

# Ansible
install_apt "ansible" "ansible"

# Kubectl
if ! command_exists kubectl; then
    echo -e "${YELLOW}⏳${NC} Instalando kubectl..."
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
    rm kubectl
fi

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
    if ! command_exists vault; then
        echo -e "${YELLOW}⏳${NC} Instalando Vault..."
        sudo apt install -y vault
    fi
fi

# Packer (opcional)
read -p "Instalar HashiCorp Packer? (y/N): " install_packer
if [[ $install_packer =~ ^[Yy]$ ]]; then
    if ! command_exists packer; then
        echo -e "${YELLOW}⏳${NC} Instalando Packer..."
        sudo apt install -y packer
    fi
fi

# Zsh e Oh My Zsh
echo ""
echo "🐚 Configurando Zsh + Oh My Zsh..."
install_apt "zsh" "zsh"

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
    
    # NOTA: ytui-music foi removido devido a incompatibilidade com Rust 1.70+
    # Veja YTUI_MUSIC.md para detalhes e alternativas
    
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
if ! command_exists gnome-extensions; then
    echo -e "${YELLOW}⏳${NC} Instalando Extension Manager..."
    sudo apt install -y gnome-shell-extension-manager
fi

echo ""
echo -e "${GREEN}✅ Instalação concluída!${NC}"
echo ""
echo "📦 Aplicações TUI instaladas/disponíveis:"
echo "  • yazi        - File manager rápido (Rust)"
echo "  • lazygit     - Git TUI fantástico"
echo "  • lazydocker  - Docker TUI (https://github.com/jesseduffield/lazydocker)"
echo "  • btop        - Monitor de sistema moderno"
echo "  • k9s         - Kubernetes TUI (https://github.com/derailed/k9s)"
echo "  • spotatui    - Spotify TUI com streaming nativo"
echo "  • discordo    - Discord TUI (https://github.com/ayn2op/discordo)"
echo "  • bombadillo  - Gopher/Gemini browser (https://tildegit.org/sloum/bombadillo)"
echo "  • quorum      - Session messaging TUI (https://github.com/Detrol/quorum-cli)"
echo "  • brogue      - BrogueCE roguelike (https://github.com/tmewett/BrogueCE)"
echo ""
echo "  NOTA: ytui-music removido - incompatível com Rust 1.70+ (veja YTUI_MUSIC.md)"
echo ""
echo "📝 Próximos passos:"
echo "  1. Execute ./setup-stow.sh para criar symlinks das configurações"
echo "  2. Execute ./setup-gnome-keys.sh para configurar atalhos do Gnome"
echo "  3. Reinicie o shell do Gnome: Alt+F2 → digite 'r' → Enter"
echo "  4. Configure extensões do Gnome via Extension Manager"
echo "  5. Torne Zsh o shell padrão: chsh -s \$(which zsh)"
