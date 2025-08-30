return {
  {
    "phaazon/hop.nvim",
    branch = "v2",
    config = function()
      local hop = require("hop")
      hop.setup()

      vim.keymap.set("n", "<leader>w", function() hop.hint_words() end, { desc = "Hop to word" })
      vim.keymap.set("n", "<leader>l", function() hop.hint_lines() end, { desc = "Hop to line" })
      vim.keymap.set("n", "<leader>c", function() hop.hint_char1() end, { desc = "Hop to 1 char" })
      vim.keymap.set("n", "<leader>2", function() hop.hint_char2() end, { desc = "Hop to 2 chars" })
    end,
  },
}
