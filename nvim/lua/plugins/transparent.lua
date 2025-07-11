-- lua/plugins/transparent.lua
return {
  {
    "xiyaowong/transparent.nvim",
    lazy = false,      -- 반드시 즉시 로드
    priority = 1000,   -- colorscheme보다 먼저
    config = function()
      local trans = require("transparent")

      -- 기본 + 부가 그룹
      trans.setup({
        -- NormalFloat·FloatBorder까지 미리 투명화
        extra_groups = { "NormalFloat", "FloatBorder" },
      })

      -- 🔑 1) Lazy UI 전체, 2) 기타 자주 쓰는 팝업 계열
      trans.clear_prefix("Lazy")      -- LazyNormal·LazyButton 등 전부 투명화 :contentReference[oaicite:0]{index=0}
      trans.clear_prefix("WhichKey")  -- which-key.nvim
      trans.clear_prefix("Mason")     -- mason.nvim
      trans.clear_prefix("Noice")     -- noice.nvim
      trans.clear_prefix("FzfLua")     -- noice.nvim
      trans.clear_prefix("Telescope")     -- noice.nvim
      trans.clear_prefix("NeoTree")     -- noice.nvim

      vim.cmd("TransparentEnable")    -- 시작 시 바로 적용
    end,
  },
}
