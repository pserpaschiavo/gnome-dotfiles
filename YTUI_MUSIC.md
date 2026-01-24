# 🎵 ytui-music - YouTube Music TUI

> **⚠️ IMPORTANTE: Projeto Incompatível com Rust Moderno**
>
> **Status:** Removido dos scripts de instalação (Janeiro 2026)
>
> O ytui-music **não compila** com versões recentes do Rust (1.70+) devido a:
> - Uso de `dangerous_implicit_autorefs` (erro de compilação)
> - Código não mantido desde 2022
> - Dependências desatualizadas (ratatui, crossterm)
>
> **Última tentativa de compilação:** Falhou com Rust 1.92.0 (Fedora 43)

## Sobre

ytui-music é um cliente TUI (Terminal User Interface) para ouvir música do YouTube diretamente no terminal.

**NOTA:** Este projeto não é mais mantido e não funciona com toolchains Rust atuais.

## ❌ Status de Remoção

Este aplicativo foi **removido dos scripts de instalação** devido aos seguintes problemas:

### Erros de Compilação (Rust 1.92.0)

```
error: implicit autoref creates a reference to the dereference of a raw pointer
   --> front-end/src/ui/mod.rs:218:40
    |
218 |                     music_state = &mut (*state_ptr).musicbar.1;
    |                                        ^^---------^^^^^^^^^^
```

**3 erros críticos** no código que impedem compilação com Rust moderno (1.70+).

### Por Que Não Funciona

1. **Lint `dangerous_implicit_autorefs`**: Ativado por padrão desde Rust 1.70
2. **Código não atualizado**: Último commit em 2022
3. **Dependências obsoletas**: ratatui 0.22 (atual: 0.29+)
4. **Projeto abandonado**: Sem manutenção ativa

## 🔄 Alternativas Recomendadas

### 1. MPV + yt-dlp (Linha de Comando)
```bash
# Instalar
sudo dnf install mpv yt-dlp  # Fedora
sudo apt install mpv yt-dlp  # Ubuntu

# Usar
mpv "ytsearch:nome da música"
mpv --shuffle --playlist="https://www.youtube.com/playlist?list=..."
```

### 2. Spotify TUI (Para Spotify)
```bash
cargo install spotatui
```
✅ **Já incluído nos scripts de instalação**

### 3. MPD + ncmpcpp (Música Local)
```bash
sudo dnf install mpd ncmpcpp
```

### 4. Instalação Manual (Avançado - Rust Antigo)

**⚠️ Apenas para usuários experientes**

```bash
# Instalar Rust 1.70 (compatível)
rustup install 1.70.0

# Clonar e compilar
cd /tmp
git clone https://github.com/sudipghimire533/ytui-music
cd ytui-music
git submodule update --init --recursive
rustup override set 1.70.0
MPV_BUILD=mpv-build/ MPV_SOURCE=mpv-build/mpv/ cargo build --all --release --features build_libmpv

# Instalar
sudo install -m 755 target/release/ytui_music /usr/local/bin/
```

**Desvantagens:**
- Manter toolchain Rust antiga separadamente
- Sem atualizações de segurança
- Pode quebrar com updates do sistema

---

## 📚 Documentação Original (Referência)

<details>
<summary>Clique para expandir documentação antiga</summary>

## ✅ Correções Implementadas (OBSOLETO)

A instalação do ytui-music agora está **completamente automatizada** nos scripts de instalação, incluindo:

### Dependências Instaladas Automaticamente:

#### Fedora/RHEL:
- **mpv** - Player de mídia
- **mpv-devel** - Biblioteca de desenvolvimento libmpv
- **yt-dlp** - Downloader de vídeos do YouTube (substituto moderno do youtube-dl)

#### Ubuntu/Debian:
- **mpv** - Player de mídia
- **libmpv1** - Biblioteca MPV runtime
- **libmpv-dev** - Biblioteca de desenvolvimento MPV
- **yt-dlp** - Downloader de vídeos do YouTube

### Build Especial

O ytui-music requer compilação com feature especial devido à dependência `libmpv`:

```bash
git clone https://github.com/sudipghimire533/ytui-music
cd ytui-music
git submodule init
MPV_BUILD=mpv-build/ cargo build --all --release --features build_libmpv
```

O script agora faz isso **automaticamente**!

## 🚀 Instalação

### Via Script de Instalação (Recomendado)

```bash
./install-packages.sh        # Fedora/RHEL
# OU
./install-packages-ubuntu.sh # Ubuntu/Debian
```

Quando perguntado:
```
Instalar aplicações TUI extras via Cargo? (y/N):
```

Responda **y** e o ytui-music será instalado automaticamente com todas as dependências.

### Instalação Manual (se necessário)

#### 1. Instalar dependências

**Fedora:**
```bash
sudo dnf install -y mpv mpv-devel
pip3 install --user yt-dlp
```

**Ubuntu:**
```bash
sudo apt install -y mpv libmpv1 libmpv-dev
pip3 install --user yt-dlp
```

#### 2. Compilar ytui-music

```bash
git clone https://github.com/sudipghimire533/ytui-music
cd ytui-music
git submodule init
MPV_BUILD=mpv-build/ cargo build --all --release --features build_libmpv
sudo install -m 755 target/release/ytui_music /usr/local/bin/
```

## 📝 Uso

