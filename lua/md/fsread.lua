local FSREAD = {
  'nullchilly/fsread.nvim',
  cmd = { "FSRead", "FSClear", "FSToggle" },
  keys = { "<C-r>", "<cmd>FSToggle<CR>" }
}

function FSREAD.config()
  vim.g.flow_strength = 0.7 -- low: 0.3, middle: 0.5, high: 0.7 (default)
  vim.api.nvim_set_hl(0, "FSPrefix", { fg = "#cdd6f4" })
  vim.api.nvim_set_hl(0, "FSSuffix", { fg = "#6C7086" })
  vim.keymap.set("n", "<C-r>", "<cmd>FSToggle<CR>")
end

return FSREAD
