local sessions = {
  "echasnovski/mini.sessions",
  version = "*",
  lazy = false, -- must load at startup
  opts = {
    directory = vim.fn.stdpath("data") .. "/sessions",
    autoread = true,
    autosave = true,
  },
  config = function(_, opts)
    local sessions = require("mini.sessions")
    sessions.setup(opts)

    -- Use full path escaped to avoid collisions
    local function session_name()
      -- Replace path separators with '__' for uniqueness
      return vim.fn.getcwd():gsub("/", "%%"):gsub("\\", "%%")
    end

    -- Save session before exiting
    vim.api.nvim_create_autocmd("VimLeavePre", {
      callback = function()
        pcall(sessions.write, session_name(), { force = true })
      end,
    })

    -- Save session when changing directories
    vim.api.nvim_create_autocmd("DirChanged", {
      callback = function()
        pcall(sessions.write, session_name(), { force = true })
      end,
    })

    -- Restore session on startup if no files are passed
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        if
          vim.fn.argc() > 0 -- files passed
          or vim.fn.line2byte("$") ~= -1 -- stdin
          or vim.fn.getcwd():match("%.git") -- inside .git
        then
          return
        end
        pcall(sessions.read, session_name(), { force = true })
      end,
    })
  end,
}

return { sessions }
