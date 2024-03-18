local status_ok, harpoon = pcall(require, "harpoon")
if not status_ok then
	return
end

harpoon.setup({})

local map = vim.keymap.set

map("n", "<leader>ha", function()
	harpoon:list():append()
end)

-- Toggle previous & next buffers stored within Harpoon list
map("n", "<leader>hp", function()
	harpoon:list():prev()
end)
map("n", "<leader>hn", function()
	harpoon:list():next()
end)
map("n", "<C-e>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)
-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end

	require("telescope.pickers")
		.new({}, {
			prompt_title = "Harpoon",
			finder = require("telescope.finders").new_table({
				results = file_paths,
			}),
			previewer = conf.file_previewer({}),
			sorter = conf.generic_sorter({}),
		})
		:find()
end

map("n", "<leader>H", function()
	toggle_telescope(harpoon:list())
end, { desc = "Open harpoon window" })
