-- 기존 Lazy 설정 로드
require("config.lazy")

-- 테마 모듈 로드
local theme = require("config.theme")

-- 기본 테마 설정
-- theme.set_theme("gruvbox", "dark", "soft")
theme.set_theme("tokyonight", "storm")
-- theme.set_theme("catppuccin", "latte")
-- theme.set_theme("nord")

-- :SetTheme 명령어 추가
vim.api.nvim_create_user_command("SetTheme", function(opts)
  local args = vim.split(opts.args, " ")
  local theme_name = args[1]
  local style = args[2]
  local contrast = args[3]

  theme.set_theme(theme_name, style, contrast)
end, {
  nargs = "+",
  complete = function()
    return { "gruvbox", "tokyonight", "catppuccin", "nord" }
  end,
})
