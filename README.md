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
- **[Spotatui](https://github.com/ayn2op/spotatui)** - Spotify TUI com streaming nativo (opcional)
- **[ytui-music](https://github.com/sudipghimire533/ytui-music)** - YouTube Music TUI (opcional) - [Guia completo](YTUI_MUSIC.md)
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

### 2. Validar instalação (opcional mas recomendado)

```bash
chmod +x quick-validate.sh
./quick-validate.sh
```

Este script verifica:
- ✅ Sintaxe de todos os scripts
- ✅ Dependências críticas (curl, git, sudo)
- ✅ Estrutura de dotfiles
- ✅ Aplicações já instaladas

### 3. Instale as aplicações

**Modo Básico (Fedora/RHEL):**
```bash
./install-packages.sh
```

**Modo Básico (Ubuntu/Debian):**
```bash
./install-packages-ubuntu.sh
```

**Opções Avançadas:**

```bash
# Testar sem instalar (dry-run)
./install-packages.sh --dry-run --yes

# Modo debug (mostra cada comando)
./install-packages.sh --debug --yes

# Instalação automatizada (CI/CD)
./install-packages.sh --yes

# Mostrar ajuda
./install-packages.sh --help
```

**Opções disponíveis:**
- `--dry-run` - Simula instalação sem fazer mudanças
- `--debug` - Ativa modo debug (set -x)
- `--yes, -y` - Responde 'sim' automaticamente
- `--help, -h` - Mostra ajuda

**Log de instalação:** `~/.dotfiles-install.log`

Estes scripts instalarão:
- Pacotes via DNF/APT
- Aplicações via Cargo (Rust)
- Lazydocker via script oficial
- Opcionalmente K9s, Vault, Packer
- Oh My Zsh + Powerlevel10k
- Plugins Zsh (40+ para DevOps)

### 4. Configure os dotfiles com Stow

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

## 🔧 Troubleshooting

### Script de instalação falhou

```bash
# Ver log completo
cat ~/.dotfiles-install.log

# Executar em modo debug
./install-packages.sh --debug --dry-run

# Validar sintaxe
bash -n install-packages.sh
```

### Pacote específico falhou

Muitos pacotes são opcionais. Se um falhar:
1. Verifique o log em `~/.dotfiles-install.log`
2. Instale manualmente: `sudo dnf install <pacote>` ou `cargo install <pacote>`
3. Continue com os próximos passos

### Ghostty não disponível (Ubuntu)

Ghostty não está nos repositórios do Ubuntu. Opções:
1. Compilar do source: https://ghostty.org
2. Usar outro terminal: Alacritty, Kitty, WezTerm

### Plugins Zsh não funcionam

```bash
# Recarregar Zsh
source ~/.zshrc

# Verificar se Oh My Zsh está instalado
ls -la ~/.oh-my-zsh

# Reinstalar plugins
cd ~/.oh-my-zsh/custom/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting
```

### Atalhos do GNOME não funcionam

```bash
# Executar novamente
./setup-gnome-keys.sh

# Verificar conflitos
gsettings list-keys org.gnome.desktop.wm.keybindings
gsettings list-keys org.gnome.shell.keybindings
```

### Stow conflita com arquivos existentes

```bash
# Fazer backup
mkdir -p ~/dotfiles-backup
mv ~/.zshrc ~/dotfiles-backup/
mv ~/.config/nvim ~/dotfiles-backup/

# Tentar novamente
stow zsh nvim
```

### Cargo/Rust não instalado

```bash
# Fedora
sudo dnf install rust cargo

# Ubuntu
sudo apt install cargo

# Via rustup (recomendado)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

### Go não instalado (para discordo)

```bash
# Fedora
sudo dnf install golang

# Ubuntu
sudo apt install golang-go
```

### Temas não aparecem corretos

1. Verifique se as fontes Nerd estão instaladas
2. Configure o terminal para usar a fonte correta
3. Recarregue as configurações
4. Execute `p10k configure` para reconfigurar Powerlevel10k

### ytui-music não funciona

Veja o guia completo de troubleshooting em [YTUI_MUSIC.md](YTUI_MUSIC.md). Problemas comuns:
- **mpv não encontrado**: Instale `mpv` e `libmpv-dev`
- **yt-dlp não encontrado**: Instale `yt-dlp` via pip ou package manager
- **Erro ao compilar**: Certifique-se que `mpv-devel` (Fedora) ou `libmpv-dev` (Ubuntu) está instalado

Para mais detalhes, veja:
- [VALIDATION.md](VALIDATION.md) - Validação e debug detalhado
- [YTUI_MUSIC.md](YTUI_MUSIC.md) - Guia completo ytui-music
- [ZSH_INSTALL.md](ZSH_INSTALL.md) - Problemas com Zsh/Oh My Zsh
- [CLOUD_CLI_INSTALL.md](CLOUD_CLI_INSTALL.md) - Instalação de CLIs de cloud

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
