return {
  {
    "lukas-reineke/headlines.nvim",
    -- treesitter grammar가 필요합니다
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("headlines").setup({
        markdown = {
          -- Nord.nvim에서 제공하는 헤드라인 하이라이트 그룹
          headline_highlights = {
            "Headline1",
            "Headline2",
            "Headline3",
            "Headline4",
            "Headline5",
            "Headline6",
          },
          codeblock_highlight = "CodeBlock",
          dash_highlight = "Dash",
          quote_highlight = "Quote",
        },
      })
    end,
  },
}
