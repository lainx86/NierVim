---@type LazySpec
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      formats = {
        header = { "%s", align = "center", hl = "SnacksDashboardHeader" },
      },
      sections = {
        { section = "header", padding = 1 },
        { section = "keys", gap = 1, padding = 3 },
        { section = "startup" },
      },
      preset = {
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = function() Snacks.picker.files() end },
          { icon = " ", key = "g", desc = "Find Text", action = function() Snacks.picker.grep() end },
          { icon = " ", key = "r", desc = "Recent Files", action = function() Snacks.picker.recent() end },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
        header = [[




⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⠤⠴⣒⡚⠌⠩⠍⠉⠉⠭⠭⠭⢑⣒⠲⠤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⠔⡚⠭⠒⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠁⠒⠭⡓⢤⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣠⢖⡩⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢄⠀⠀⠀⠀⠀⢀⢄⠀⠀⢀⡀⡑⢌⠢⡄⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣠⡾⢕⠏⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⢰⠀⠈⡦⡀⠀⠀⠀⡄⠫⠄⠱⡈⠃⠈⢢⡐⢎⢢⡀⠀⠀
⠀⠀⠀⠀⠀⡼⠏⠀⠈⠀⠀⠀⠀⠀⡜⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⡝⣦⠀⠀⠹⡀⠀⠀⠘⡄⠀⠀⠙⡄⠱⡹⡄⠀
⠀⠀⠀⠀⣾⠃⠀⠀⠀⠀⠀⠀⠀⢀⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡎⡌⢆⠀⠀⢱⡄⠀⠀⠘⡄⠀⠀⠘⣴⣔⡹⡆
⠀⠀⠀⢸⠏⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⡇⢘⡌⠇⠀⠘⡽⡀⠀⠀⢣⡀⠀⠀⢱⢿⡵⢱
⠀⠀⠀⣽⠁⠀⠀⠀⡇⠀⠀⠀⠀⢸⠀⠀⠀⠀⢸⡄⠀⢀⠞⠀⠀⠀⠀⠩⡸⡢⠤⡇⢱⡀⠀⠀⢧⠀⠀⠘⣼⢷⠸
⠀⠀⠀⣯⠀⠀⡸⡐⡇⠀⠀⠀⠀⢸⠀⠀⠀⠀⢸⣇⡴⠃⠀⠀⠀⠀⠀⠀⠁⢧⠀⠇⠀⢗⠀⡂⠘⡄⠀⠀⣿⠸⡀
⠀⠀⠀⣿⢰⢸⣇⠁⡇⠀⠀⠀⠀⠀⠀⠀⠀⢀⠜⡋⠀⠀⠀⠀⠀⡇⠀⠀⠀⢸⢸⠀⢀⣸⣶⡷⠁⣱⠀⠀⣿⠀⠥
⠀⠀⠀⣿⣝⢀⡇⠀⡇⠀⠀⠀⠀⢠⠀⡤⠚⠁⣧⠅⠀⠀⠀⠀⠀⠇⠀⠀⠀⢸⣷⣾⡛⠉⡞⠀⠀⣿⠀⠀⠋⢦⠀
⠀⠀⠀⢹⡋⢸⠀⠀⡀⠀⠀⠀⠀⢸⠀⣴⣶⣶⣿⣶⠶⢶⣶⡄⣼⠀⠀⠀⠀⠀⠉⠉⠛⠛⠿⢷⡖⡿⠀⠀⠠⡈⣇
⠀⠀⢀⡟⠀⢸⠀⣿⡇⠀⠀⠀⠀⢸⠀⣀⣀⡜⣬⣴⡾⠛⠓⠂⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⢸⡇⠀⠀⣷⣸
⠀⢀⡞⠀⠀⢸⢾⠁⢳⣤⣄⣀⡀⢸⠀⣠⣶⡿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠇⠀⠀⣏⣿
⣠⠞⠁⠀⠀⠸⣇⠀⢸⠛⠓⠤⠦⢼⠀⠵⠈⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⣀⢀⡠⠤⣤⠀⠀⠀⠀⠀⠰⣦⡴⠚⠁⠉
⡇⠀⠀⣄⠀⠀⠹⣄⢸⡄⠐⠀⠀⠀⡄⠀⠀⠀⠀⠀⠀⠀⢀⠞⠁⠀⠀⠀⠈⠀⠀⠈⠇⠀⠀⠀⢀⡼⢫⡇⠀⠀⠀
⢧⣀⠈⣿⣀⠀⠀⣮⢻⢿⣿⡑⠓⠒⡧⡀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⢀⠆⠀⣠⣴⡏⣠⡟⠀⠀⠀⠀
⠀⠙⢦⣿⠹⣦⡘⣿⣾⠀⠀⠈⠉⠉⣧⣈⡐⠠⢀⡀⠀⠀⠰⣄⠀⠀⢀⡀⠄⠀⣈⡡⣴⢛⣥⠟⡧⠋⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠙⠾⠸⡇⠀⠀⣸⠀⢸⠀⠀⠉⠀⢒⣿⠁⠀⠒⠚⠛⣢⡖⠚⠉⠀⠀⠟⠚⠁⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⡀⠀⣿⠀⢸⡀⠀⢀⡴⣿⣿⣷⣦⣀⡀⢠⣿⣫⡉⠙⠒⡦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠪⠝⢆⣸⣇⠴⢻⠀⢻⣿⣿⣿⣿⣿⣿⣿⣷⡈⢦⡀⠀⡈⢆⠀⠀⠀⠀⠀⠀⠀⠀⠀

N I E R V I M
未来を変えるのは、いつだって自分だ。]],
      },
    },
    input = { enabled = true },
    notifier = { enabled = true },
    picker = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    words = { enabled = true },
  },
  config = function(_, opts)
    require("snacks").setup(opts)
    vim.notify = Snacks.notifier
  end,
}
