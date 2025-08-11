local mini_files = {
    "echasnovski/mini.files",
    tag = "v0.16.0",
    lazy = true,
    keys = {
    { "-", function() require("mini.files").open() end, desc = "Open mini.files" },
  },
    opts = {
        windows = {
          preview = true,
          width_focus = 100,
          width_nofocus = 30,
          width_preview = 100,
          height_focus = 20,
          height_nofocus = 15,
          border = "rounded",
        },
        mappings = {
            close       = 'q',
            go_in       = '<CR>',
            go_in_plus  = '<CR>',
            go_out      = '-',
            go_out_plus = 'H',
            mark_goto   = "'",
            mark_set    = 'm',
            reset       = '<BS>',
            reveal_cwd  = '@',
            show_help   = 'g?',
            synchronize = ':w',
            trim_left   = '<',
            trim_right  = '>',
        },
        content = {
          filter = function(entry)
            return not entry.name:match("^%.") -- hide dotfiles
          end
        },
        options = {
          use_as_default_explorer = true,
        },
      },
    config = function(_, opts)
        local mf = require("mini.files")
        mf.setup(opts)

        -- Set it to open using `-`
        local function open_files(path)
            mf.open(path or vim.api.nvim_buf_get_name(0))
            mf.reveal_cwd()
        end

        vim.keymap.set("n", "-", function()
            open_files()
        end, { desc = "Open mini.files" })

        -- Manage hidden files
        local show_hidden = false
        vim.keymap.set('n', 'g.', function()
          show_hidden = not show_hidden
          mf.refresh({ content = {
            filter = show_hidden and nil or function(entry)
              return not entry.name:match("^%.")
            end
          }})
        end, { desc = 'Toggle hidden files in mini.files' })
    end,
}

return {
    mini_files
}
