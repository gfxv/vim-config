return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  keys = {
    -- { '<leader><Tab>', ':Neotree toggle float<CR>', silent = true, desc = 'Float File Explorer' },
    { '<leader><Tab>', ':Neotree reveal float<CR>', silent = true, desc = 'Float File Explorer' },
  },
  event = 'VeryLazy',
  lazy = false, -- neo-tree will lazily load itself
  ---@module "neo-tree"
  ---@type neotree.Config?
  opts = {
    -- fill any relevant options here
  },
  config = function()
    require('neo-tree').setup {
      close_if_last_window = true,
      popup_border_style = 'single',
      enable_git_status = true,
      enable_modified_markers = true,
      enable_diagnostics = true,
      sort_case_insensitive = true,
      default_component_configs = {
        indent = {
          with_markers = true,
          with_expanders = true,
        },
        modified = {
          symbol = ' ',
          highlight = 'NeoTreeModified',
        },
        git_status = {
          symbols = {
            -- Change type
            added = '',
            deleted = '',
            modified = '',
            renamed = '',
            -- Status type
            untracked = '',
            ignored = '',
            unstaged = '',
            staged = '',
            conflict = '',
          },
        },
      },
      window = {
        position = 'float',
        width = 35,
      },
      source_selector = {
        winbar = true,
        sources = {
          { source = 'filesystem', display_name = '   Files ' },
          { source = 'buffers', display_name = '   Bufs ' },
          { source = 'git_status', display_name = '   Git ' },
        },
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
        },
      },
    }
  end,
}
