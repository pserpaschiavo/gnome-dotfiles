#!/bin/bash
# Script de validação para testar os scripts de instalação
# Verifica dependências, sintaxe e simula execução

set -e

# Cores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${CYAN}╔════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║  Teste de Validação - Scripts de Instalação       ║${NC}"
echo -e "${CYAN}╚════════════════════════════════════════════════════╝${NC}"
echo ""

# Detectar sistema operacional
if [ -f /etc/fedora-release ]; then
    OS="fedora"
    SCRIPT="install-packages.sh"
    PKG_MGR="dnf"
elif [ -f /etc/lsb-release ] && grep -q Ubuntu /etc/lsb-release; then
    OS="ubuntu"
    SCRIPT="install-packages-ubuntu.sh"
    PKG_MGR="apt"
else
    echo -e "${YELLOW}⚠${NC} Sistema operacional não identificado"
    echo "  Detectado: $(uname -s)"
    OS="unknown"
    SCRIPT="install-packages.sh"
    PKG_MGR="unknown"
fi

echo -e "${BLUE}ℹ${NC} Sistema: ${GREEN}$OS${NC}"
echo -e "${BLUE}ℹ${NC} Script: ${GREEN}$SCRIPT${NC}"
echo ""

# 1. Verificar sintaxe dos scripts
echo -e "${CYAN}═══════════════════════════════════════════════════${NC}"
echo -e "${CYAN}1. Verificação de Sintaxe${NC}"
echo -e "${CYAN}═══════════════════════════════════════════════════${NC}"

for script in install-packages.sh install-packages-ubuntu.sh setup-stow.sh setup-gnome-keys.sh setup-gnome-appearance.sh; do
    if [ -f "$script" ]; then
        echo -n "  Verificando $script... "
        if bash -n "$script" 2>&1; then
            echo -e "${GREEN}✓ OK${NC}"
        else
            echo -e "${RED}✗ ERRO${NC}"
            exit 1
        fi
    fi
done
echo ""

# 2. Verificar dependências críticas
echo -e "${CYAN}═══════════════════════════════════════════════════${NC}"
echo -e "${CYAN}2. Dependências Críticas${NC}"
echo -e "${CYAN}═══════════════════════════════════════════════════${NC}"

CRITICAL_DEPS=("curl" "git" "sudo" "bash")
DEPS_OK=true

for dep in "${CRITICAL_DEPS[@]}"; do
    echo -n "  Verificando $dep... "
    if command -v "$dep" >/dev/null 2>&1; then
        version=$(command -v "$dep" | xargs ls -l 2>/dev/null || echo "")
        echo -e "${GREEN}✓ Instalado${NC}"
    else
        echo -e "${RED}✗ Faltando${NC}"
        DEPS_OK=false
    fi
done

if ! $DEPS_OK; then
    echo ""
    echo -e "${RED}✗${NC} Dependências críticas faltando!"
    exit 1
fi
echo ""

# 3. Verificar package manager
echo -e "${CYAN}═══════════════════════════════════════════════════${NC}"
echo -e "${CYAN}3. Gerenciador de Pacotes${NC}"
echo -e "${CYAN}═══════════════════════════════════════════════════${NC}"

echo -n "  Verificando $PKG_MGR... "
if command -v "$PKG_MGR" >/dev/null 2>&1; then
    echo -e "${GREEN}✓ Disponível${NC}"
    if [ "$PKG_MGR" != "unknown" ]; then
        $PKG_MGR --version 2>&1 | head -1 | sed 's/^/    /'
    fi
else
    echo -e "${RED}✗ Não encontrado${NC}"
fi
echo ""

# 4. Verificar espaço em disco
echo -e "${CYAN}═══════════════════════════════════════════════════${NC}"
echo -e "${CYAN}4. Espaço em Disco${NC}"
echo -e "${CYAN}═══════════════════════════════════════════════════${NC}"

DISK_SPACE=$(df -h "$HOME" | awk 'NR==2 {print $4}')
echo -e "  Espaço disponível em \$HOME: ${GREEN}$DISK_SPACE${NC}"
echo ""

# 5. Verificar conexão com internet
echo -e "${CYAN}═══════════════════════════════════════════════════${NC}"
echo -e "${CYAN}5. Conectividade${NC}"
echo -e "${CYAN}═══════════════════════════════════════════════════${NC}"

