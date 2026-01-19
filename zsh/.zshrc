# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set theme to Powerlevel10k
ZSH_THEME="powerlevel10k/powerlevel10k"

# Oh My Zsh plugins
plugins=(
  # === Core ===
  git
  sudo
  colored-man-pages
  command-not-found
  extract
  z
  copyfile
  copypath
  jsontools
  encode64
  urltools
  web-search
  
  # === Docker & Containers ===
  docker
  docker-compose
  podman
  
  # === Kubernetes ===
  kubectl
  helm
  minikube
  kind
  istioctl
  
  # === Cloud Providers ===
  aws
  azure
  gcloud
  terraform
  
  # === Infrastructure as Code ===
  ansible
  vagrant
  packer
  
  # === Security & Secrets ===
  vault
  ssh-agent
  gpg-agent
  
  # === CI/CD ===
  github
  gitignore
  
  # === Languages & Tools ===
  node
  npm
  yarn
  python
  pip
  golang
  rust
  
  # === System ===
  systemd
  tmux
  screen
  
  # === Custom Plugins (instalar separadamente) ===
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Gruvbox Material Dark colors for terminal
export TERM="xterm-256color"

# Preferred editor
export EDITOR='nvim'
export VISUAL='nvim'

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ═══════════════════════════════════════════════════════════════════════════
# Vi Mode (Teclado 60% - Vim Navigation)
# ═══════════════════════════════════════════════════════════════════════════

# Ativar vi mode
bindkey -v

# Reduzir delay ao trocar entre insert e normal mode
export KEYTIMEOUT=1

# Vi mode cursor shape (underline no insert, block no normal)
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'  # Block cursor
  elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'  # Beam cursor
  fi
}
zle -N zle-keymap-select

# Iniciar com beam cursor
zle-line-init() {
    echo -ne "\e[5 q"
}
zle -N zle-line-init

# Beam cursor ao sair
echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' ;}

# Vi mode navigation hjkl
bindkey -M vicmd 'h' vi-backward-char
bindkey -M vicmd 'j' vi-down-line-or-history
bindkey -M vicmd 'k' vi-up-line-or-history
bindkey -M vicmd 'l' vi-forward-char

# Beginning/End of line (Vim style)
bindkey -M vicmd '0' vi-beginning-of-line
bindkey -M vicmd '$' vi-end-of-line
bindkey -M vicmd '^' vi-first-non-blank
bindkey -M vicmd 'g' beginning-of-line
bindkey -M vicmd 'G' end-of-line

# Word navigation (Vim style)
bindkey -M vicmd 'w' vi-forward-word
bindkey -M vicmd 'b' vi-backward-word
bindkey -M vicmd 'e' vi-forward-word-end

# Undo/Redo
bindkey -M vicmd 'u' undo
bindkey -M vicmd '^R' redo

# Yank to system clipboard (requires xclip or wl-clipboard)
vi-yank-xclip() {
    zle vi-yank
    echo -n "$CUTBUFFER" | xclip -selection clipboard 2>/dev/null || echo -n "$CUTBUFFER" | wl-copy 2>/dev/null
}
zle -N vi-yank-xclip
bindkey -M vicmd 'y' vi-yank-xclip

# Insert mode keybindings (Emacs style para conveniência)
bindkey -M viins '^A' beginning-of-line
bindkey -M viins '^E' end-of-line
bindkey -M viins '^K' kill-line
bindkey -M viins '^U' backward-kill-line
bindkey -M viins '^W' backward-kill-word
bindkey -M viins '^Y' yank
bindkey -M viins '^P' up-line-or-history
bindkey -M viins '^N' down-line-or-history

# Ctrl+R para busca reversa (funciona nos dois modos)
bindkey -M viins '^R' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-backward
bindkey -M vicmd '?' history-incremental-search-forward

# ESC ou jk para sair do insert mode
bindkey -M viins 'jk' vi-cmd-mode
bindkey -M viins 'kj' vi-cmd-mode

# Backspace e Delete funcionando corretamente
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^H' backward-delete-char
bindkey -M vicmd 'x' vi-delete-char
bindkey -M vicmd 'X' vi-backward-delete-char

# Edit command line in $EDITOR (Vim style: v no normal mode)
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line

# ═══════════════════════════════════════════════════════════════════════════
# Modern CLI Tools - Aliases
# ═══════════════════════════════════════════════════════════════════════════

# eza (modern ls)
if command -v eza &> /dev/null; then
  alias ls='eza --icons --group-directories-first'
  alias la='eza --icons --group-directories-first --all'
  alias ll='eza --icons --group-directories-first --long --header --git'
  alias lla='eza --icons --group-directories-first --long --header --git --all'
  alias lt='eza --icons --group-directories-first --tree --level=2'
  alias lta='eza --icons --group-directories-first --tree --level=2 --all'
