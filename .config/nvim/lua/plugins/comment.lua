return {
  "numToStr/Comment.nvim",
  event = "VeryLazy",
  dependencies = {
    -- ทำให้คอมเมนต์ในไฟล์ TSX/JSX ถูกชนิด (// หรือ {/* */}) อัตโนมัติ
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    require("Comment").setup({
      mappings = { basic = true, extra = true },
      -- คีย์หลัก:
      --   gcc  -> toggle comment ทั้งบรรทัด
      --   gc{motion} -> toggle ตาม motion (เช่น gcw)
      --   gbc/gb{motion} -> block comment
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    })
  end,
}
