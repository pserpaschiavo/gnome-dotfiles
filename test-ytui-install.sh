#!/bin/bash
# Script informativo sobre ytui-music
# OBSOLETO: ytui-music não compila com Rust 1.70+

# Cores
RED='\033[0;31m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${CYAN}╔════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║  ytui-music - PROJETO INCOMPATÍVEL                ║${NC}"
echo -e "${CYAN}╚════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${RED}⚠ AVISO: ytui-music não funciona com Rust moderno${NC}"
echo ""
echo "O projeto ytui-music foi REMOVIDO dos scripts de instalação devido a:"
echo ""
echo -e "${YELLOW}1.${NC} Erros de compilação com Rust 1.70+"
echo "   • 'dangerous_implicit_autorefs' errors"
echo "   • Código não atualizado desde 2022"
echo ""
echo -e "${YELLOW}2.${NC} Projeto abandonado"
echo "   • Sem manutenção ativa"
echo "   • Dependências desatualizadas"
echo ""
echo -e "${YELLOW}3.${NC} Testado e falhou em:"
echo "   • Fedora 43 + Rust 1.92.0"
echo "   • Falha em 3 pontos do código"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo -e "${CYAN}ALTERNATIVAS RECOMENDADAS:${NC}"
echo ""
echo -e "${YELLOW}1. mpv + yt-dlp (Simples e eficaz)${NC}"
echo "   mpv \"ytsearch:nome da música\""
echo "   mpv --shuffle \"https://www.youtube.com/playlist?list=...\""
echo ""
echo -e "${YELLOW}2. spotatui (Spotify TUI)${NC}"
echo "   cargo install spotatui"
echo "   ✓ Já incluído nos scripts de instalação"
echo ""
echo -e "${YELLOW}3. MPD + ncmpcpp (Música local)${NC}"
echo "   sudo dnf install mpd ncmpcpp"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Veja YTUI_MUSIC.md para mais detalhes e instruções de instalação manual"
echo "com Rust 1.70 (não recomendado)."
echo ""
