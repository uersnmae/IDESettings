local M = {}
local asciiart = {
  "        :::      ::::::::",
  "      :+:      :+:    :+:",
  "    +:+ +:+         +:+  ",
  "  +#+  +:+       +#+     ",
  "+#+#+#+#+#+   +#+        ",
  "     #+#    #+#          ",
  "    ###   ########.fr    ",
}

local config = {
  start = "/*",
  finish = "*/",
  fill = "*",
  length = 80,
  margin = 5,
  types = {
    ["%.c$"] = { "/*", "*/", "*" },
    ["%.h$"] = { "/*", "*/", "*" },
    ["%.cc$"] = { "/*", "*/", "*" },
    ["%.hh$"] = { "/*", "*/", "*" },
    ["%.cpp$"] = { "/*", "*/", "*" },
    ["%.hpp$"] = { "/*", "*/", "*" },
    ["%.php$"] = { "/*", "*/", "*" },
    ["%.htm$"] = { "<!--", "-->", "*" },
    ["%.html$"] = { "<!--", "-->", "*" },
    ["%.xml$"] = { "<!--", "-->", "*" },
    ["%.js$"] = { "//", "//", "*" },
    ["%.tex$"] = { "%", "%", "*" },
    ["%.ml$"] = { "(*", "*)", "*" },
    ["%.mli$"] = { "(*", "*)", "*" },
    ["%.mll$"] = { "(*", "*)", "*" },
    ["%.mly$"] = { "(*", "*)", "*" },
    ["%.vim$"] = { '"', '"', "*" },
    ["%.vimrc$"] = { '"', '"', "*" },
    ["%.el$"] = { ";", ";", "*" },
    ["%.emacs$"] = { ";", ";", "*" },
    ["%.f90$"] = { "!", "!", "/" },
    ["%.f95$"] = { "!", "!", "/" },
    ["%.f03$"] = { "!", "!", "/" },
    ["%.f$"] = { "!", "!", "/" },
    ["%.for$"] = { "!", "!", "/" },
  },
}

local function get_filename()
  local filename = vim.fn.expand("%:t")
  return #filename > 0 and filename or "< new >"
end

local function get_user()
  local user = vim.g.user42 or vim.env.USER or "marvin"
  return user
end

local function get_mail()
  local mail = vim.g.mail42 or vim.env.MAIL or "marvin@42.fr"
  return mail
end

local function get_date()
  return os.date("%Y/%m/%d %H:%M:%S")
end

local function get_filetype()
  local filename = get_filename()
  config.start, config.finish, config.fill = "#", "#", "*"
  for pattern, types in pairs(config.types) do
    if filename:match(pattern) then
      config.start, config.finish, config.fill = types[1], types[2], types[3]
      break
    end
  end
end

local function get_ascii(n)
  return asciiart[n - 2]
end

local function textline(left, right)
  local _left = string.sub(left, 1, config.length - config.margin * 2 - #right)
  return config.start
    .. string.rep(" ", config.margin - #config.start)
    .. _left
    .. string.rep(" ", config.length - config.margin * 2 - #left - #right)
    .. right
    .. string.rep(" ", config.margin - #config.finish)
    .. config.finish
end

local function line(n)
  if n == 1 or n == 11 then
    return config.start
      .. " "
      .. string.rep(config.fill, config.length - #config.start - #config.finish - 2)
      .. " "
      .. config.finish
  elseif n == 2 or n == 10 then
    return textline("", "")
  elseif n == 3 or n == 5 or n == 7 then
    return textline("", get_ascii(n))
  elseif n == 4 then
    return textline(get_filename(), get_ascii(n))
  elseif n == 6 then
    return textline("By: " .. get_user() .. " <" .. get_mail() .. ">", get_ascii(n))
  elseif n == 8 then
    return textline("Created: " .. get_date() .. " by " .. get_user(), get_ascii(n))
  elseif n == 9 then
    return textline("Updated: " .. get_date() .. " by " .. get_user(), get_ascii(n))
  end
end

local function insert_header()
  local lines = {}
  for i = 1, 11, 1 do
    table.insert(lines, line(i))
  end
  table.insert(lines, "")
  vim.api.nvim_buf_set_lines(0, 0, 0, false, lines)
end

local function update_header()
  get_filetype()
  if vim.fn.getline(9):match(config.start .. string.rep(" ", config.margin - #config.start) .. "Updated: ") then
    if vim.bo.modified then
      vim.fn.setline(9, line(9))
    end
    vim.fn.setline(4, line(4))
    return false
  end
  return true
end

local function stdheader()
  if update_header() then
    insert_header()
  end
end

vim.api.nvim_create_user_command("Stdheader", stdheader, {})
vim.api.nvim_set_keymap("n", "<F2>", ":Stdheader<CR>", { noremap = true, silent = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = update_header,
})

return M
