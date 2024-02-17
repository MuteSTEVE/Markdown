local ZEN = {
  'folke/zen-mode.nvim',
  keys = { "<leader>z", "<cmd>ZenMode<CR>" },
  ft = "markdown",
  cmd = "ZenMode",
}

function ZEN.config()
  local status_ok, zen = pcall(require, 'zen-mode')
  if not status_ok then
    return
  end
  zen.setup({
    window = {
      options = {
        number = false,
        relativenumber = false,
        cursorline = false,
        cursorcolumn = false,
        foldcolumn = "0",
        list = false,
      }
    },
    vim.keymap.set('n', "<leader>z", "<cmd>ZenMode<CR>", {})
  })
end

return ZEN