URLS=("github.com" "raw.githubusercontent.com")
for url in "${URLS[@]}"; do
    echo -n "  Testando $url... "
    if curl -s --head --connect-timeout 3 "https://$url" >/dev/null 2>&1; then
        echo -e "${GREEN}✓ OK${NC}"
    else
        echo -e "${YELLOW}⚠ Timeout${NC}"
    fi
done
echo ""

# 6. Simular instalação em modo dry-run
echo -e "${CYAN}═══════════════════════════════════════════════════${NC}"
echo -e "${CYAN}6. Simulação Dry-Run${NC}"
echo -e "${CYAN}═══════════════════════════════════════════════════${NC}"

if [ -f "$SCRIPT" ]; then
    echo "  Executando: bash $SCRIPT --dry-run --yes"
    echo ""
    
    # Executar com timeout de 60 segundos
    timeout 60 bash "$SCRIPT" --dry-run --yes 2>&1 | head -50 | while IFS= read -r line; do
        echo "    $line"
    done
    
    echo ""
    echo -e "${GREEN}✓${NC} Dry-run completado"
else
    echo -e "${RED}✗${NC} Script $SCRIPT não encontrado"
fi
echo ""

# 7. Verificar aplicações já instaladas
echo -e "${CYAN}═══════════════════════════════════════════════════${NC}"
echo -e "${CYAN}7. Aplicações TUI Instaladas${NC}"
echo -e "${CYAN}═══════════════════════════════════════════════════${NC}"

TUI_APPS=("ghostty" "yazi" "lazygit" "lazydocker" "btop" "htop" "k9s" "nvim" "zsh" "fzf" "delta" "stow")
INSTALLED_COUNT=0

for app in "${TUI_APPS[@]}"; do
    echo -n "  $app... "
    if command -v "$app" >/dev/null 2>&1; then
        echo -e "${GREEN}✓ Instalado${NC}"
        ((INSTALLED_COUNT++))
    else
        echo -e "${YELLOW}○ Não instalado${NC}"
    fi
done

echo ""
echo -e "  Total instalado: ${GREEN}$INSTALLED_COUNT${NC}/${#TUI_APPS[@]}"
echo ""

# 8. Verificar estrutura de diretórios
echo -e "${CYAN}═══════════════════════════════════════════════════${NC}"
echo -e "${CYAN}8. Estrutura de Dotfiles${NC}"
echo -e "${CYAN}═══════════════════════════════════════════════════${NC}"

EXPECTED_DIRS=("nvim" "ghostty" "yazi" "lazygit" "btop" "zsh")
for dir in "${EXPECTED_DIRS[@]}"; do
    echo -n "  $dir/... "
    if [ -d "$dir" ]; then
        file_count=$(find "$dir" -type f | wc -l)
        echo -e "${GREEN}✓ OK${NC} ($file_count arquivos)"
    else
        echo -e "${YELLOW}○ Não encontrado${NC}"
    fi
done
echo ""

# 9. Resumo final
echo -e "${CYAN}╔════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║               RESUMO DA VALIDAÇÃO                  ║${NC}"
echo -e "${CYAN}╚════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "  ${GREEN}✓${NC} Sintaxe dos scripts válida"
echo -e "  ${GREEN}✓${NC} Dependências críticas presentes"
echo -e "  ${GREEN}✓${NC} Sistema operacional: $OS"
echo -e "  ${GREEN}✓${NC} Gerenciador de pacotes: $PKG_MGR"
echo -e "  ${GREEN}✓${NC} Aplicações TUI: $INSTALLED_COUNT/${#TUI_APPS[@]} instaladas"
echo ""

if [ "$OS" = "unknown" ]; then
    echo -e "${YELLOW}⚠${NC} Sistema operacional não reconhecido"
    echo "  Os scripts foram projetados para Fedora/Ubuntu"
    echo ""
fi

echo -e "${CYAN}═══════════════════════════════════════════════════${NC}"
echo ""
echo -e "${BLUE}ℹ${NC} Próximos passos:"
echo "  1. Revise o log: cat ~/.dotfiles-install.log"
echo "  2. Execute em modo debug: bash $SCRIPT --debug"
echo "  3. Instalação real: bash $SCRIPT --yes"
echo ""
echo -e "${GREEN}✓${NC} Validação concluída com sucesso!"
echo ""
