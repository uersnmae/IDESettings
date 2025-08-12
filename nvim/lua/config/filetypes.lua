-- ~/.config/nvim/lua/config/filetypes.lua

-- 새로운 파일을 열거나, 기존 파일을 읽을 때 특정 패턴에 대해 자동 명령을 실행합니다.
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.tpp" }, -- 패턴: .tpp로 끝나는 모든 파일
  callback = function()
    -- 해당 버퍼의 파일 타입을 'cpp'로 설정합니다.
    vim.bo.filetype = "cpp"
  end,
})
