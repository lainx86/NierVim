local function preserve_braille_layout(header)
  local lines = vim.split(header, "\n", { plain = true })
  local artwork = {}
  local width = 0

  for index, line in ipairs(lines) do
    local first = vim.fn.char2nr(vim.fn.strcharpart(line, 0, 1))
    if first >= 0x2800 and first <= 0x28ff then
      artwork[index] = true
      width = math.max(width, vim.api.nvim_strwidth(line))
    end
  end

  for index in pairs(artwork) do
    local padding = width - vim.api.nvim_strwidth(lines[index])
    lines[index] = lines[index] .. string.rep(" ", padding)
  end

  return table.concat(lines, "\n")
end

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
        header = preserve_braille_layout [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠠⠤⠤⠤⠄
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⠴⠦⠭⠉⠉⠉⠉⠉⠉⠉⠻⠿⠭⣭⣿⣴⣦⣄⡀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡰⠖⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠿⣾⣿⣿⣷⣄⡀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠔⠁⠀⠀⠀⠀⠀⡀⠠⢒⣒⣒⣒⢶⣀⣀⣀⣀⠀⠀⠀⠀⠀⠻⢿⣿⣿⣿⣦⡀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠔⠁⠀⠀⠀⡀⠂⠀⡂⢸⣓⣦⣙⠻⣷⣷⣍⡻⣿⣷⣶⣦⣄⠀⠀⠀⠀⠙⢿⣿⣿⣿⣦⡀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠊⠀⠀⠀⠀⢀⠄⢠⠀⣧⠘⣿⣿⣿⣷⣌⠻⣿⣿⣮⣿⣿⣿⣿⣷⣦⡀⠀⠀⠈⠻⣿⣿⣿⣿⣄
⠀⠀⠀⠀⠀⠀⠀⠀⢠⠀⠀⠀⠐⢁⣴⡏⠀⢐⡇⢻⣷⡘⣿⣿⣿⣿⣿⣟⣻⣿⣿⣮⣿⣿⣿⣿⣿⣤⠀⠀⠀⠹⣿⣿⣿⣿⡆
⠀⠀⠀⠀⠀⠀⠀⠠⠁⠀⠀⠨⢀⣼⣿⠁⡇⠈⣧⠸⣿⣷⣌⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣻⣿⣿⣿⣿⣳⡀⠀⠀⠸⣿⣿⣿⣿⡆
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡂⣾⣾⡟⢸⣇⡂⢻⣧⢹⣿⣿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡝⣿⣿⣿⣿⡷⡄⠀⠀⠸⣷⡾⣿⣟⢂
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣽⢠⣿⣿⡇⣿⡏⡅⠈⣿⣇⢿⣿⣿⣿⣿⣿⠿⣿⣿⣿⣿⡽⣿⣿⡘⣿⣿⣿⣷⠙⡀⠀⠈⣿⣿⣿⣿⣧⠠⡀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⡯⡿⢸⣿⣿⡇⡟⠕⠀⠀⢸⣿⡟⣯⡟⣿⣿⣿⣷⡌⢛⠿⣿⡿⡝⢿⢷⠸⣿⣿⣿⣧⠱⠀⠀⣯⣿⢿⢿⣿⣦⠁
⠀⠀⠀⠀⠀⠀⠀⠀⢐⡏⣥⣻⣿⣿⣟⡇⠁⠀⠀⠈⢎⢻⣎⢿⣞⢿⣿⣿⣿⣌⢻⣺⣝⡻⢎⢿⣱⡹⣿⣿⣿⣆⠁⠀⢻⣿⣋⡜⣯⡝⡆
⠀⠀⠀⠀⠀⠀⠀⠀⠨⠇⢿⡿⣿⣿⢸⠅⠀⠀⠀⠀⠘⠌⢿⣦⠻⣦⡙⣿⣿⣿⡎⢻⣿⣿⢿⡌⠎⠁⢹⡻⣿⢿⡄⠀⢸⣿⠇⠆⡾⢸⠀⠄
⠀⠀⠀⠀⠀⠀⠀⠀⢸⠇⢹⣿⣿⣏⢸⠀⠀⠀⠀⠀⠀⠈⠀⠻⣷⡈⠻⣌⠹⣿⣿⡄⠉⢿⣿⢻⡼⡄⠘⣷⡜⢿⣿⠀⠨⣿⣍⠇⢹⣹⣧⠠
⠀⠀⠀⠀⠀⠀⠀⠐⢸⠀⡈⣾⢿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠷⠄⠘⠣⠌⠳⣶⠀⠀⠺⡌⠀⣧⠀⣟⣟⡌⢦⣇⠀⣿⠊⠀⠁⢐⠸⠀⠠
⠀⠀⠀⠀⠀⠀⠀⢸⢸⠀⣇⢹⣮⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠈⠃⡀⠀⠈⠀⢹⡀⣿⣻⣘⢀⠙⣆⢸⠀⢀⠀⢸⠀⢀
⠀⠀⠀⠀⠀⠀⠀⠸⠀⠀⢿⡄⢳⠚⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⠂⡿⠾⢼⢸⠀⠈⠂⡇⠀⠀⠘
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⡀⢧⠹⡄⠀⠀⠀⠀⠀⠀⢀⠀⣶⣶⣶⣤⣤⣄⣀⣀⡀⠀⠀⠀⠀⡈⢀⡏⢹⠭⢸⠁⠀⢀⣄⠀⠀⠌
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⡆⠀⠁⠈⠀⠀⠀⠀⣠⣾⣿⠰⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠤⠐⠀⢸⠃⣞⠃⠘⠀⠀⢰⠂
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣷⡀⡆⠀⠀⠀⠀⣺⣿⣿⣿⣷⣄⣴⣾⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⡒⣰⡛⠀⠀⠀⠀⡆
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡧⠠⠀⠀⠀⠀⠻⣿⣿⣿⠿⠛⠛⠛⠻⢿⣿⣿⣿⣿⡿⠂⠀⠀⠀⠂⡿⠀⠀⠀⠀⠄
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠄⢆⠀⠀⠀⠀⠉⢻⣿⣿⣯⣁⣋⣿⣿⣿⣿⡿⠋⢀⠀⠀⠀⠠⠸⠃
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡀⠀⠀⠀⠀⠀⠈⠻⢿⣿⣿⣿⡿⠛⠁⢀⣴⣿⠃
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠁⠀⠀⡤⠾⠋⠁
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
