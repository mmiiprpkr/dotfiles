return {
  "gbprod/yanky.nvim",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    { "p", "<Plug>(YankyPutAfter)",  mode = {"n","x"}, desc="Paste after (yanky)" },
    { "P", "<Plug>(YankyPutBefore)", mode = {"n","x"}, desc="Paste before (yanky)" },
    { "gp", "<Plug>(YankyGPutAfter)",  mode = {"n","x"}, desc="Paste after and move cursor" },
    { "gP", "<Plug>(YankyGPutBefore)", mode = {"n","x"}, desc="Paste before and move cursor" },

    -- หมุนประวัติ
    { "<c-n>", "<Plug>(YankyCycleForward)", mode = {"n","x"}, desc="Cycle forward through yank history" },
    { "<c-p>", "<Plug>(YankyCycleBackward)", mode = {"n","x"}, desc="Cycle backward through yank history" },

    -- เปิด history picker (ต้องใช้ telescope/fzf)
    { "<leader>y", "<cmd>YankyRingHistory<CR>", desc="Yank history" },
  },
  config = function()
    require("yanky").setup({
      -- Configuration here, or leave empty to use defaults
    })
  end
}
