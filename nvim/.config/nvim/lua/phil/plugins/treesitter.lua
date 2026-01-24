local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then return end

treesitter.setup({
  -- Garante que essas linguagens estejam sempre instaladas
  ensure_installed = { 
    "lua", 
    "python", 
    "yaml", 
    "dockerfile", 
    "bash", 
    "terraform", 
    "hcl", 
    "json",
    "markdown",
    "markdown_inline",
    "regex",  -- Para noice.nvim
    "vim"     -- Para noice.nvim
  },
  
  -- Instalação síncrona (apenas para as linguagens em ensure_installed)
  sync_install = false,
  -- Instalação automática de novos parsers ao abrir arquivos
  auto_install = true,

  highlight = {
    enable = true, -- Ativa o syntax highlighting baseado em Treesitter
    additional_vim_regex_highlighting = false,
  },

  -- Indentação inteligente baseada na estrutura do código
  indent = { enable = true }, 
})
