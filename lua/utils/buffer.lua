local M = {}

function M.close(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  if vim.bo[bufnr].modified then
    local choice = vim.fn.confirm("Save changes before closing?", "&Save\n&Discard\n&Cancel", 1)
    if choice == 1 then
      vim.api.nvim_buf_call(bufnr, function() vim.cmd.write() end)
    elseif choice ~= 2 then
      return
    end
  end

  local listed = vim.tbl_filter(function(buf)
    return vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted and buf ~= bufnr
  end, vim.api.nvim_list_bufs())

  if bufnr == vim.api.nvim_get_current_buf() and #listed > 0 then
    vim.api.nvim_set_current_buf(listed[#listed])
  end
  vim.api.nvim_buf_delete(bufnr, { force = true })
end

return M
