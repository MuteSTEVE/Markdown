local ZEN = {
  'folke/zen-mode.nvim',
}

function ZEN.config()
  local status_ok, zen = pcall(require, 'zen-mode')
  if not status_ok then
    return
  end

  zen.setup({})
end
