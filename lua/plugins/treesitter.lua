---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup {}
      local parsers = { "bash", "json", "lua", "markdown", "markdown_inline", "query", "vim", "vimdoc" }
      if #vim.api.nvim_list_uis() > 0 then require("nvim-treesitter").install(parsers) end
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPost", "BufNewFile" },
    opts = {},
  },
}
