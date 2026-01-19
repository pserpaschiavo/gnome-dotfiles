# Instalação de Plugins Zsh

## ✅ Plugins Built-in (Já Inclusos no Oh My Zsh)

Estes plugins **NÃO precisam de instalação** - já vêm com Oh My Zsh:

### Core & Essenciais
- git, sudo, colored-man-pages, command-not-found
- extract, z, copyfile, copypath
- jsontools, encode64, urltools, web-search

### DevOps
- docker, docker-compose, podman
- kubectl, helm, minikube, kind, istioctl
- aws, azure, gcloud, terraform
- ansible, vagrant, packer
- vault, ssh-agent, gpg-agent

### Development
- github, gitignore
- node, npm, yarn
- python, pip
- golang, rust

### System
- systemd, tmux, screen

**Total: 38 plugins built-in** ✓

## 📥 Plugins que Precisam de Instalação

Apenas **2 plugins customizados** precisam ser instalados manualmente:

### 1. zsh-autosuggestions
Sugestões baseadas no histórico enquanto você digita.

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

### 2. zsh-syntax-highlighting
Syntax highlighting em tempo real dos comandos.

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

## 🚀 Instalação Automática

O script `install-packages.sh` já instala esses 2 plugins automaticamente:

```bash
./install-packages.sh
```

Ele verifica se já estão instalados e só instala se necessário.

## 🔍 Verificar Plugins Instalados

```bash
# Ver plugins built-in disponíveis
ls ~/.oh-my-zsh/plugins/

# Ver plugins customizados instalados
ls ~/.oh-my-zsh/custom/plugins/
```

## ⚠️ Plugins que Requerem Ferramentas Externas

Alguns plugins funcionam apenas se as ferramentas estiverem instaladas:

| Plugin | Requer | Como instalar |
|--------|--------|---------------|
| docker | Docker | `sudo dnf install docker` |
| docker-compose | Docker Compose | Incluído no Docker |
| kubectl | kubectl | `sudo dnf install kubernetes-client` |
| helm | Helm | `curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 \| bash` |
| terraform | Terraform | Via HashiCorp repo (no install-packages.sh) |
| aws | AWS CLI | `curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip"...` |
| azure | Azure CLI | `sudo dnf install azure-cli` |
| gcloud | Google Cloud SDK | https://cloud.google.com/sdk/docs/install |
| ansible | Ansible | `sudo dnf install ansible` |
| vault | HashiCorp Vault | `sudo dnf install vault` |

**Solução:** Execute `./install-packages.sh` que instala todas essas ferramentas! 🎯

## 📋 Checklist de Instalação

- [ ] **Oh My Zsh** instalado
- [ ] **Powerlevel10k** instalado
- [ ] **zsh-autosuggestions** instalado
- [ ] **zsh-syntax-highlighting** instalado
- [ ] **.zshrc** configurado (via stow)
- [ ] **.p10k.zsh** configurado (via stow)
- [ ] Ferramentas DevOps instaladas (opcional)

## 🎯 Instalação Rápida Completa

```bash
# 1. Instalar tudo (Oh My Zsh + plugins + ferramentas)
./install-packages.sh

# 2. Configurar dotfiles com Stow
./setup-stow.sh
# Ou: stow zsh

# 3. Tornar Zsh shell padrão
chsh -s $(which zsh)

# 4. Reiniciar terminal
exec zsh

# 5. Recarregar configuração
source ~/.zshrc
```

## 🔄 Atualizar Plugins

```bash
# Atualizar Oh My Zsh e todos plugins built-in
omz update

# Atualizar plugins customizados
cd ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions && git pull
cd ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting && git pull

# Atualizar Powerlevel10k
cd ~/.oh-my-zsh/custom/themes/powerlevel10k && git pull
```

## 🐛 Troubleshooting

### Plugin não está funcionando?

1. Verifique se está na lista de plugins no `.zshrc`
2. Se for customizado, verifique se está instalado:
   ```bash
   ls ~/.oh-my-zsh/custom/plugins/
   ```
3. Recarregue o shell:
   ```bash
   source ~/.zshrc
   ```

### Comandos não estão autocompletando?

1. Verifique se a ferramenta está instalada:
   ```bash
   which kubectl  # ou docker, terraform, etc.
   ```
2. Reinstale o plugin:
   ```bash
   omz reload
   ```

### Syntax highlighting não funciona?

```bash
# Reinstalar
rm -rf ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
  ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
source ~/.zshrc
```

---

**Resumo:** Apenas 2 plugins precisam instalação manual, e o script `install-packages.sh` faz tudo automaticamente! 🎉
