local sessions =  {
  "echasnovski/mini.sessions",
  version = "*",
  lazy = false, -- must load at startup to restore sessions
  opts = {
    directory = vim.fn.stdpath("data") .. "/sessions",
    autoread = true,
    autosave = true,
  },
  config = function(_, opts)
    local sessions = require("mini.sessions")
    sessions.setup(opts)

    local function session_name()
      return vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
    end

    -- Save session before exiting
    vim.api.nvim_create_autocmd("VimLeavePre", {
      callback = function()
        sessions.write(session_name(), { force = true })
      end,
    })

    -- Restore session on startup if appropriate
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        -- Skip if:
        -- 1. Files were passed as args
        -- 2. Reading from stdin
        -- 3. In a git commit/rebase/merge message
        if
          vim.fn.argc() > 0
          or vim.fn.line2byte("$") ~= -1 -- stdin check
          or vim.fn.getcwd():match(".git")
        then
          return
        end

        sessions.read(session_name(), { force = true })
      end,
    })
  end,
}

return { sessions }
