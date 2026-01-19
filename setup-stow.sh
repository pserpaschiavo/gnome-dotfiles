#!/bin/bash
# Script de configuração automática usando GNU Stow
# Cria symlinks de todos os pacotes de dotfiles para ~/.config

set -e

echo "🔗 Configurando dotfiles com GNU Stow..."
echo ""

# Cores
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Diretório do dotfiles
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Verificar se stow está instalado
if ! command -v stow >/dev/null 2>&1; then
    echo "❌ GNU Stow não está instalado!"
    echo "Execute: sudo dnf install stow"
    exit 1
fi

# Lista de pacotes disponíveis
packages=(
    "nvim"
    "ghostty"
    "yazi"
    "lazygit"
    "btop"
    "zsh"
)

echo -e "${BLUE}📦 Pacotes disponíveis:${NC}"
for pkg in "${packages[@]}"; do
    if [ -d "$DOTFILES_DIR/$pkg" ]; then
        echo "  ✓ $pkg"
    else
        echo "  ✗ $pkg (não encontrado)"
    fi
done
echo ""

# Função para fazer stow de um pacote
stow_package() {
    local package=$1
    
    if [ ! -d "$DOTFILES_DIR/$package" ]; then
        echo -e "${YELLOW}⚠${NC}  $package não encontrado, pulando..."
        return
    fi
    
    echo -e "${YELLOW}🔗${NC} Configurando $package..."
    
    # Fazer backup se já existir
    if [ -e "$HOME/.config/$package" ] && [ ! -L "$HOME/.config/$package" ]; then
        backup_dir="$HOME/.config/${package}.backup.$(date +%Y%m%d_%H%M%S)"
        echo "   📦 Fazendo backup: $backup_dir"
        mv "$HOME/.config/$package" "$backup_dir"
    fi
    
    # Executar stow
    cd "$DOTFILES_DIR"
    if stow -v "$package" 2>&1 | grep -q "LINK"; then
        echo -e "${GREEN}   ✓${NC} $package configurado com sucesso"
    else
        stow "$package" >/dev/null 2>&1
        echo -e "${GREEN}   ✓${NC} $package já estava configurado"
    fi
}

# Opção para stow todos ou individuais
if [ "$1" == "--all" ] || [ "$1" == "-a" ]; then
    echo "🚀 Configurando todos os pacotes..."
    echo ""
    for pkg in "${packages[@]}"; do
        stow_package "$pkg"
    done
elif [ -n "$1" ]; then
    # Stow pacotes específicos passados como argumentos
    for pkg in "$@"; do
        stow_package "$pkg"
    done
else
    # Modo interativo
    echo "Selecione os pacotes para configurar:"
    echo ""
    echo "  1) Todos os pacotes"
    echo "  2) Selecionar individualmente"
    echo "  3) Apenas apps TUI (yazi, lazygit, btop)"
    echo "  4) Apenas Ghostty + Nvim"
    echo ""
    read -p "Opção [1-4]: " choice
    
    case $choice in
        1)
            for pkg in "${packages[@]}"; do
                stow_package "$pkg"
            done
            ;;
        2)
            for pkg in "${packages[@]}"; do
                read -p "Configurar $pkg? (y/N): " answer
                if [[ $answer =~ ^[Yy]$ ]]; then
                    stow_package "$pkg"
                fi
            done
            ;;
        3)
            stow_package "yazi"
            stow_package "lazygit"
            stow_package "btop"
            ;;
        4)
            stow_package "ghostty"
            stow_package "nvim"
            ;;
        *)
            echo "Opção inválida"
            exit 1
            ;;
    esac
fi

echo ""
echo -e "${GREEN}✅ Configuração concluída!${NC}"
echo ""
echo "📝 Os seguintes symlinks foram criados:"
for pkg in "${packages[@]}"; do
    if [ -L "$HOME/.config/$pkg" ]; then
        echo -e "  ${GREEN}✓${NC} ~/.config/$pkg → $DOTFILES_DIR/$pkg/.config/$pkg"
    fi
done

echo ""
echo "💡 Dicas:"
echo "  • Para desfazer: stow -D <package>"
echo "  • Para reconfigurar: stow -R <package>"
echo "  • Para ver o que seria feito: stow -n <package>"
echo ""
echo "🎯 Próximo passo: ./setup-gnome-keys.sh para configurar atalhos!"
