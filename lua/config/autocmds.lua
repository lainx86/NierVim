local group = vim.api.nvim_create_augroup("NierVim", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  group = group,
  desc = "Highlight text after yanking",
  callback = function() vim.hl.on_yank() end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  group = group,
  desc = "Restore the last cursor position",
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local lines = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 0 and mark[1] <= lines then pcall(vim.api.nvim_win_set_cursor, 0, mark) end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = { "help", "lspinfo", "man", "notify", "qf", "query" },
  desc = "Close utility windows with q",
  callback = function(args)
    vim.bo[args.buf].buflisted = false
    vim.keymap.set("n", "q", "<Cmd>close<CR>", { buffer = args.buf, silent = true })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = "*",
  desc = "Enable available Tree-sitter parsers",
  callback = function(args)
    if vim.api.nvim_buf_line_count(args.buf) > 10000 then return end
    pcall(vim.treesitter.start, args.buf)
  end,
})
