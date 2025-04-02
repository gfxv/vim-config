local harpoon = require 'harpoon'

harpoon:setup {}

-- basic telescope configuration
local conf = require('telescope.config').values
local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require('telescope.pickers')
    .new({}, {
      prompt_title = 'Harpoon',
      finder = require('telescope.finders').new_table {
        results = file_paths,
      },
      previewer = conf.file_previewer {},
      sorter = conf.generic_sorter {},
    })
    :find()
end

-- TODO: add delete and replace window

vim.keymap.set('n', '<leader>ha', function()
  harpoon:list():add()
end, { desc = '[h]arpoon [a]dd' })

vim.keymap.set('n', '<leader>hw', function()
  toggle_telescope(harpoon:list())
end, { desc = 'Open [h]arpoon [w]indow' })

vim.keymap.set('n', '<leader>1', function()
  harpoon:list():select(1)
end)
vim.keymap.set('n', '<leader>2', function()
  harpoon:list():select(2)
end)
vim.keymap.set('n', '<leader>3', function()
  harpoon:list():select(3)
end)
vim.keymap.set('n', '<leader>4', function()
  harpoon:list():select(4)
end)

vim.keymap.set('n', '<leader>hn', function()
  harpoon:list():prev()
end, { desc = '[h]arpoon [n]ext' })
vim.keymap.set('n', '<leader>hp', function()
  harpoon:list():next()
end, { desc = '[h]arpoon [p]rev' })
