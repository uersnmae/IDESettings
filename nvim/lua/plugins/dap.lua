-- ~/.config/nvim/lua/plugins/dap.lua
return {
  { import = "lazyvim.plugins.extras.dap.core" },   -- DAP + UI + Mason 연동
  { import = "lazyvim.plugins.extras.lang.clangd" } -- C/C++ LSP & 디버거 기본값
}
