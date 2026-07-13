-- ──  Theme ──────────────────────────

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

  -- ──  Lang Extras ───────────────────

  { import = "lazyvim.plugins.extras.lang.sql" },
  { import = "lazyvim.plugins.extras.lang.docker" },

  -- ──  Frontend ──────────────────────

  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.tailwind" },
  { import = "lazyvim.plugins.extras.formatting.prettier" },

  -- ──  Tools ─────────────────────────

  { import = "lazyvim.plugins.extras.util.rest" },
  { import = "lazyvim.plugins.extras.coding.blink" },
  { import = "lazyvim.plugins.extras.editor.snacks_picker" },
  { import = "lazyvim.plugins.extras.editor.snacks_explorer" },

  -- ──  Other ─────────────────────────

  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "lazyvim.plugins.extras.lang.yaml" },
  { import = "lazyvim.plugins.extras.lang.markdown" },
}
