#!/bin/bash
# Script de instalação de aplicações TUI e ferramentas essenciais
# Para Fedora/RHEL com DNF
# Uso: ./install-packages.sh [--dry-run] [--debug] [--yes]

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

echo "🚀 Instalando aplicações TUI e ferramentas essenciais..."
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
        echo "  Instale com: sudo dnf install $package"
        log "ERRO: Dependência faltando - $dep"
        return 1
    fi
    log "OK: Dependência $dep encontrada"
    return 0
}

# Função para instalar via DNF
install_dnf() {
    local package=$1
    local binary=${2:-$1}
    
    if command_exists "$binary"; then
        echo -e "${GREEN}✓${NC} $binary já está instalado"
        log "SKIP: $binary já instalado"
    else
        echo -e "${YELLOW}⏳${NC} Instalando $package..."
        log "INSTALL: Iniciando instalação de $package"
        
        if $DRY_RUN; then
            echo -e "${BLUE}[DRY-RUN]${NC} sudo dnf install -y $package"
        else
            if sudo dnf install -y "$package" >> "$LOG_FILE" 2>&1; then
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

echo "📦 Instalando pacotes via DNF..."
echo ""
log "Iniciando instalação de pacotes"

# Terminal
install_dnf "ghostty" "ghostty"

# File Managers
install_dnf "yazi" "yazi"

# Git TUI
install_dnf "lazygit" "lazygit"

# System Monitors
install_dnf "btop" "btop"
install_dnf "htop" "htop"
install_cargo "bottom" "bottom"  # Alternative system monitor (btm command)

# Network Monitoring
install_cargo "bandwhich" "bandwhich"  # Network usage monitor (requires sudo)
install_cargo "trippy" "trippy"        # Network diagnostic tool (trip command)

# Docker TUI
if ! command_exists lazydocker; then
    echo -e "${YELLOW}⏳${NC} Instalando lazydocker..."
    log "INSTALL: Baixando lazydocker"
    
    if $DRY_RUN; then
        echo -e "${BLUE}[DRY-RUN]${NC} curl -sSL https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash"
    else
        if curl -sSL https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash >> "$LOG_FILE" 2>&1; then
            echo -e "${GREEN}✓${NC} lazydocker instalado com sucesso"
            log "SUCCESS: lazydocker instalado"
        else
            echo -e "${RED}✗${NC} Erro ao instalar lazydocker"
            log "ERROR: Falha no download/instalação do lazydocker"
        fi
    fi
else
    echo -e "${GREEN}✓${NC} lazydocker já está instalado"
    log "SKIP: lazydocker já instalado"
fi

# Kubernetes TUI (se usar K8s)
if $AUTO_YES; then
    install_k9s="y"
elif $DRY_RUN; then
    install_k9s="n"
else
    read -p "Você usa Kubernetes? Deseja instalar k9s? (y/N): " install_k9s
fi

if [[ $install_k9s =~ ^[Yy]$ ]]; then
    if ! command_exists k9s; then
        echo -e "${YELLOW}⏳${NC} Instalando k9s..."
        log "INSTALL: Baixando k9s via webinstall"
        
        if $DRY_RUN; then
            echo -e "${BLUE}[DRY-RUN]${NC} curl -sS https://webinstall.dev/k9s | bash"
        else
            if curl -sS https://webinstall.dev/k9s | bash >> "$LOG_FILE" 2>&1; then
                echo -e "${GREEN}✓${NC} k9s instalado com sucesso"
                log "SUCCESS: k9s instalado"
            else
                echo -e "${RED}✗${NC} Erro ao instalar k9s"
                log "ERROR: Falha no download/instalação do k9s"
            fi
        fi
    else
        echo -e "${GREEN}✓${NC} k9s já está instalado"
        log "SKIP: k9s já instalado"
    fi
fi

# Discord TUI
if ! command_exists discordo; then
    echo -e "${YELLOW}⏳${NC} Instalando discordo (Discord TUI)..."
    echo "  https://github.com/ayn2op/discordo"
    log "INSTALL: Tentando instalar discordo"
    
    if ! command_exists go; then
        echo -e "${RED}✗${NC} Go não está instalado - necessário para discordo"
        echo "  Instale Go primeiro: sudo dnf install golang"
        log "ERROR: Go não disponível para discordo"
    else
        if $DRY_RUN; then
            echo -e "${BLUE}[DRY-RUN]${NC} go install github.com/ayn2op/discordo@latest"
        else
            if go install github.com/ayn2op/discordo@latest >> "$LOG_FILE" 2>&1; then
                echo -e "${GREEN}✓${NC} discordo instalado com sucesso"
                log "SUCCESS: discordo instalado via go install"
            else
                echo -e "${RED}✗${NC} Erro ao instalar discordo via go install"
                log "ERROR: Falha na instalação do discordo"
            fi
        fi
    fi
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

# Markdown/Documentation
install_dnf "glow" "glow"  # Markdown renderer

# Database TUI
cargo install --git https://github.com/TaKO8Ki/gobang  # SQL client TUI (not in crates.io)

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

# eza pode não estar em repos - tentar DNF, cargo ou binário
if ! command_exists eza; then
    echo -e "${YELLOW}⏳${NC} Instalando eza..."
    log "INSTALL: Tentando instalar eza"
    
    if $DRY_RUN; then
        echo -e "${BLUE}[DRY-RUN]${NC} sudo dnf install -y eza || cargo install eza || wget binary"
    else
        # Tentar DNF primeiro
        if sudo dnf install -y eza >> "$LOG_FILE" 2>&1; then
            echo -e "${GREEN}✓${NC} eza instalado via DNF"
            log "SUCCESS: eza instalado via DNF"
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

install_dnf "neovim" "nvim"

# DevOps Tools
echo ""
echo "⚙️  Instalando ferramentas DevOps..."

# Terraform
if ! command_exists terraform; then
    echo -e "${YELLOW}⏳${NC} Instalando Terraform..."
    log "INSTALL: Configurando repositório HashiCorp"
    
    if $DRY_RUN; then
        echo -e "${BLUE}[DRY-RUN]${NC} wget -O- https://rpm.releases.hashicorp.com/fedora/hashicorp.repo | sudo tee /etc/yum.repos.d/hashicorp.repo"
        echo -e "${BLUE}[DRY-RUN]${NC} sudo dnf install -y terraform"
    else
        # Baixar e adicionar repositório HashiCorp
        if wget -q -O /tmp/hashicorp.repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo >> "$LOG_FILE" 2>&1; then
            sudo mv /tmp/hashicorp.repo /etc/yum.repos.d/hashicorp.repo
            install_dnf "terraform" "terraform"
        else
            echo -e "${RED}✗${NC} Erro ao adicionar repositório HashiCorp"
            log "ERROR: Falha ao configurar repo HashiCorp"
        fi
    fi
else
    echo -e "${GREEN}✓${NC} terraform já está instalado"
    log "SKIP: terraform já instalado"
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
log "Configurando Zsh e Oh My Zsh"
install_dnf "zsh" "zsh"

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo -e "${YELLOW}⏳${NC} Instalando Oh My Zsh..."
    log "INSTALL: Baixando Oh My Zsh"
    
    if $DRY_RUN; then
        echo -e "${BLUE}[DRY-RUN]${NC} sh -c \"$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\" \"\" --unattended"
    else
        if sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended >> "$LOG_FILE" 2>&1; then
            echo -e "${GREEN}✓${NC} Oh My Zsh instalado com sucesso"
            log "SUCCESS: Oh My Zsh instalado"
        else
            echo -e "${RED}✗${NC} Erro ao instalar Oh My Zsh"
            log "ERROR: Falha na instalação do Oh My Zsh"
        fi
    fi
else
    echo -e "${GREEN}✓${NC} Oh My Zsh já está instalado"
    log "SKIP: Oh My Zsh já instalado"
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
install_dnf "gnome-shell-extension-manager" "gnome-extensions"

echo ""
echo -e "${GREEN}✅ Instalação concluída!${NC}"
echo ""
echo "� Aplicações TUI instaladas/disponíveis:"
echo "  • yazi        - File manager rápido (Rust)"
echo "  • lazygit     - Git TUI fantástico"
echo "  • lazydocker  - Docker TUI (https://github.com/jesseduffield/lazydocker)"
echo "  • btop/bottom - Monitor de sistema moderno"
echo "  • bandwhich   - Network usage monitor (requer sudo)"
echo "  • trippy      - Network diagnostic tool"
echo "  • glow        - Markdown renderer/viewer"
echo "  • gobang      - SQL client TUI"
echo "  • k9s         - Kubernetes TUI (https://github.com/derailed/k9s)"
echo "  • spotatui    - Spotify TUI com streaming nativo"
echo "  • discordo    - Discord TUI (https://github.com/ayn2op/discordo)"
echo "  • bombadillo  - Gopher/Gemini browser (https://tildegit.org/sloum/bombadillo)"
echo "  • quorum      - Session messaging TUI (https://github.com/Detrol/quorum-cli)"
echo "  • brogue      - BrogueCE roguelike (https://github.com/tmewett/BrogueCE)"
echo ""
echo "  NOTA: ytui-music removido - incompatível com Rust 1.70+ (veja YTUI_MUSIC.md)"
echo ""
echo "�📝 Próximos passos:"
echo "  1. Execute ./setup-stow.sh para criar symlinks das configurações"
echo "  2. Execute ./setup-gnome-keys.sh para configurar atalhos do Gnome"
echo "  3. Reinicie o shell do Gnome: Alt+F2 → digite 'r' → Enter"
echo "  4. Configure extensões do Gnome via Extension Manager"
