vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4        -- ความกว้างคอลัมน์เลขบรรทัด
vim.opt.signcolumn = "yes"     -- กันเลย์เอาท์กระเด้งเวลา LSP/diagnostic ใส่สัญลักษณ์
vim.opt.cursorline = true      -- ไฮไลต์บรรทัดที่เคอร์เซอร์อยู่
vim.opt.colorcolumn = "100"    -- เส้นเตือนความยาวบรรทัด (ปรับตามสไตล์ทีม)

-- แท็บ/อินเดนต์
vim.opt.tabstop = 4            -- แสดงแท็บเป็นกว้าง 4 ช่อง
vim.opt.shiftwidth = 4         -- ความกว้างการเยื้องเวลาใช้ << >>
vim.opt.softtabstop = 4
vim.opt.expandtab = true       -- แปลง Tab เป็น space (ส่วนใหญ่โปรเจ็กต์นิยม)
vim.opt.smartindent = true
vim.g.mapleader = ","

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 400
vim.opt.termguicolors = true -- สีใน floating window

-- highlight ตอน yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch", -- ใช้สีของ IncSearch (คุณเปลี่ยนเป็น Search, Visual ก็ได้)
      timeout = 150,         -- ระยะเวลาแสดง highlight (ms)
    })
  end,
})

vim.opt.rtp:prepend("~/.local/share/nvim/lazy/lazy.nvim")

require("lazy").setup("plugins")