### Executar ytui-music
```bash
ytui_music run
```

### Atalho GNOME
**Super + Ctrl + M** - Abre ytui-music (configurado em setup-gnome-keys.sh)

### Comandos Principais

```bash
ytui_music help              # Ajuda
ytui_music info shortcuts    # Ver atalhos configurados
ytui_music info version      # Ver versão
```

## 🎹 Atalhos no App

### Busca
- **`/`** - Abrir caixa de busca
- Digitar:
  - `music:Nome da música` - Buscar apenas músicas
  - `playlist:Nome` - Buscar apenas playlists
  - `artist:Nome do artista` - Buscar apenas artistas
  - `Qualquer texto` - Buscar tudo
- **`Enter`** - Executar busca

### Navegação
- **`←` ou `Backspace`** - Voltar
- **`→` ou `Tab`** - Avançar (entre Sidebar, Musicbar, Playlistbar, Artistbar)
- **`↑` / `↓`** - Mover na lista
- **`Enter`** - Selecionar item

### Controle de Reprodução
- **`Space`** - Pausar/Continuar
- **`s`** - Toggle shuffle
- **`r`** - Repetir (single/all)
- **`>` / `<`** - Avançar/Voltar na música
- **`Ctrl+n`** - Próxima faixa
- **`Ctrl+p`** - Faixa anterior

### Download
1. Destacar o item desejado
2. **`Ctrl+d`** - Baixar seleção

### Favoritos
- **`f`** - Adicionar aos favoritos
- **`u`** - Remover dos favoritos
- Músicas favoritas aparecem em **"Liked"**
- Playlists favoritas em **"My playlist"**
- Artistas favoritos em **"Following"**

### Sair
- **`Ctrl+c`** - Sair
- **`Ctrl+Alt+c`** - Forçar saída (se download em andamento)

## 📂 Configuração

ytui-music salva configurações em:

- **Linux**: `~/.config/ytui-music/`
- **macOS**: `~/Library/Application Support/ytui-music/`
- **Windows**: `C:\Users\<username>\AppData\Roaming\ytui-music\`

## 🐛 Troubleshooting

### ytui_music não encontrado após instalação

Verifique se `/usr/local/bin` está no PATH:
```bash
echo $PATH | grep /usr/local/bin
```

Se não estiver, adicione ao `~/.zshrc` ou `~/.bashrc`:
```bash
export PATH="/usr/local/bin:$PATH"
```

### Erro: "mpv not found"

Reinstale mpv:
```bash
# Fedora
sudo dnf install mpv mpv-devel

# Ubuntu
sudo apt install mpv libmpv1 libmpv-dev
```

### Erro: "yt-dlp not found"

Instale yt-dlp:
```bash
pip3 install --user yt-dlp

# Ou via package manager
sudo dnf install yt-dlp  # Fedora
sudo apt install yt-dlp  # Ubuntu
```

Certifique-se que `~/.local/bin` está no PATH:
```bash
export PATH="$HOME/.local/bin:$PATH"
```

### Erro ao compilar: "libmpv not found"

Certifique-se que mpv-devel (Fedora) ou libmpv-dev (Ubuntu) está instalado:
```bash
# Fedora
sudo dnf install mpv-devel

# Ubuntu
sudo apt install libmpv-dev
```

### Vídeos não reproduzem

1. Verifique se mpv funciona standalone:
```bash
mpv https://www.youtube.com/watch?v=dQw4w9WgXcQ
```

2. Atualize yt-dlp:
```bash
pip3 install --upgrade yt-dlp
```

3. Limpe cache do yt-dlp:
```bash
yt-dlp --rm-cache-dir
```

## 🔗 Links Úteis

- **Repositório**: https://github.com/sudipghimire533/ytui-music
- **MPV**: https://mpv.io
- **yt-dlp**: https://github.com/yt-dlp/yt-dlp

## 📸 Screenshots

O ytui-music tem uma interface elegante com:
- Tela de busca responsiva
- Visualização de informações da música
- Barra de progresso
- Lista de favoritos
- Gerenciamento de playlists

Veja screenshots no [README do projeto](https://github.com/sudipghimire533/ytui-music#screenshots).

## ⚠️ Observações

1. **Compilação lenta**: A primeira compilação pode levar vários minutos pois precisa compilar libmpv
2. **Espaço em disco**: Requer ~500MB-1GB temporariamente para build
3. **Internet necessária**: Para buscar e reproduzir música do YouTube
4. **youtube-dl vs yt-dlp**: Usamos yt-dlp por ser mais mantido e ter melhor suporte

## 🎯 Histórico de Integração

ytui-music estava totalmente integrado até Janeiro/2026:
- ✅ Instalação automatizada
- ✅ Atalho GNOME configurado (Super+Ctrl+M)
- ✅ Todas dependências incluídas
- ✅ Build otimizado com feature build_libmpv
- ✅ Logging completo durante instalação
- ✅ Suporte a dry-run para testes

**Removido devido a incompatibilidade com Rust 1.70+**

</details>

---

## 📝 Conclusão

O ytui-music foi **removido permanentemente** dos scripts de instalação automática devido a incompatibilidade com versões modernas do Rust e falta de manutenção do projeto.

**Recomendação:** Use `mpv` + `yt-dlp` diretamente ou `spotatui` para streaming de música no terminal.
