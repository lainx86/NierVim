require("lazy").setup({
  { import = "plugins" },
} --[[@as LazySpec]], {
  defaults = { lazy = true },
  install = { colorscheme = { "nier", "habamax" } },
  change_detection = { notify = false },
  rocks = { enabled = false },
  ui = {
    backdrop = 100,
    title = " NierVim ",
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "zipPlugin",
      },
    },
  },
} --[[@as LazyConfig]])
