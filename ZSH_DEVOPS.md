# Zsh + Oh My Zsh - Guia Completo para DevOps

## 📦 Plugins Instalados

### Core & Essenciais
- **git** - Aliases e funções para Git
- **sudo** - Pressione ESC 2x para adicionar sudo ao comando anterior
- **colored-man-pages** - Man pages coloridas
- **command-not-found** - Sugere pacotes quando comando não é encontrado
- **extract** - Função universal para extrair arquivos
- **z** - Jump rápido para diretórios frequentes
- **copyfile** - Copia conteúdo de arquivo para clipboard
- **copypath** - Copia path para clipboard
- **jsontools** - Ferramentas para JSON (pp_json, is_json, etc.)
- **encode64** - Encode/decode base64
- **urltools** - Encode/decode URLs
- **web-search** - Busca direto no terminal (google, stackoverflow, etc.)

### Docker & Containers
- **docker** - Completions e aliases para Docker
- **docker-compose** - Completions para docker-compose
- **podman** - Suporte para Podman

### Kubernetes
- **kubectl** - Completions e aliases (k, kgp, kgs, etc.)
- **helm** - Completions para Helm
- **minikube** - Completions para Minikube
- **kind** - Completions para Kind
- **istioctl** - Completions para Istio

### Cloud Providers
- **aws** - Completions para AWS CLI
- **azure** - Completions para Azure CLI
- **gcloud** - Completions para Google Cloud SDK
- **terraform** - Completions para Terraform

### Infrastructure as Code
- **ansible** - Completions para Ansible
- **vagrant** - Completions para Vagrant
- **packer** - Completions para Packer

### Security & Secrets
- **vault** - Completions para HashiCorp Vault
- **ssh-agent** - Gerenciamento automático do ssh-agent
- **gpg-agent** - Gerenciamento automático do gpg-agent

### CI/CD
- **github** - Aliases para GitHub CLI
- **gitignore** - Gera .gitignore para linguagens

### Languages & Tools
- **node**, **npm**, **yarn** - Completions para Node.js
- **python**, **pip** - Completions para Python
- **golang** - Completions para Go
- **rust** - Completions para Rust/Cargo

### System
- **systemd** - Aliases para systemctl
- **tmux** - Completions para tmux
- **screen** - Completions para screen

### Custom Plugins
- **zsh-autosuggestions** - Sugestões baseadas no histórico
- **zsh-syntax-highlighting** - Syntax highlighting em tempo real

## 🔥 Aliases DevOps

### Docker
```bash
lzd              # Lazydocker
dps              # docker ps
dpa              # docker ps -a
di               # docker images
dex <container>  # docker exec -it
dlog <container> # docker logs -f
dstop            # Para todos containers
drm              # Remove todos containers
drmi             # Remove todas imagens
dprune           # docker system prune -af

# Docker Compose
dc               # docker-compose
dcu              # docker-compose up -d
dcd              # docker-compose down
dcl              # docker-compose logs -f
dcr              # docker-compose restart
dcb              # docker-compose build
```

### Kubernetes
```bash
k                # kubectl
kgp              # kubectl get pods
kgs              # kubectl get services
kgd              # kubectl get deployments
kgn              # kubectl get nodes
kdp              # kubectl describe pod
kds              # kubectl describe service
kdd              # kubectl describe deployment
kl               # kubectl logs -f
kex              # kubectl exec -it
kctx             # kubectx (trocar contexto)
kns              # kubens (trocar namespace)
k9               # k9s (TUI)

# Helm
h                # helm
hls              # helm list
hi               # helm install
hu               # helm upgrade
hd               # helm delete
```

### Terraform
```bash
tf               # terraform
tfi              # terraform init
tfp              # terraform plan
tfa              # terraform apply
tfd              # terraform destroy
tfv              # terraform validate
tff              # terraform fmt
tfw              # terraform workspace
```

### Ansible
```bash
ap               # ansible-playbook
av               # ansible-vault
ag               # ansible-galaxy
```

### AWS
```bash
awsp             # Trocar profile com fzf
awsl             # Listar profiles
```

### Azure
```bash
azl              # az login
azls             # Listar subscriptions
azs              # Trocar subscription
```

