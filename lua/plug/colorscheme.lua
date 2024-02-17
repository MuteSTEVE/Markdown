local GITHUB = {
  'projekt0n/github-nvim-theme',
  lazy = false,
  priority = 1000
}
function GITHUB.config()
  local github_ok, github = pcall(require, "github-theme")
  if not github_ok then
    return
  end
  github.setup({})
  vim.cmd('colorscheme github_light')
end

return GITHUB
