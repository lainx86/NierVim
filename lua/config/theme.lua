local M = {}

local modes = { dark = true, light = true }

function M.set(mode, opts)
  opts = opts or {}
  if not modes[mode] then error(("Invalid NierVim mode: %s"):format(mode)) end

  vim.g.nier_mode = mode
  vim.o.background = mode
  vim.cmd.colorscheme "nier"

  if not opts.silent then vim.notify(("NierVim mode: %s"):format(mode), vim.log.levels.INFO) end
end

function M.toggle()
  M.set(vim.o.background == "dark" and "light" or "dark")
end

function M.setup()
  vim.api.nvim_create_user_command("NierMode", function(args)
    if args.args == "" or args.args == "toggle" then
      M.toggle()
    else
      M.set(args.args)
    end
  end, {
    nargs = "?",
    desc = "Set or toggle the NierVim color mode",
    complete = function() return { "light", "dark", "toggle" } end,
  })

  local mode = vim.g.nier_mode or vim.env.NIERVIM_THEME or "light"
  M.set(modes[mode] and mode or "light", { silent = true })
end

return M
