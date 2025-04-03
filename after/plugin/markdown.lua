local md = require 'render-markdown'

vim.keymap.set('n', '<leader>mde', md.enable, { desc = '[m]ark[d]own [e]nable' })
vim.keymap.set('n', '<leader>mdd', md.disable, { desc = '[m]ark[d]own [d]isable' })
