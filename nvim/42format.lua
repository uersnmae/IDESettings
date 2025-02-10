-- Variables to store the original settings
local M = {}

vim.g.o_expandtab = vim.o.expandtab
vim.g.o_tabstop = vim.o.tabstop
vim.g.o_shiftwidth = vim.o.shiftwidth

-- Variables to store the alternate settings
vim.g.a_expandtab = false
vim.g.a_tabstop = 4
vim.g.a_shiftwidth = 4

local function check_settings()
	if vim.o.expandtab ~= vim.g.o_expandtab then
		return false
	elseif vim.o.tabstop ~= vim.g.o_tabstop then
		return false
	elseif vim.o.shiftwidth ~= vim.g.o_shiftwidth then
		return false
	else
		return true
	end
end

-- Function to toggle between the original and alternate settings
local function toggle_indent_settings()
	local status_string = "42format"
	if check_settings() then
		-- Switch to alternate settings
		vim.o.expandtab = vim.g.a_expandtab
		vim.o.tabstop = vim.g.a_tabstop
		vim.o.shiftwidth = vim.g.a_shiftwidth
		status_string = status_string
			.. " on - expandtab: "
			.. tostring(vim.o.expandtab)
			.. ", tabstop: "
			.. vim.o.tabstop
			.. ", shiftwidth: "
			.. vim.o.shiftwidth
	else
		-- Switch back to original settings
		vim.o.expandtab = vim.g.o_expandtab
		vim.o.tabstop = vim.g.o_tabstop
		vim.o.shiftwidth = vim.g.o_shiftwidth
		status_string = status_string
			.. " off - expandtab: "
			.. tostring(vim.o.expandtab)
			.. ", tabstop: "
			.. vim.o.tabstop
			.. ", shiftwidth: "
			.. vim.o.shiftwidth
	end
	print(status_string)
end

-- Map F3 key to toggle the indent settings
vim.api.nvim_create_user_command("Toggle42format", toggle_indent_settings, {})
vim.api.nvim_set_keymap("n", "<F3>", ":Toggle42format<CR>", { noremap = true, silent = true })

return M
