local M = {}

local modes = {
  n = { "NORMAL", "StatusNormal" },
  no = { "O-PENDING", "StatusNormal" },
  i = { "INSERT", "StatusInsert" },
  ic = { "INSERT", "StatusInsert" },
  v = { "VISUAL", "StatusVisual" },
  V = { "V-LINE", "StatusVisual" },
  ["\22"] = { "V-BLOCK", "StatusVisual" },
  R = { "REPLACE", "StatusReplace" },
  Rv = { "V-REPLACE", "StatusReplace" },
  c = { "COMMAND", "StatusCommand" },
  t = { "TERMINAL", "StatusTerminal" },
}

local function escape(value) return value:gsub("%%", "%%%%") end

function M.statusline()
  local mode = modes[vim.fn.mode(1)] or { "OTHER", "StatusNormal" }
  local filename = vim.fn.expand "%:~:."
  if filename == "" then filename = "[No Name]" end

  local modified = vim.bo.modified and " [+]" or ""
  local readonly = vim.bo.readonly and " [RO]" or ""
  local git = vim.b.gitsigns_status and ("  " .. vim.b.gitsigns_status) or ""
  local diagnostics = vim.diagnostic.count(0)
  local errors = diagnostics[vim.diagnostic.severity.ERROR] or 0
  local warnings = diagnostics[vim.diagnostic.severity.WARN] or 0
  local diagnostic_text = (errors > 0 and (" E:" .. errors) or "") .. (warnings > 0 and (" W:" .. warnings) or "")

  local clients = vim.lsp.get_clients { bufnr = 0 }
  local lsp = #clients > 0 and clients[1].name or ""
  local right = table.concat(vim.tbl_filter(function(item) return item ~= "" end, {
    diagnostic_text,
    lsp,
    vim.bo.filetype,
  }), "  ")

  return table.concat {
    "%#",
    mode[2],
    "# ",
    mode[1],
    " ",
    "%#StatusLine# ",
    escape(filename),
    modified,
    readonly,
    git,
    "%= ",
    right,
    "  %l:%c  %p%% ",
  }
end

function M.tabline()
  local current = vim.api.nvim_get_current_buf()
  local tabs = {}

  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_valid(bufnr) and vim.bo[bufnr].buflisted then
      local name = vim.api.nvim_buf_get_name(bufnr)
      name = name == "" and "[No Name]" or vim.fn.fnamemodify(name, ":t")
      local modified = vim.bo[bufnr].modified and " +" or ""
      tabs[#tabs + 1] = table.concat {
        bufnr == current and "%#TabLineSel#" or "%#TabLine#",
        " ",
        bufnr,
        ":",
        escape(name),
        modified,
        " ",
      }
    end
  end

  tabs[#tabs + 1] = "%#TabLineFill#%="
  return table.concat(tabs)
end

return M