fi

# bat (modern cat)
if command -v bat &> /dev/null; then
  alias cat='bat --style=auto'
  alias ccat='/usr/bin/cat'  # original cat
  export BAT_THEME="gruvbox-dark"
fi

# Modern find and grep
alias fd='fd --hidden --follow'
alias rg='rg --hidden --follow --smart-case'

# Git aliases (complementando git plugin do OMZ)
alias lg='lazygit'
alias gst='git status'
alias gco='git checkout'
alias gcm='git commit -m'
alias gp='git push'
alias gl='git pull'
alias glog='git log --oneline --graph --decorate --all'
alias gdiff='git diff'
alias gstash='git stash'

# Docker aliases
alias lzd='lazydocker'
alias dps='docker ps'
alias dpa='docker ps -a'
alias di='docker images'
alias dex='docker exec -it'
alias dlog='docker logs -f'
alias dstop='docker stop $(docker ps -q)'
alias drm='docker rm $(docker ps -aq)'
alias drmi='docker rmi $(docker images -q)'
alias dprune='docker system prune -af'

# Docker Compose
alias dc='docker-compose'
alias dcu='docker-compose up -d'
alias dcd='docker-compose down'
alias dcl='docker-compose logs -f'
alias dcr='docker-compose restart'
alias dcb='docker-compose build'

# Kubernetes
alias k='kubectl'
alias kgp='kubectl get pods'
alias kgs='kubectl get services'
alias kgd='kubectl get deployments'
alias kgn='kubectl get nodes'
alias kdp='kubectl describe pod'
alias kds='kubectl describe service'
alias kdd='kubectl describe deployment'
alias kl='kubectl logs -f'
alias kex='kubectl exec -it'
alias kctx='kubectx'
alias kns='kubens'
alias k9='k9s'

# Helm
alias h='helm'
alias hls='helm list'
alias hi='helm install'
alias hu='helm upgrade'
alias hd='helm delete'

# Terraform
alias tf='terraform'
alias tfi='terraform init'
alias tfp='terraform plan'
alias tfa='terraform apply'
alias tfd='terraform destroy'
alias tfv='terraform validate'
alias tff='terraform fmt'
alias tfw='terraform workspace'

# Ansible
alias ap='ansible-playbook'
alias av='ansible-vault'
alias ag='ansible-galaxy'

# System monitoring
alias top='btop'
alias htop='btop'

# Neovim
alias v='nvim'
alias vim='nvim'
alias vi='nvim'

# File manager
alias fm='yazi'

# ═══════════════════════════════════════════════════════════════════════════
# DevOps Specific Aliases
# ═══════════════════════════════════════════════════════════════════════════

# AWS CLI
alias awsp='export AWS_PROFILE=$(aws configure list-profiles | fzf)'
alias awsl='aws configure list-profiles'

# Azure CLI
alias azl='az login'
alias azls='az account list -o table'
alias azs='az account set --subscription'

# GCloud
alias gcl='gcloud config list'
alias gcp='gcloud config set project'
alias gca='gcloud config set account'

# SSH
alias sshconfig='$EDITOR ~/.ssh/config'
alias sshkey='cat ~/.ssh/id_rsa.pub | xclip -selection clipboard'

# Systemd
alias sc='systemctl'
alias scu='systemctl --user'
alias jc='journalctl'
alias jcf='journalctl -f'

# ═══════════════════════════════════════════════════════════════════════════
# Modern Tools Integration
# ═══════════════════════════════════════════════════════════════════════════

# Zoxide (smart cd)
if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
  alias cd='z'
  alias cdi='zi'  # interactive
fi

# FZF (fuzzy finder)
if command -v fzf &> /dev/null; then
  source /usr/share/fzf/shell/key-bindings.zsh 2>/dev/null || true
  export FZF_DEFAULT_OPTS="
    --color=bg+:#3c3836,bg:#282828,spinner:#fb4934,hl:#928374
    --color=fg:#ebdbb2,header:#928374,info:#8ec07c,pointer:#fb4934
    --color=marker:#fb4934,fg+:#ebdbb2,prompt:#fb4934,hl+:#fb4934
    --height 40% --layout=reverse --border --inline-info
  "
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

# Direnv (per-directory environment variables)
if command -v direnv &> /dev/null; then
  eval "$(direnv hook zsh)"
fi

