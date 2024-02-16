local TWILLIGHT = {
  'folke/twilight.nvim'
}

function TWILLIGHT.config()
  local status_ok, twilight = pcall(require, 'twilight')
  if not status_ok then
    return
  end
  twilight.setup({})
end
