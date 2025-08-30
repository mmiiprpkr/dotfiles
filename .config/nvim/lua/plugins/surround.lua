return {
  "kylechui/nvim-surround",
  -- ให้ปลั๊กอินโหลดทันทีที่เรากดคีย์พวกนี้ (แก้ปัญหาไม่แมปตอนเริ่ม)
  keys = {
    { "ys",  mode = "n", desc = "Surround add (motion)" },
    { "yss", mode = "n", desc = "Surround add (line)" },
    { "yS",  mode = "n", desc = "Surround add to line" },
    { "ySS", mode = "n", desc = "Surround add current line" },
    { "S",   mode = "x", desc = "Surround visual" },
    { "ds",  mode = "n", desc = "Surround delete" },
    { "cs",  mode = "n", desc = "Surround change" },
  },
  config = function()
    require("nvim-surround").setup({})

    -- ใส่แมปปิงด้วย <Plug> ชัด ๆ (กันเคสที่ default keymaps ไม่ถูกตั้ง)
    vim.keymap.set("n", "ys",  "<Plug>(nvim-surround-normal)")
    vim.keymap.set("n", "yss", "<Plug>(nvim-surround-normal-cur)")
    vim.keymap.set("n", "yS",  "<Plug>(nvim-surround-normal-line)")
    vim.keymap.set("n", "ySS", "<Plug>(nvim-surround-normal-cur-line)")
    vim.keymap.set("x", "S",   "<Plug>(nvim-surround-visual)")
    vim.keymap.set("n", "ds",  "<Plug>(nvim-surround-delete)")
    vim.keymap.set("n", "cs",  "<Plug>(nvim-surround-change)")
  end,
}
