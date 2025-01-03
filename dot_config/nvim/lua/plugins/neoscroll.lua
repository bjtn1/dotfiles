return {
  "karb94/neoscroll.nvim",
  config = function ()
    local neoscroll = require("neoscroll")
    local t = {}
    -- source:
    -- https://github.com/karb94/neoscroll.nvim
    -- Syntax: t[keys] = {function, {function arguments}}
    t['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '250'}}
    t['<C-d>'] = {'scroll', { 'vim.wo.scroll', 'true', '250'}}
    t['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '450'}}
    t['<C-f>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '450'}}
    t['<C-y>'] = {'scroll', {'-0.10', 'false', '100'}}
    t['<C-e>'] = {'scroll', { '0.10', 'false', '100'}}
    t['zt']    = {'zt', {'250'}}
    t['zz']    = {'zz', {'250'}}
    t['zb']    = {'zb', {'250'}}
    -- neoscroll.setup {}
    -- require('neoscroll.config').set_mappings(t)
    neoscroll.setup({
      mappings = t,
    })
  end
}
