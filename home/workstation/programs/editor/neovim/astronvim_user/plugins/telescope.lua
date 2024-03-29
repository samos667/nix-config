return {
  -- Undo tree
  { "debugloop/telescope-undo.nvim" },
  -- An advanced git search extension for Telescope
  {
    "aaronhallaert/advanced-git-search.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      -- to show diff splits and open commits in browser
      "tpope/vim-fugitive",
      -- to open commits in browser with fugitive
      "tpope/vim-rhubarb",
      -- optional: to replace the diff from fugitive with diffview.nvim
      -- (fugitive is still needed to open in browser)
      "sindrets/diffview.nvim",
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    init = function()
      -- 1. Disable highlighting for certain filetypes
      -- 2. Ignore files larger than a certain filesize
      local previewers = require "telescope.previewers"

      local _bad = { ".*%.csv", ".*%.min.js" } -- Put all filetypes that slow you down in this array
      local filesize_threshold = 300 * 1024    -- 300KB
      local bad_files = function(filepath)
        for _, v in ipairs(_bad) do
          if filepath:match(v) then return false end
        end
        return true
      end

      local new_maker = function(filepath, bufnr, opts)
        opts = opts or {}
        if opts.use_ft_detect == nil then opts.use_ft_detect = true end

        -- 1. Check if the file is in the bad_files array, and if so, don't highlight it
        opts.use_ft_detect = opts.use_ft_detect == false and false or bad_files(filepath)

        -- 2. Check the file size, and ignore it if it's too big(preview nothing).
        filepath = vim.fn.expand(filepath)
        vim.loop.fs_stat(filepath, function(_, stat)
          if not stat then return end
          if stat.size > filesize_threshold then
            return
          else
            previewers.buffer_previewer_maker(filepath, bufnr, opts)
          end
        end)
      end

      require("telescope").setup {
        defaults = {
          buffer_previewer_maker = new_maker,
        },
        extensions = {
          advanced_git_search = {
            diff_plugin = "diffview",
          },
        },
      }
      require("telescope").load_extension "advanced_git_search"
    end,
  },
}
