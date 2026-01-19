# Lista de Extensões Gnome Shell para um ambiente coeso e elegante

## 🎯 Instalação

Instale via Extension Manager:
```bash
sudo dnf install gnome-shell-extension-manager
gnome-extensions-app
```

Ou visite: https://extensions.gnome.org/

## ✨ Essenciais (Must-Have)

### 1. Dash to Dock
**ID:** `dash-to-dock@micxgx.gmail.com`  
**Link:** https://extensions.gnome.org/extension/307/dash-to-dock/  
**Por que:** Dock customizável no estilo macOS/Ubuntu, essencial para produtividade  
**Config sugerida:**
- Position: Bottom
- Icon size: 48px
- Intelligent autohide: Yes
- Opacity: 80%

### 2. Blur my Shell
**ID:** `blur-my-shell@aunetx`  
**Link:** https://extensions.gnome.org/extension/3193/blur-my-shell/  
**Por que:** Efeitos de blur elegantes para painel, dash e overview  
**Config sugerida:**
- Panel blur: Yes
- Blur amount: 30
- Customize blur: Yes

### 3. Just Perfection
**ID:** `just-perfection-desktop@just-perfection`  
**Link:** https://extensions.gnome.org/extension/3843/just-perfection/  
**Por que:** Customização fina da interface do Gnome  
**Config sugerida:**
- Hide panel when fullscreen: Yes
- Workspace switcher size: 5%

### 4. AppIndicator and KStatusNotifierItem Support
**ID:** `appindicatorsupport@rgcjonas.gmail.com`  
**Link:** https://extensions.gnome.org/extension/615/appindicator-support/  
**Por que:** Suporte para app indicators na barra superior

## 🚀 Produtividade

### 5. Clipboard Indicator
**ID:** `clipboard-indicator@tudmotu.com`  
**Link:** https://extensions.gnome.org/extension/779/clipboard-indicator/  
**Por que:** Histórico de área de transferência com busca

### 6. Vitals
**ID:** `Vitals@CoreCoding.com`  
**Link:** https://extensions.gnome.org/extension/1460/vitals/  
**Por que:** Monitor de CPU, RAM, rede e temperatura na barra

### 7. Caffeine
**ID:** `caffeine@patapon.info`  
**Link:** https://extensions.gnome.org/extension/517/caffeine/  
**Por que:** Prevenir suspensão automática com um clique

### 8. GSConnect
**ID:** `gsconnect@andyholmes.github.io`  
**Link:** https://extensions.gnome.org/extension/1319/gsconnect/  
**Por que:** Integração completa com Android (KDE Connect)  
**Features:**
- Compartilhar arquivos
- Notificações sincronizadas
- Controlar mídia do celular
- Clipboard compartilhado

## 🎮 Workflow

### 9. Grand Theft Focus
**ID:** `grand-theft-focus@zalckos.github.com`  
**Link:** https://extensions.gnome.org/extension/5410/grand-theft-focus/  
**Por que:** Previne que apps roubem foco automaticamente

### 10. No overview at Start-up
**ID:** `no-overview@fthx`  
**Link:** https://extensions.gnome.org/extension/4099/no-overview/  
**Por que:** Não abrir Overview ao fazer login

### 11. Window Is Ready - Notification Remover
**ID:** `window-is-ready-remover@nunofarruca@gmail.com`  
**Link:** https://extensions.gnome.org/extension/1007/window-is-ready-notification-remover/  
**Por que:** Remove notificação chata de "App está pronto"

## 🎨 Estética (Opcional mas Bonito)

### 12. Compiz alike magic lamp effect
**ID:** `compiz-alike-magic-lamp-effect@hermes83.github.com`  
**Link:** https://extensions.gnome.org/extension/3740/compiz-alike-magic-lamp-effect/  
**Por que:** Efeito nostálgico de minimização estilo Compiz

### 13. Burn My Windows
**ID:** `burn-my-windows@schneegans.github.com`  
**Link:** https://extensions.gnome.org/extension/4679/burn-my-windows/  
**Por que:** Efeitos bonitos ao fechar/abrir janelas  
**Efeitos favoritos:**
- T-Rex Attack
- Energize A
- Glitch

### 14. Desktop Cube
**ID:** `desktop-cube@schneegans.github.com`  
**Link:** https://extensions.gnome.org/extension/4648/desktop-cube/  
**Por que:** Desktop em cubo 3D (nostalgia Compiz)

## 🔧 Utilitários Extras

### 15. Sound Input & Output Device Chooser
**ID:** `sound-output-device-chooser@kgshank.net`  
**Link:** https://extensions.gnome.org/extension/906/sound-output-device-chooser/  
**Por que:** Trocar rapidamente entre dispositivos de áudio

### 16. Removable Drive Menu
**ID:** `drive-menu@gnome-shell-extensions.gcampax.github.com`  
**Link:** Builtin - ativar via `gnome-extensions enable drive-menu@gnome...`  
**Por que:** Acesso rápido a drives USB/externos

### 17. Space Bar
**ID:** `space-bar@luchrioh`  
**Link:** https://extensions.gnome.org/extension/5090/space-bar/  
**Por que:** Mostra workspaces ativos na barra superior

## 📦 Instalação em Batch (via Extension Manager CLI)

```bash
# Instalar Extension Manager CLI
pipx install gnome-extensions-cli

# Instalar todas essenciais
gext install dash-to-dock@micxgx.gmail.com
gext install blur-my-shell@aunetx
gext install just-perfection-desktop@just-perfection
gext install appindicatorsupport@rgcjonas.gmail.com
gext install clipboard-indicator@tudmotu.com
gext install Vitals@CoreCoding.com
gext install caffeine@patapon.info
gext install gsconnect@andyholmes.github.io
gext install grand-theft-focus@zalckos.github.com
gext install no-overview@fthx
```

## 🎯 Configuração Recomendada Final

Após instalar tudo:

1. **Desabilitar extensões nativas desnecessárias:**
   ```bash
   gnome-extensions disable background-logo@fedorahosted.org
   gnome-extensions disable windowsNavigator@gnome-shell-extensions.gcampax.github.com
   ```

2. **Configurar Dash to Dock:**
   - Bottom position, 48px icons
   - Autohide inteligente
   - 80% opacity

3. **Configurar Blur my Shell:**
   - Blur em painel, dash e overview
   - Blur amount: 30

4. **Configurar Vitals:**
   - Mostrar: CPU, RAM, Temperatura
   - Position: Center na barra

5. **Configurar Just Perfection:**
   - Esconder painel em fullscreen
   - Workspace switcher small

## 🔄 Atualização das Extensões

```bash
# Via Extension Manager
gnome-extensions-app

# Ou manualmente
cd ~/.local/share/gnome-shell/extensions/
git pull # se instalado via git
```

---

**🎨 Resultado:** Interface limpa, moderna e altamente produtiva!
