local status_ok, auto_session = pcall(require, "auto-session")
if not status_ok then
	return
end

local l_status_ok, session_lens = pcall(require, "session-lens")
if not l_status_ok then
	return
end

local opts = {}

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

session_lens.setup({
	path_display = { "shorten" },
	-- theme_conf = { border = false },
	previewer = false,
	prompt_title = "Sessions",
})

auto_session.setup(opts)
