local augroup = vim.api.nvim_create_augroup("RelativeNumbersOpenCodeOutput", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	group = augroup,
	pattern = "*",
	callback = function(event)
		local ft = vim.api.nvim_buf_get_option(event.buf, "filetype")
		if ft == "opencode_output" then
			vim.api.nvim_buf_set_option(event.buf, "relativenumber", true)
		end
	end,
})

vim.api.nvim_create_autocmd({ "BufLeave" }, {
	group = augroup,
	pattern = "*",
	callback = function(event)
		local ft = vim.api.nvim_buf_get_option(event.buf, "filetype")
		if ft == "opencode_output" then
			vim.api.nvim_buf_set_option(event.buf, "relativenumber", false)
		end
	end,
})