### GCloud
```bash
gcl              # gcloud config list
gcp              # gcloud config set project
gca              # gcloud config set account
```

### Systemd
```bash
sc               # systemctl
scu              # systemctl --user
jc               # journalctl
jcf              # journalctl -f
```

## 🚀 Funções DevOps Customizadas

### Docker
```bash
docker-clean         # Remove containers parados
docker-ip <name>     # Mostra IP do container
dsh <container>      # Shell no container (bash ou sh)
```

### Kubernetes
```bash
kctx-fzf            # Trocar contexto com fzf
kns-fzf             # Trocar namespace com fzf
klogs               # Ver logs de pod (seleção fzf)
kexec               # Exec em pod (seleção fzf)
kpf                 # Port forward de pod (seleção fzf)
```

### Terraform
```bash
tfw-list            # Listar workspaces
tfw-new <name>      # Criar workspace
tfw-select <name>   # Selecionar workspace
```

### AWS
```bash
aws-info            # Info do profile/região/conta atual
aws-ec2             # Listar instâncias EC2
```

### Utilitários
```bash
ssh-fzf             # SSH com seleção fzf
port-check <port>   # Verificar o que usa a porta
port-kill <port>    # Matar processo na porta
serve [port]        # HTTP server (padrão: 8000)
genpass [length]    # Gerar senha aleatória
b64e <text>         # Base64 encode
b64d <text>         # Base64 decode
json <text>         # Pretty print JSON
```

## 🌐 Variáveis de Ambiente DevOps

### Kubernetes
```bash
KUBECONFIG="$HOME/.kube/config"
KUBE_EDITOR="nvim"
```

### Terraform
```bash
TF_CLI_ARGS_plan="-compact-warnings"
TF_CLI_ARGS_apply="-compact-warnings"
```

### Ansible
```bash
ANSIBLE_NOCOWS=1
ANSIBLE_HOST_KEY_CHECKING=False
```

### Docker
```bash
DOCKER_BUILDKIT=1
COMPOSE_DOCKER_CLI_BUILD=1
```

## 📚 Dicas de Uso

### Git com Plugin OMZ
O plugin git do OMZ já fornece muitos aliases:
```bash
gst    # git status
gco    # git checkout
gcb    # git checkout -b
gp     # git push
gl     # git pull
glog   # git log --oneline --graph
gd     # git diff
ga     # git add
gc     # git commit -v
gca    # git commit -v -a
```

### Docker Compose
```bash
# Subir stack
dcu

# Ver logs
dcl

# Rebuild e restart
dcb && dcr
```

### Kubernetes Workflow
```bash
# Trocar contexto
kctx-fzf

# Trocar namespace
kns-fzf

# Ver pods
kgp

# Ver logs
klogs  # com fzf

# Exec no pod
kexec  # com fzf
```

### Terraform Workflow
```bash
# Init e workspace
tfi
tfw-new dev
tfw-select dev

# Plan e Apply
tfp
tfa

# Ou com auto-approve
tfa -auto-approve
```

### FZF Integration
Muitas funções usam FZF para seleção interativa:
- `kctx-fzf` - Contextos Kubernetes
- `kns-fzf` - Namespaces
- `klogs` - Pods para logs
- `kexec` - Pods para exec
- `ssh-fzf` - Hosts SSH
- `awsp` - AWS profiles

## 🔧 Completions Inteligentes

Os plugins do OMZ fornecem completions para:
- Comandos e subcomandos
- Flags e opções
- Recursos (pods, services, etc.)
- Arquivos e paths contextuais

Pressione `TAB` para autocompletar!

## 🎨 Integração com Ferramentas

### jq (JSON)
```bash
# Via plugin jsontools
cat file.json | pp_json
echo '{"test":1}' | is_json && echo "válido"
```

### Base64
```bash
# Via plugin encode64
echo "teste" | e64
echo "dGVzdGU=" | d64
```

### Web Search
```bash
# Busca direto no terminal
google "docker kubernetes"
stackoverflow "zsh autocomplete"
github "terraform modules"
```

---

**Tudo configurado para um ambiente DevOps completo e produtivo!** 🚀
