return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    ensure_installed = {
      "lua", "vim", "vimdoc", "bash",
      "javascript", "typescript", "tsx", "json", "yaml", "html", "css",
      "go", "gomod", "graphql", "prisma",
      "markdown", "markdown_inline", "toml", "dockerfile", "regex", "query", "gitcommit",
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
      -- ป้องกันช้าในไฟล์ใหญ่มาก
      disable = function(lang, buf)
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > 500 * 1024 then return true end -- >500KB
      end,
    },
    indent = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
