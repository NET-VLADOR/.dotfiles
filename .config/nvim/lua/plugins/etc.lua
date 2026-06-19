return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
  {
    "folke/which-key.nvim",
    opts_extend = { "spec" },
    opts = {
      preset = "modern",
      show_help = true,
    },
  },
  { import = "lazyvim.plugins.extras.lang.sql" }, -- PostgreSQL
  { import = "lazyvim.plugins.extras.lang.docker" }, -- Docker

  -- Frontend (React + TS)
  { import = "lazyvim.plugins.extras.lang.typescript" }, -- TypeScript
  { import = "lazyvim.plugins.extras.lang.tailwind" }, -- Tailwind CSS
  { import = "lazyvim.plugins.extras.formatting.prettier" }, -- Prettier для JS/TS

  -- Инструменты
  { import = "lazyvim.plugins.extras.util.rest" }, -- REST Client Interface for Neovim
  { import = "lazyvim.plugins.extras.coding.blink" }, -- blink.cmp (автодополнение)
  { import = "lazyvim.plugins.extras.editor.snacks_picker" }, -- Поиск файлов
  { import = "lazyvim.plugins.extras.editor.snacks_explorer" }, -- Файловый менеджер

  -- Дополнительно (если нужно)
  { import = "lazyvim.plugins.extras.lang.json" }, -- JSON
  { import = "lazyvim.plugins.extras.lang.yaml" }, -- YAML
  { import = "lazyvim.plugins.extras.lang.markdown" }, -- Markdown (для README)
}
