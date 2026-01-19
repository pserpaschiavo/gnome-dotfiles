# Cloud Providers CLI - Instalação Manual

Os plugins de Cloud Providers (aws, azure, gcloud) estão **habilitados no .zshrc**, mas as ferramentas CLI **não** são instaladas automaticamente pelo `install-packages.sh`.

## Por que não instalar automaticamente?

- Ocupam bastante espaço
- Nem todo mundo usa todas as clouds
- Requerem configuração adicional (credenciais)
- Você pode não precisar delas imediatamente

## 📦 Instalação Manual (quando necessário)

### AWS CLI v2

```bash
# Download e instalação
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip"
unzip -q /tmp/awscliv2.zip -d /tmp
sudo /tmp/aws/install
rm -rf /tmp/aws /tmp/awscliv2.zip

# Verificar
aws --version

# Configurar
aws configure
```

**Aliases disponíveis (após instalação):**
```bash
awsp    # Trocar profile com fzf
awsl    # Listar profiles
```

**Funções disponíveis:**
```bash
aws-info    # Info do profile/região/conta
aws-ec2     # Listar instâncias EC2
```

### Azure CLI

```bash
# Fedora
sudo dnf install azure-cli

# Verificar
az version

# Login
az login
```

**Aliases disponíveis:**
```bash
azl     # az login
azls    # Listar subscriptions
azs     # Trocar subscription
```

### Google Cloud SDK

```bash
# Fedora - Adicionar repositório
sudo tee -a /etc/yum.repos.d/google-cloud-sdk.repo << EOM
[google-cloud-cli]
name=Google Cloud CLI
baseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el8-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=0
gpgkey=https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOM

# Instalar
sudo dnf install google-cloud-cli

# Verificar
gcloud version

# Inicializar
gcloud init
```

**Aliases disponíveis:**
```bash
gcl     # gcloud config list
gcp     # gcloud config set project
gca     # gcloud config set account
```

## 🔧 Plugins Oh My Zsh

Os plugins já estão **habilitados** no `.zshrc`:
```bash
plugins=(
  ...
  aws      # Completions para AWS CLI
  azure    # Completions para Azure CLI
  gcloud   # Completions para Google Cloud SDK
  ...
)
```

Eles fornecem:
- ✅ Auto-completions inteligentes
- ✅ Aliases úteis
- ✅ Suporte a múltiplos profiles/contas

**Mas só funcionam se as CLIs estiverem instaladas!**

## 📝 Quando Instalar?

Instale apenas quando for realmente usar:

```bash
# Trabalhando com AWS?
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip" && \
unzip -q /tmp/awscliv2.zip -d /tmp && \
sudo /tmp/aws/install && \
rm -rf /tmp/aws /tmp/awscliv2.zip

# Trabalhando com Azure?
sudo dnf install azure-cli

# Trabalhando com GCP?
sudo dnf install google-cloud-cli
```

Depois de instalar, recarregue o shell:
```bash
source ~/.zshrc
```

Os completions e aliases estarão disponíveis automaticamente! 🎉

## 💡 Dica

Se você **nunca** vai usar algum cloud provider, pode remover o plugin do `.zshrc`:

```bash
# Editar ~/.zshrc e remover da lista de plugins:
plugins=(
  ...
  # aws      # <-- comentar ou remover
  # azure    # <-- comentar ou remover
  # gcloud   # <-- comentar ou remover
  ...
)
```

Mas não há problema em deixar habilitado - eles não afetam performance se as CLIs não estiverem instaladas.
