return {
  {
    'folke/zen-mode.nvim',
    dependencies = 'folke/twilight.nvim',
    keys = { "<leader>z", "<cmd>ZenMode<CR>" },
    cmd = "ZenMode",
    config = function()
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
        plugins = {
          options = { enabled = true, ruler = false, showcmd = false },
          twilight = { enabled = true },
          gitsigns = { enabled = false },
          tmux = { enabled = false }
        }
      })
      vim.keymap.set('n', "<leader>z", "<cmd>ZenMode<CR>", {})
    end
  },
}
