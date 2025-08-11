local mini_files = {
    "echasnovski/mini.files",
    tag = "v0.16.0",
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
            synchronize = '=',
            trim_left   = '<',
            trim_right  = '>',
        },
        options = {
          use_as_default_explorer = true,
        },
      },
    config = function(_, opts)
        local mf = require("mini.files")
        mf.setup(opts)
        local function open_files(path)
            mf.open(path or vim.api.nvim_buf_get_name(0))
            mf.reveal_cwd()
        end

        vim.keymap.set("n", "-", function()
            open_files()
        end, { desc = "Open mini.files" })
    end,
}

return {
    mini_files
}
