-- ~/.config/nvim/lua/config/theme.lua

local M = {}

M.set_theme = function(theme_name, style, contrast)
  if theme_name == "gruvbox" then
    local backgrounds = { "dark", "light" }
    local contrasts = { "soft", "medium", "hard" }

    -- 기본값 설정
    local bg = "dark"
    local ct = "medium"

    -- 스타일이 지정되면 업데이트
    if style and vim.tbl_contains(backgrounds, style) then
      bg = style
    end

    -- 대비가 지정되면 업데이트
    if contrast and vim.tbl_contains(contrasts, contrast) then
      ct = contrast
    end

    require("gruvbox").setup({
      contrast = ct,
      overrides = {},
    })
    vim.o.background = bg
    vim.cmd.colorscheme("gruvbox")
  elseif theme_name == "tokyonight" then
    local styles = { "storm", "moon", "night", "day" }
    if style and vim.tbl_contains(styles, style) then
      require("tokyonight").setup({ style = style })
    end
    vim.o.background = "dark"
    vim.cmd.colorscheme("tokyonight")
  elseif theme_name == "catppuccin" then
    local flavours = { "latte", "frappe", "macchiato", "mocha" }
    if style and vim.tbl_contains(flavours, style) then
      require("catppuccin").setup({ flavour = style })
    end
    vim.cmd.colorscheme("catppuccin")
  elseif theme_name == "nord" then
    -- Nord는 추가 설정 옵션이 없으니 곧바로 적용
    vim.o.background = "dark"
    vim.cmd.colorscheme("nord")
  else
    print("Invalid theme: " .. theme_name)
  end
end

return M