# ═══════════════════════════════════════════════════════════════════════════
# Development Environment
# ═══════════════════════════════════════════════════════════════════════════

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Rust/Cargo
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# Go
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# Python
export PATH="$HOME/.local/bin:$PATH"

# Kubernetes
export KUBECONFIG="$HOME/.kube/config"
export KUBE_EDITOR="nvim"

# Terraform
export TF_CLI_ARGS_plan="-compact-warnings"
export TF_CLI_ARGS_apply="-compact-warnings"

# Ansible
export ANSIBLE_NOCOWS=1
export ANSIBLE_HOST_KEY_CHECKING=False

# Docker
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1

# ═══════════════════════════════════════════════════════════════════════════
# Functions
# ═══════════════════════════════════════════════════════════════════════════

# Create directory and cd into it
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Extract any archive
extract() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1     ;;
      *.tar.gz)    tar xzf $1     ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar e $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xf $1      ;;
      *.tbz2)      tar xjf $1     ;;
      *.tgz)       tar xzf $1     ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)     echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Quick file search
qf() {
  find . -name "*$1*"
}

# Quick content search
qc() {
  rg "$1" .
}

# Git quick commit and push
gcp() {
  git add .
  git commit -m "$1"
  git push
}

# ═══════════════════════════════════════════════════════════════════════════
# DevOps Functions
# ═══════════════════════════════════════════════════════════════════════════

# Docker - Remove all stopped containers
docker-clean() {
  docker rm $(docker ps -aq -f status=exited)
}

# Docker - Get container IP
docker-ip() {
  docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "$1"
}

# Docker - Shell into container
dsh() {
  docker exec -it "$1" /bin/bash || docker exec -it "$1" /bin/sh
}

# Kubernetes - Quick context switch with fzf
kctx-fzf() {
  kubectl config use-context $(kubectl config get-contexts -o name | fzf)
}

# Kubernetes - Quick namespace switch with fzf
kns-fzf() {
  kubectl config set-context --current --namespace=$(kubectl get ns -o name | cut -d/ -f2 | fzf)
}

# Kubernetes - Get pod logs with fzf
klogs() {
  local pod=$(kubectl get pods -o name | fzf)
  if [ -n "$pod" ]; then
    kubectl logs -f $pod
  fi
}

# Kubernetes - Exec into pod with fzf
kexec() {
  local pod=$(kubectl get pods -o name | fzf | cut -d/ -f2)
  if [ -n "$pod" ]; then
    kubectl exec -it $pod -- /bin/bash || kubectl exec -it $pod -- /bin/sh
  fi
}

# Kubernetes - Port forward with fzf
kpf() {
  local pod=$(kubectl get pods -o name | fzf | cut -d/ -f2)
  if [ -n "$pod" ]; then
    echo "Port forward from pod $pod"
    read "local_port?Local port: "
    read "remote_port?Remote port: "
    kubectl port-forward $pod $local_port:$remote_port
  fi
}

# Terraform - Quick workspace operations
tfw-list() {
  terraform workspace list
}

tfw-new() {
  terraform workspace new "$1"
}

tfw-select() {
  terraform workspace select "$1"
}

# AWS - Get current profile and region
aws-info() {
  echo "Profile: ${AWS_PROFILE:-default}"
  echo "Region: $(aws configure get region)"
  echo "Account: $(aws sts get-caller-identity --query Account --output text 2>/dev/null || echo 'Not logged in')"
}

# AWS - List EC2 instances
aws-ec2() {
  aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId,State.Name,InstanceType,Tags[?Key==`Name`].Value|[0]]' --output table
}

# SSH - Quick connect with fzf
ssh-fzf() {
  local host=$(grep "^Host " ~/.ssh/config | awk '{print $2}' | fzf)
  if [ -n "$host" ]; then
    ssh "$host"
  fi
}

# Port check
port-check() {
  lsof -i :"$1" || ss -tulpn | grep ":$1"
}

# Find process using port
port-kill() {
  kill -9 $(lsof -t -i:"$1")
}

# Quick HTTP server
serve() {
  local port="${1:-8000}"
  python3 -m http.server "$port"
}

# Generate random password
genpass() {
  local length="${1:-20}"
  openssl rand -base64 "$length"
}

# Base64 encode/decode shortcuts
b64e() {
  echo -n "$1" | base64
}

b64d() {
  echo -n "$1" | base64 -d
}

# JSON pretty print
json() {
  if [ -t 0 ]; then
    # Argument provided
    echo "$1" | jq .
  else
    # Piped input
    jq .
  fi
}

# ═══════════════════════════════════════════════════════════════════════════
# Powerlevel10k Configuration
# ═══════════════════════════════════════════════════════════════════════════

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
