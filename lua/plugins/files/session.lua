local session = {
    {
        -- No plugin dependency, pure mksession
        "nvim-lua/plenary.nvim", -- not strictly needed, just placeholder for lazy spec
        lazy = false,
        config = function()
            -- Session file path in cwd
            local function session_path()
                return vim.fn.getcwd() .. "/.vim_session"
            end

            -- Configure what to save in the session
            vim.o.sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

            -- Save session
            local function save_session()
                pcall(vim.cmd, "silent! mksession! " .. vim.fn.fnameescape(session_path()))
            end

            -- Load session and re-enable syntax/filetype detection
            local function load_session()
                local path = session_path()
                if vim.fn.filereadable(path) == 1 then
                    pcall(vim.cmd, "silent! source " .. vim.fn.fnameescape(path))
                    -- Fix lost highlighting in last buffer
                    vim.schedule(function()
                        vim.cmd("syntax on")
                        vim.cmd("filetype detect")
                    end)
                end
            end

            -- Save before exit
            vim.api.nvim_create_autocmd("VimLeavePre", { callback = save_session })

            -- Restore on startup if no files passed or stdin
            vim.api.nvim_create_autocmd("VimEnter", {
                callback = function()
                    if vim.fn.argc() > 0 or vim.fn.line2byte("$") ~= -1 then
                        return
                    end
                    load_session()
                end,
            })
        end,
    },
}
return {
    session,
}
