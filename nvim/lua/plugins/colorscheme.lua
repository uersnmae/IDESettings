return {
  -- Gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    opts = {
      contrast = "soft",
      bold = true,
      italic = {
        strings = true,
        comments = true,
        operators = false,
        folds = true,
      },
      palette_overrides = {
        dark0 = "#1d2021",
        dark1 = "#282828",
      },
      overrides = {
        SignColumn = { bg = "#282828" },
      },
    },
  },

  -- TokyoNight
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = {
      style = "moon",
      transparent = false,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = { bold = true },
        variables = {},
        sidebars = "dark",
        floats = "dark",
      },
    },
  },
  -- Catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      transparent_background = false,
      term_colors = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = true,
      },
    },
    -- Nord
    {
      "shaunsingh/nord.nvim",
      name = "nord",
      priority = 1000,
      config = function()
        -- nord.nvim 자체에서 제공하는 setup 함수는 없고,
        -- colorscheme만 적용하면 됩니다.
        vim.o.background = "dark"
        vim.cmd.colorscheme("nord")
      end,
    },
  },
}
