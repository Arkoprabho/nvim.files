require("gen").setup(
	-- Custom Parameters (with defaults)
	{
		"David-Kunz/gen.nvim",
		opts = {
			model = "codellama", -- The default model to use.
			display_mode = "split", -- The display mode. Can be "float" or "split".
			show_prompt = false, -- Shows the Prompt submitted to Ollama.
			show_model = false, -- Displays which model you are using at the beginning of your chat session.
			no_auto_close = false, -- Never closes the window automatically.
			debug = true,
		},
	}
)

require("gen").prompts["DevOps"] = {
	prompt = "You are a senior devops engineer, acting as an assistant. You offer help with cloud technologies like: Terraform, AWS, Kubernetes, GoLang. You answer with code examples when possible. $input:\n$text",
	replace = false,
	model = "codellama",
}

vim.keymap.set({ "n", "v" }, "<leader>]", ":Gen<CR>")
