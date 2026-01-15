# Guia de Uso Avançado do Neovim

Este arquivo complementa o FIRSTSTEPS.md, trazendo atalhos, plugins e dicas para usuários intermediários e avançados.

## Legenda dos Atalhos
- `<C-...>` : Pressione a tecla Ctrl junto com a tecla indicada (ex: `<C-h>` = Ctrl + h)
- `<leader>` : Por padrão, é a tecla <Space> (espaço). Ex: `<leader>w` = pressione espaço, depois w
- `<leader>...` : Pressione <Space> seguido da(s) tecla(s) indicadas
- `<CR>` : Pressione Enter
- `<Esc>` : Pressione Escape
- `<Tab>` : Pressione Tab
- `i` : Modo insert (pressione i para editar)
- `J`, `K` (visual): Selecione um bloco e pressione J ou K para mover

## Atalhos Essenciais

### Navegação entre Splits (Janelas)
- `<C-h>`: Ir para a janela da esquerda
- `<C-j>`: Ir para a janela de baixo
- `<C-k>`: Ir para a janela de cima
- `<C-l>`: Ir para a janela da direita

### Redimensionar Splits
- `<leader>=` :  Aumentar altura
- `<leader>-` :  Diminuir altura
- `<leader>]` :  Aumentar largura
- `<leader>[` :  Diminuir largura

### Troca de Buffers
- `<leader>bn` :  Próximo buffer
- `<leader>bp` :  Buffer anterior

### Salvar e Fechar
- `<leader>w` : 󰈙 Salvar arquivo
- `<leader>q` : 󰅖 Fechar janela

### Mover Blocos de Texto (Visual Mode)
- `J` : Mover bloco para baixo
- `K` : Mover bloco para cima

### Tabs
- `<leader>to` :  Nova aba
- `<leader>tx` :  Fechar aba
- `<leader>tn` :  Próxima aba
- `<leader>tp` :  Aba anterior

### Oil (Gerenciador de arquivos)
- `-` : Abrir Oil no diretório pai

### Copilot
- `<C-a>` (no insert): Aceitar sugestão do Copilot

## Plugins e Ferramentas Avançadas
- **Lazy.nvim**: Gerenciador de plugins. Use `:Lazy` para instalar/atualizar.
- **Lualine**: Statusline customizada.
- **Telescope**: Busca de arquivos/texto com fuzzy search.
- **Treesitter**: Realce de sintaxe avançado.
- **nvim-cmp**: Autocompletar inteligente.
- **Mason**: Gerenciador de LSPs.
- **Gitsigns**: Integração visual com Git.
- **Oil**: Gerenciador de arquivos em modo texto.
- **Hardtime**: Treinador de produtividade (veja HARDTIME.md).
- **Copilot**: IA do GitHub para sugestões de código.
- **Bufferline**: Barra de buffers com ícones.
- **Toggleterm**: Terminal flutuante integrado.
- **Noice/Notify**: Notificações e linha de comando pop-up.

## Ferramentas Avançadas

### Mason
Gerencia e instala servidores LSP automaticamente. Use `:Mason` para abrir o painel.

### Telescope
Busca arquivos, texto, buffers e comandos com fuzzy search. Atalhos comuns:
- `<leader>ff`: Buscar arquivos
- `<leader>fs`: Buscar texto
- `<leader>fb`: Listar buffers

### Treesitter
Realce de sintaxe e indentação inteligente para múltiplas linguagens.

### nvim-cmp
Autocompletar para LSP, buffer, path e snippets.

### Gitsigns
Mostra alterações do Git na lateral do código, permite ações rápidas (stage, reset, preview).

### Oil
Gerenciador de arquivos em modo texto, rápido e minimalista.

### Hardtime
Plugin para treinar boas práticas de navegação e edição. Veja [HARDTIME.md](HARDTIME.md).

### Copilot
Sugestões de código por IA. Aceite com `<C-a>` no modo insert.

### Bufferline
Barra de buffers com ícones, alternância rápida entre arquivos.

### Toggleterm
Terminal flutuante, abre com `<leader>tt`.

### Noice/Notify
Notificações pop-up e linha de comando moderna.

## Dicas Gerais
- Use sempre o leader (`<Space>`) antes dos atalhos customizados.
- Para mudar de tema, edite o arquivo de cores em `lua/phil/core/colorscheme.lua`.
- Para ver todos os plugins e status, use `:Lazy`.

---

Aproveite o poder do Neovim com recursos avançados e visual moderno!
