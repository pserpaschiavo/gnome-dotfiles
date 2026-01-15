local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "nvim-lua/plenary.nvim",
  -- Ícones para todo o ambiente (VS Code style)
  { "nvim-tree/nvim-web-devicons" },
    -- Terminal flutuante estilo VS Code
    {
      "akinsho/toggleterm.nvim",
      config = function()
        require("toggleterm").setup({
          size = 20,
          open_mapping = [[<C-\>]],
          shade_filetypes = {},
          shade_terminals = true,
          shading_factor = 2,
          direction = "float",
          float_opts = {
            border = "curved",
            winblend = 3,
          },
        })
        vim.keymap.set("n", "<leader>tt", ":ToggleTerm<CR>", { desc = " Abrir terminal flutuante" })
      end,
    },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("phil.plugins.treesitter")
    end,
  },
  {
    "luisiacc/gruvbox-baby",
    priority = 1000, -- Alta prioridade para carregar logo no início
    lazy = false,    -- Não pode ser carregado sob demanda, precisa estar pronto no boot
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("phil.plugins.telescope")
    end
  },
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("phil.plugins.lsp")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- Aqui chamamos o arquivo separado
      require("phil.plugins.lsp")
    end,
  },
  {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- integra LSP com o autocomplete
    "hrsh7th/cmp-buffer",   -- sugere palavras do arquivo atual
    "hrsh7th/cmp-path",     -- sugere caminhos de arquivos
    "L3MON4D3/LuaSnip",     -- motor de snippets (obrigatório para o cmp)
    "saadparwaiz1/cmp_luasnip", 
    },
    config = function()
      require("phil.plugins.completion")
    end,
  },
  {
    "onsails/lspkind.nvim", -- Adiciona ícones estilo VS Code
  },
  -- Formatação automática
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "black" },
          yaml = { "prettier" },
          json = { "prettier" },
          terraform = { "terraform_fmt" },
          hcl = { "terraform_fmt" },
          markdown = { "prettier" },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
      })
      vim.keymap.set({ "n", "v" }, "<leader>mp", function()
        require("conform").format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        })
      end, { desc = "Formatar arquivo ou seleção" })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = '│' },
          change = { text = '│' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
          untracked = { text = '┆' },
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          local opts = { buffer = bufnr }
          
          -- Navegação entre hunks
          vim.keymap.set('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, { expr = true, desc = "Próximo hunk git" })
          
          vim.keymap.set('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, { expr = true, desc = "Hunk git anterior" })
          
          -- Ações
          vim.keymap.set('n', '<leader>hs', gs.stage_hunk, { buffer = bufnr, desc = "Stage hunk" })
          vim.keymap.set('n', '<leader>hr', gs.reset_hunk, { buffer = bufnr, desc = "Reset hunk" })
          vim.keymap.set('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { buffer = bufnr, desc = "Stage hunk" })
          vim.keymap.set('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { buffer = bufnr, desc = "Reset hunk" })
          vim.keymap.set('n', '<leader>hS', gs.stage_buffer, { buffer = bufnr, desc = "Stage buffer" })
          vim.keymap.set('n', '<leader>hu', gs.undo_stage_hunk, { buffer = bufnr, desc = "Undo stage hunk" })
          vim.keymap.set('n', '<leader>hR', gs.reset_buffer, { buffer = bufnr, desc = "Reset buffer" })
          vim.keymap.set('n', '<leader>hp', gs.preview_hunk, { buffer = bufnr, desc = "Preview hunk" })
          vim.keymap.set('n', '<leader>hb', function() gs.blame_line{full=true} end, { buffer = bufnr, desc = "Blame line" })
          vim.keymap.set('n', '<leader>tb', gs.toggle_current_line_blame, { buffer = bufnr, desc = "Toggle blame line" })
          vim.keymap.set('n', '<leader>hd', gs.diffthis, { buffer = bufnr, desc = "Diff this" })
          vim.keymap.set('n', '<leader>hD', function() gs.diffthis('~') end, { buffer = bufnr, desc = "Diff this ~" })
          vim.keymap.set('n', '<leader>td', gs.toggle_deleted, { buffer = bufnr, desc = "Toggle deleted" })
        end
      })
    end,
  },
  -- Barra de buffers estilo VS Code
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("bufferline").setup({
        options = {
          diagnostics = "nvim_lsp",
          show_buffer_icons = true,
          show_buffer_close_icons = true,
          show_close_icon = true,
          separator_style = "slant",
        }
      })
      vim.keymap.set("n", "<leader>bb", ":BufferLinePick<CR>", { desc = " Escolher buffer" })
    end,
  },

  -- Linha de comando e notificações pop-up
  {
    "folke/noice.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    config = function()
      require("noice").setup({
        lsp = { progress = { enabled = true } },
        presets = { bottom_search = true, command_palette = true, long_message_to_split = true },
      })
      vim.notify = require("notify")
    end,
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        background_colour = "#1e222a",
        render = "default"
      })
    end,
  },
  -- Gerenciador de arquivos "texto"
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        view_options = { show_hidden = true } -- Essencial para ver dotfiles!
      })
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Abrir Oil (Diretório pai)" })
    end,
  },

  -- Treinador de elite (Hardtime)
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {}
  },

  -- IA do GitHub (Copilot)
  {
    "github/copilot.vim",
    lazy = false,
  },
    -- File Explorer moderno (estilo VS Code)
    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim"
      },
      config = function()
        require("neo-tree").setup({
          close_if_last_window = true,
          popup_border_style = "rounded",
          enable_git_status = true,
          enable_diagnostics = true,
          default_component_configs = {
            indent = {
              with_expanders = true,
            },
          },
          window = {
            position = "left",
            width = 30,
          },
          filesystem = {
            follow_current_file = {
              enabled = true,
            },
            filtered_items = {
              visible = true,
              hide_dotfiles = false,
              hide_gitignored = false,
            },
          },
        })
        -- Keymaps estilo VS Code
        vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "󰙅 Toggle Neo-tree" })
        vim.keymap.set("n", "<leader>o", ":Neotree focus<CR>", { desc = " Focus Neo-tree" })
      end,
    },

    -- UI LSP avançada
    {
      "nvimdev/lspsaga.nvim",
      event = "LspAttach",
      config = function()
        require("lspsaga").setup({})
      end,
    },

    -- Dashboard inicial
    {
      "nvimdev/dashboard-nvim",
      event = "VimEnter",
      config = function()
        require("dashboard").setup({})
      end,
    },

    -- Statusline customizada (configuração em lualine.lua)
    {
      "nvim-lualine/lualine.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        require("phil.plugins.lualine")
      end,
    },

    -- Menu de atalhos interativo
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      config = function()
        local wk = require("which-key")
        wk.setup({
          plugins = {
            marks = true,
            registers = true,
            spelling = {
              enabled = true,
              suggestions = 20,
            },
          },
        })
        
        -- Registrar grupos de atalhos
        wk.add({
          { "<leader>b", group = "Buffers" },
          { "<leader>f", group = "Telescope (Find)" },
          { "<leader>h", group = "Git Hunks" },
          { "<leader>t", group = "Tabs/Toggles" },
          { "<leader>e", group = "Explorer" },
          { "<leader>c", group = "Code" },
          { "<leader>m", group = "Format" },
          { "<leader>ex", group = "Exercism" },
        })
      end,
    },

    -- LeetCode integration (prática de algoritmos)
    {
      "kawre/leetcode.nvim",
      cmd = "Leet",
      build = ":TSUpdate html",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
      },
      opts = {
        lang = "python3",
      },
    },

    -- Exercism integration (prática de programação)
    {
      "2KAbhishek/exercism.nvim",
      cmd = "Exercism",
      dependencies = {
        "2KAbhishek/utils.nvim",
        "2KAbhishek/termim.nvim",
      },
      opts = {
        default_language = "python",
      },
    },
  })

