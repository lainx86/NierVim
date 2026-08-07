---@type LazySpec
return {
  { "NMAC427/guess-indent.nvim", event = "BufReadPre", opts = {} },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = { check_ts = true, fast_wrap = {} },
  },
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "brenoprata10/nvim-highlight-colors",
    event = { "BufReadPost", "BufNewFile" },
    opts = { render = "background", enable_tailwind = true },
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { "<C-`>", "<Cmd>ToggleTerm<CR>", desc = "Toggle terminal" },
      { "<Leader>tf", "<Cmd>ToggleTerm direction=float<CR>", desc = "Floating terminal" },
    },
    opts = { open_mapping = [[<C-`>]], direction = "float", shade_terminals = false },
  },
  {
    "mrjones2014/smart-splits.nvim",
    keys = {
      { "<C-Left>", function() require("smart-splits").resize_left() end, desc = "Resize left" },
      { "<C-Down>", function() require("smart-splits").resize_down() end, desc = "Resize down" },
      { "<C-Up>", function() require("smart-splits").resize_up() end, desc = "Resize up" },
      { "<C-Right>", function() require("smart-splits").resize_right() end, desc = "Resize right" },
    },
    opts = {},
  },
  {
    "stevearc/resession.nvim",
    cmd = { "SessionSave", "SessionLoad" },
    keys = {
      { "<Leader>ss", function() require("resession").save() end, desc = "Save session" },
      { "<Leader>sl", function() require("resession").load() end, desc = "Load session" },
    },
    opts = {},
  },
  {
    "stevearc/aerial.nvim",
    cmd = "AerialToggle",
    keys = { { "<Leader>o", "<Cmd>AerialToggle!<CR>", desc = "Symbols outline" } },
    opts = { layout = { min_width = 28 }, attach_mode = "global" },
  },
}
