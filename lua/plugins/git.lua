---@type LazySpec
return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    current_line_blame = false,
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns
      local map = function(lhs, rhs, desc)
        vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = desc })
      end
      map("]h", gs.next_hunk, "Next git hunk")
      map("[h", gs.prev_hunk, "Previous git hunk")
      map("<Leader>gp", gs.preview_hunk, "Preview git hunk")
      map("<Leader>gr", gs.reset_hunk, "Reset git hunk")
      map("<Leader>gb", gs.toggle_current_line_blame, "Toggle git blame")
    end,
  },
}
