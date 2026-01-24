local status, telescope = pcall(require, "telescope")
if not status then return end

telescope.setup({
  defaults = {
    -- Ajuste de bordas sugerido pelo Gruvbox Baby
    borderchars = {
      prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
      results = { " ", " ", " ", " ", " ", " ", " ", " " },
      preview = { " ", " ", " ", " ", " ", " ", " ", " " },
    },
    -- Configurações de layout
    layout_config = {
      horizontal = {
        preview_width = 0.55,
      },
    },
    -- Atalhos internos do Telescope (dentro da janela de busca)
    mappings = {
      i = {
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
      },
    },
  },
})

-- Atalhos de teclado para o Telescope
local keymap = vim.keymap
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Achar arquivos" })
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Buscar texto no projeto" })
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Listar buffers abertos" })
