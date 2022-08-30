local status_ok, auto_session = pcall(require, "auto-session")
if not status_ok then
	return
end

local l_status_ok, session_lens = pcall(require, "session-lens")
if not l_status_ok then
	return
end

local opts = {
	log_level = "error",

	cwd_change_handling = {
		restore_upcoming_session = true, -- already the default, no need to specify like this, only here as an example
		pre_cwd_changed_hook = nil, -- already the default, no need to specify like this, only here as an example
		post_cwd_changed_hook = function() -- example refreshing the lualine status line _after_ the cwd changes
			require("lualine").refresh() -- refresh lualine so the new session name is displayed in the status bar
		end,
	},
}

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

session_lens.setup({
	path_display = { "shorten" },
	-- theme_conf = { border = false },
	previewer = false,
	prompt_title = "Sessions",
})

auto_session.setup(opts)
