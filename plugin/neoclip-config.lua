require'neoclip'.setup{
    enable_persistent_history = true,
    keys = {
        telescope = {
          i = {
            select = '<CR>',
            paste = '<C-p>',
            -- paste = { 'p', '<c-p>' },
            paste_behind = '<C-P>',
            replay = '<C-q>',  -- replay a macro
            delete = '<C-d>',  -- delete an entry
            custom = {},
          },
          n = {
            select = '<CR>',
            paste = '<CR>',
            paste_behind = 'P',
            replay = 'q',
            delete = 'd',
            custom = {},
          },
        }
    }
}
