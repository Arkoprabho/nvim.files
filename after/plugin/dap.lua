local dap_config = {}

-- Debugger installation location
local HOME = os.getenv("HOME")
local dap = require("dap")

function dap_config.csharp()
	local DEBUGGER_LOCATION = HOME .. "/.local/share/nvim/mason/packages/netcoredbg"

	-- Adapter configuration
	dap.adapters.coreclr = {
		type = "executable",
		command = DEBUGGER_LOCATION .. "/netcoredbg",
		args = { "--interpreter=vscode" },
	}

	-- Configuration
	dap.configurations.cs = {
		{
			type = "coreclr",
			name = "launch - netcoredbg",
			request = "launch",
			program = function()
				return vim.fn.input("Path to DLL > ", vim.fn.getcwd() .. "/bin/Debug/", "file")
			end,
		},
	}
end

function dap_config.kotlin()
	local DEBUGGER_LOCATION = HOME .. "/.local/share/nvim/kotlin-debug-adapter"

	-- Adapter configuration
	dap.adapters.kotlin = {
		type = "executable",
		command = DEBUGGER_LOCATION .. "/adapter/build/install/adapter/bin/kotlin-debug-adapter",
		args = { "--interpreter=vscode" },
	}

	-- Configuration
	dap.configurations.kotlin = {
		type = "kotlin",
		name = "launch - kotlin",
		request = "launch",
		projectRoot = vim.fn.getcwd() .. "/app",
		mainClass = function()
			-- return vim.fn.input("Path to main class > ", "myapp.sample.app.AppKt", "file")
			return vim.fn.input("Path to main class > ", "", "file")
		end,
	}
end

local icons = require("globals.icons")
vim.fn.sign_define("DapBreakpoint", { text = icons.ui.Circle, texthl = "", linehl = "", numhl = "" })

dap_config.csharp()
require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
dap_config.kotlin()

-- Mappings

local map = vim.keymap.set
map("n", "<F12>", dap.close)
map("n", "<F11>", dap.step_into)
map("n", "<F10>", dap.step_over)
map("n", "<F5>", dap.continue)
map("n", "<leader>bp", dap.toggle_breakpoint)
