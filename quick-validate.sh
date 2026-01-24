#!/bin/bash
# Script simples de validação - apenas verifica sem executar

echo "╔════════════════════════════════════════╗"
echo "║  Validação Rápida dos Scripts          ║"
echo "╚════════════════════════════════════════╝"
echo ""

# 1. Sintaxe
echo "1. Verificando sintaxe dos scripts..."
for script in install-packages.sh install-packages-ubuntu.sh setup-stow.sh setup-gnome-keys.sh; do
    if [ -f "$script" ]; then
        if bash -n "$script" 2>/dev/null; then
            echo "  ✓ $script - sintaxe OK"
        else
            echo "  ✗ $script - ERRO de sintaxe"
            bash -n "$script"
            exit 1
        fi
    fi
done
echo ""

# 2. Dependências
echo "2. Verificando dependências críticas..."
for cmd in curl git sudo bash; do
    if command -v "$cmd" >/dev/null 2>&1; then
        echo "  ✓ $cmd"
    else
        echo "  ✗ $cmd - NÃO ENCONTRADO"
    fi
done
echo ""

# 3. Estrutura
echo "3. Verificando estrutura de dotfiles..."
for dir in nvim ghostty yazi lazygit btop zsh; do
    if [ -d "$dir" ]; then
        files=$(find "$dir" -type f | wc -l)
        echo "  ✓ $dir/ ($files arquivos)"
    else
        echo "  ○ $dir/ - não encontrado"
    fi
done
echo ""

# 4. Apps instaladas
echo "4. Aplicações TUI instaladas:"
for app in ghostty yazi lazygit btop nvim zsh fzf delta stow; do
    if command -v "$app" >/dev/null 2>&1; then
        echo "  ✓ $app"
    else
        echo "  ○ $app - não instalado"
    fi
done
echo ""

echo "════════════════════════════════════════"
echo "✓ Validação concluída"
echo ""
echo "Próximos passos:"
echo "  • Testar: ./install-packages.sh --dry-run --yes"
echo "  • Debug:  ./install-packages.sh --debug --dry-run --yes"
echo "  • Instalar: ./install-packages.sh --yes"
echo ""
