# 🏠 Dotfiles - Ambiente de Desenvolvimento Minimalista e Elegante

Configurações para um ambiente de desenvolvimento moderno e coeso no Gnome, focado em aplicações TUI (Terminal User Interface) e produtividade.

## 📦 Pacotes Incluídos

### Terminal & Shell
- **[Ghostty](https://ghostty.org/)** - Terminal moderno e rápido em GPU
- **Zsh** + **[Oh My Zsh](https://ohmyz.sh/)** - Shell poderoso e customizável
- **[Powerlevel10k](https://github.com/romkatv/powerlevel10k)** - Prompt bonito e rápido (tema Gruvbox Material)
- **[zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)** - Sugestões baseadas no histórico
- **[zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)** - Syntax highlighting em tempo real

### Editores
- **[Neovim](https://neovim.io/)** - Editor modal altamente configurável

### File Managers
- **[Yazi](https://yazi-rs.github.io/)** - File manager TUI rápido em Rust

### Git Tools
- **[Lazygit](https://github.com/jesseduffield/lazygit)** - Git TUI fantástico
- **[Delta](https://github.com/dandavison/delta)** - Diff viewer com syntax highlighting

### System Monitors
- **[Btop](https://github.com/aristocratos/btop)** - Monitor de sistema moderno
- **[Htop](https://htop.dev/)** - Monitor de processos clássico

### DevOps (Opcionais)
- **[Lazydocker](https://github.com/jesseduffield/lazydocker)** - Docker TUI
- **[K9s](https://github.com/derailed/k9s)** - Kubernetes TUI

### Comunicação & Social
- **[Discordo](https://github.com/ayn2op/discordo)** - Discord TUI
- **[Quorum](https://github.com/Detrol/quorum-cli)** - Session messaging TUI

### Browser Alternativo
- **[Bombadillo](https://tildegit.org/sloum/bombadillo)** - Gopher/Gemini browser TUI

### Entretenimento
- **[Spotatui](https://github.com/ayn2op/spotatui)** - Spotify TUI (opcional)
- **[ytui-music](https://github.com/sudipghimire533/ytui-music)** - YouTube Music TUI (opcional)
- **[BrogueCE](https://github.com/tmewett/BrogueCE)** - Roguelike game (opcional)

### Ferramentas CLI Essenciais
- **[fzf](https://github.com/junegunn/fzf)** - Fuzzy finder
- **[ripgrep (rg)](https://github.com/BurntSushi/ripgrep)** - Busca ultra-rápida
- **[fd](https://github.com/sharkdp/fd)** - Find moderno
- **[bat](https://github.com/sharkdp/bat)** - Cat com syntax highlighting
- **[eza](https://github.com/eza-community/eza)** - ls moderno
- **[zoxide](https://github.com/ajeetdsouza/zoxide)** - cd inteligente

## 🚀 Instalação Rápida

### 1. Clone o repositório

```bash
git clone https://github.com/seu-usuario/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 2. Instale as aplicações

**Fedora/RHEL:**
```bash
./install-packages.sh
```

**Ubuntu/Debian:**
```bash
./install-packages-ubuntu.sh
```

Estes scripts instalarão:
- Pacotes via DNF (Fedora/RHEL)
- Lazydocker via script oficial
- Opcionalmente K9s, Spotatui e outras ferramentas

### 3. Configure os dotfiles com Stow

```bash
./setup-stow.sh --all
```

Ou de forma interativa:
```bash
./setup-stow.sh
```

### 4. Configure os atalhos do Gnome

```bash
./setup-gnome-keys.sh
```

## 🎹 Atalhos do Gnome (Teclado 60%)

### Navegação de Workspaces (Vim-style)
- `Super + h/j/k/l` - Alternar entre workspaces
- `Super + Shift + h/l` - Mover janela para workspace

### Window Management
- `Super + [` - Tile à esquerda
- `Super + ]` - Tile à direita
- `Super + =` - Maximizar
- `Super + -` - Desmaximizar
- `Super + f` - Fullscreen
- `Super + q` - Fechar janela

### Screenshots (sem Print Screen)
- `Super + s` - Interface de screenshot
- `Super + Shift + s` - Capturar área
- `Super + w` - Capturar janela
- `Super + Alt + s` - Capturar tela inteira

### Lançadores TUI
- `Super + Enter` - Ghostty terminal
- `Super + r` - Yazi file manager
- `Super + g` - Lazygit
- `Super + d` - Lazydocker
- `Super + i` - Htop
- `Super + Ctrl + b` - Btop
- `Super + Ctrl + k` - K9s
- `Super + Ctrl + s` - Spotatui
- `Super + Ctrl + m` - ytui-music
- `Super + Ctrl + p` - BrogueCE

### Sistema
- `Super + Space` - Overview

## 📁 Estrutura do Repositório

```
dotfiles/
├── nvim/                    # Neovim config
│   └── .config/nvim/
├── ghostty/                 # Ghostty terminal
│   └── .config/ghostty/
├── yazi/                    # File manager TUI
│   └── .config/yazi/
├── lazygit/                 # Git TUI
│   └── .config/lazygit/
├── btop/                    # System monitor
│   └── .config/btop/
├── zsh/                     # Zsh + Powerlevel10k
│   ├── .zshrc
│   └── .p10k.zsh
├── install-packages.sh      # Instalação de pacotes
├── setup-stow.sh           # Automação do Stow
├── setup-gnome-keys.sh     # Configuração de atalhos
└── setup-gnome-appearance.sh
```

## 🎨 Tema e Estética

### Tema Base: **Gruvbox Material Dark**
- Terminal: Gruvbox Material Dark Hard
- Btop: gruvbox_material_dark
- Lazygit: Gruvbox theme
- Neovim: gruvbox-material (recomendado: https://github.com/sainnhe/gruvbox-material)

### Fontes
- **ProFont IIx Nerd Font Mono** - Terminal e código
- Instale Nerd Fonts: `sudo dnf install nerdfont-*`

### Plugins Neovim Recomendados
- **gruvbox-material** - Tema consistente
- **markview.nvim** - Renderização linda de Markdown
- Veja [NVIM_PLUGINS.md](NVIM_PLUGINS.md) para configuração completa

### Transparência e Blur
- Ghostty: 85% opacidade com blur
- Gnome: Use extensão "Blur my Shell"

## 🔧 Gerenciamento com Stow

### Comandos úteis

```bash
# Criar symlinks para um pacote
stow nvim

# Criar symlinks para todos
stow */

# Remover symlinks
stow -D nvim

# Reconfigurar (remove e recria)
stow -R nvim

# Ver o que seria feito (dry-run)
stow -n nvim
```

## 🎨 Extensões Recomendadas do Gnome

Instale via **Extension Manager** (`gnome-shell-extension-manager`):

### Essenciais
- **Dash to Dock** - Dock personalizável no estilo macOS/Ubuntu
- **Blur my Shell** - Efeitos de blur elegantes
- **Just Perfection** - Customização fina da UI do Gnome
- **AppIndicator Support** - Suporte para app indicators na barra

### Produtividade
- **Clipboard Indicator** - Gerenciador de área de transferência
- **Vitals** - Monitor de CPU/RAM/Rede na barra superior
- **Caffeine** - Prevenir suspensão automática
- **GSConnect** - Integração KDE Connect (Android)

### Workflow
- **Window Is Ready - Notification Remover** - Remove notificações "App está pronto"
- **Grand Theft Focus** - Previne roubo de foco
- **No Overview at Start-up** - Não abrir Overview ao iniciar

### Estética
- **Compiz alike magic lamp effect** - Efeito de minimização
- **Desktop Cube** - Desktop em cubo 3D
- **Burn My Windows** - Efeitos de fechar janela

## 🛠️ Configurações Adicionais

### Zoxide (cd inteligente)
```bash
# Adicione ao ~/.zshrc ou ~/.bashrc
eval "$(zoxide init zsh)"  # ou bash
```

### FZF (Fuzzy Finder)
```bash
# Adicione ao ~/.zshrc ou ~/.bashrc
source /usr/share/fzf/shell/key-bindings.zsh
```

### Git Delta
Já configurado no `lazygit/config.yml`, mas para git global:
```bash
git config --global core.pager "delta"
git config --global interactive.diffFilter "delta --color-only"
git config --global delta.navigate "true"
git config --global merge.conflictstyle "diff3"
git config --global diff.colorMoved "default"
```

### Zsh como Shell Padrão
Tornar Zsh o shell padrão:
```bash
chsh -s $(which zsh)
```

Depois de fazer stow do zsh:
```bash
stow zsh  # Cria symlinks de .zshrc e .p10k.zsh
source ~/.zshrc
```

O Powerlevel10k já está configurado com tema Gruvbox Material Dark! 🎨

**Plugins DevOps:** Mais de 40 plugins do Oh My Zsh configurados para DevOps (Docker, Kubernetes, Terraform, AWS, Azure, GCloud, Ansible, etc.). Veja [ZSH_DEVOPS.md](ZSH_DEVOPS.md) para detalhes completos.

## 🎯 Filosofia do Setup

Este ambiente foi projetado com foco em:

1. **Minimalismo** - Apenas o essencial, nada supérfluo
2. **Velocidade** - Ferramentas em Rust/C++/Go otimizadas
3. **Teclado 60%** - Todos os atalhos sem setas/Page/Home/End
4. **TUI First** - Preferência por aplicações terminal
5. **Vim Motions** - hjkl em todo lugar
6. **Elegância** - Tema coeso Gruvbox Material Dark
7. **Produtividade** - Workflow rápido e eficiente
8. **Privacidade** - Ferramentas open-source e focadas em privacidade

## 📚 Referências e Inspirações

- [Vim Motions Everywhere](https://vim.fandom.com/wiki/Tutorial)
- [Gruvbox Theme](https://github.com/morhetz/gruvbox)
- [Modern Unix](https://github.com/ibraheemdev/modern-unix)
- [GNU Stow Guide](https://www.gnu.org/software/stow/)

## 🤝 Contribuindo

Sinta-se livre para fazer fork e adaptar às suas necessidades!

## 📄 Licença

MIT License - use como quiser!

---

**Desenvolvido com ❤️ para um ambiente de desenvolvimento coeso e elegante**
