local opencode = {
    "sudo-tee/opencode.nvim",
    commit = "2dba73d61d2c0f00f67eba51ba4110d94dd97e75",
    keys = {
        { "<leader>.", "<cmd>Opencode<cr>", desc = "OpenCode" },
    },
    config = function()
        require("opencode").setup({
            preferred_picker = "telescope",
            preferred_completion = "nvim-cmp",
            keymap = {
                editor = {
                    ["<leader>og"] = { "toggle" },           -- Open opencode. Close if opened
                    ["<leader>oi"] = { "open_input" },       -- Opens and focuses on input window on insert mode
                    ["<leader>oI"] = { "open_input_new_session" }, -- Opens and focuses on input window on insert mode. Creates a new session
                    ["<leader>oo"] = { "open_output" },      -- Opens and focuses on output window
                    ["<leader>ot"] = { "toggle_focus" },     -- Toggle focus between opencode and last window
                    ["<leader>oT"] = { "timeline" },         -- Display timeline picker to navigate/undo/redo/fork messages
                    ["<leader>oq"] = { "close" },            -- Close UI windows
                    ["<leader>os"] = { "select_session" },   -- Select and load a opencode session
                    ["<leader>oR"] = { "rename_session" },   -- Rename current session
                    ["<leader>op"] = { "configure_provider" }, -- Quick provider and model switch from predefined list
                    ["<leader>oV"] = { "configure_variant" }, -- Switch model variant for the current model
                    ["<leader>oz"] = { "toggle_zoom" },      -- Zoom in/out on the Opencode windows
                    ["<leader>ov"] = { "paste_image" },      -- Paste image from clipboard into current session
                    ["<leader>od"] = { "diff_open" },        -- Opens a diff tab of a modified file since the last opencode prompt
                    ["<leader>o]"] = { "diff_next" },        -- Navigate to next file diff
                    ["<leader>o["] = { "diff_prev" },        -- Navigate to previous file diff
                    ["<leader>oc"] = { "diff_close" },       -- Close diff view tab and return to normal editing
                    ["<leader>ora"] = { "diff_revert_all_last_prompt" }, -- Revert all file changes since the last opencode prompt
                    ["<leader>ort"] = { "diff_revert_this_last_prompt" }, -- Revert current file changes since the last opencode prompt
                    ["<leader>orA"] = { "diff_revert_all" }, -- Revert all file changes since the last opencode session
                    ["<leader>orT"] = { "diff_revert_this" }, -- Revert current file changes since the last opencode session
                    ["<leader>orr"] = { "diff_restore_snapshot_file" }, -- Restore a file to a restore point
                    ["<leader>orR"] = { "diff_restore_snapshot_all" }, -- Restore all files to a restore point
                    ["<leader>ox"] = { "swap_position" },    -- Swap Opencode pane left/right
                    ["<leader>ott"] = { "toggle_tool_output" }, -- Toggle tools output (diffs, cmd output, etc.)
                    ["<leader>otr"] = { "toggle_reasoning_output" }, -- Toggle reasoning output (thinking steps)
                    ["<leader>o/"] = { "quick_chat", mode = { "n", "x" } }, -- Open quick chat input with selection context in visual mode or current line context in normal mode
                },
                input_window = {
                    ["<S-cr>"] = { "submit_input_prompt", mode = { "n", "i" } }, -- Submit prompt (normal mode and insert mode)
                    ["<esc>"] = { "close" },                      -- Close UI windows
                    ["<C-c>"] = { "cancel" },                     -- Cancel opencode request while it is running
                    ["~"] = { "mention_file", mode = "i" },       -- Pick a file and add to context. See File Mentions section
                    ["@"] = { "mention", mode = "i" },            -- Insert mention (file/agent)
                    ["/"] = { "slash_commands", mode = "i" },     -- Pick a command to run in the input window
                    ["#"] = { "context_items", mode = "i" },      -- Manage context items (current file, selection, diagnostics, mentioned files)
                    ["<M-v>"] = { "paste_image", mode = "i" },    -- Paste image from clipboard as attachment
                    ["<C-i>"] = { "focus_input", mode = { "n", "i" } }, -- Focus on input window and enter insert mode at the end of the input from the output window
                    ["<tab>"] = { "toggle_pane", mode = { "n", "i" } }, -- Toggle between input and output panes
                    ["<up>"] = { "prev_prompt_history", mode = { "n", "i" } }, -- Navigate to previous prompt in history
                    ["<down>"] = { "next_prompt_history", mode = { "n", "i" } }, -- Navigate to next prompt in history
                    ["<M-m>"] = { "switch_mode" },                -- Switch between modes (build/plan)
                    ["<M-r>"] = { "cycle_variant", mode = { "n", "i" } }, -- Cycle through available model variants
                },
                output_window = {
                    ["<esc>"] = { "close" },             -- Close UI windows
                    ["<C-c>"] = { "cancel" },            -- Cancel opencode request while it is running
                    ["]]"] = { "next_message" },         -- Navigate to next message in the conversation
                    ["[["] = { "prev_message" },         -- Navigate to previous message in the conversation
                    ["<tab>"] = { "toggle_pane", mode = { "n", "i" } }, -- Toggle between input and output panes
                    ["i"] = { "focus_input", "n" },      -- Focus on input window and enter insert mode at the end of the input from the output window
                    ["<M-r>"] = { "cycle_variant", mode = { "n" } }, -- Cycle through available model variants
                    ["<leader>oS"] = { "select_child_session" }, -- Select and load a child session
                    ["<leader>oD"] = { "debug_message" }, -- Open raw message in new buffer for debugging
                    ["<leader>oO"] = { "debug_output" }, -- Open raw output in new buffer for debugging
                    ["<leader>ods"] = { "debug_session" }, -- Open raw session in new buffer for debugging
                },
                session_picker = {
                    rename_session = { "<C-r>" }, -- Rename selected session in the session picker
                    delete_session = { "<C-d>" }, -- Delete selected session in the session picker
                    new_session = { "<C-s>" }, -- Create and switch to a new session in the session picker
                },
                timeline_picker = {
                    undo = { "<C-u>", mode = { "i", "n" } }, -- Undo to selected message in timeline picker
                    fork = { "<C-f>", mode = { "i", "n" } }, -- Fork from selected message in timeline picker
                },
                history_picker = {
                    delete_entry = { "<C-d>", mode = { "i", "n" } }, -- Delete selected entry in the history picker
                    clear_all = { "<C-X>", mode = { "i", "n" } }, -- Clear all entries in the history picker
                },
                model_picker = {
                    toggle_favorite = { "<C-f>", mode = { "i", "n" } },
                },
                mcp_picker = {
                    toggle_connection = { "<C-t>", mode = { "i", "n" } }, -- Toggle MCP server connection in the MCP picker
                },
                ui = {
                    window_width = 0.30,
                },
            },
        })
    end,
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "MeanderingProgrammer/render-markdown.nvim",
            version = "v8.11.0",
            opts = {
                anti_conceal = { enabled = false },
                file_types = { "markdown", "opencode_output" },
            },
            ft = { "markdown", "Avante", "copilot-chat", "opencode_output" },
        },
        -- Optional, for file mentions and commands completion, pick only one
        "hrsh7th/nvim-cmp",

        -- Optional, for file mentions picker, pick only one
        {
            "folke/snacks.nvim",
            commit = "a4e46becca45eb65c73a388634b1ce8aad629ae0",
        },
        "nvim-telescope/telescope.nvim",
    },
}

return {
    opencode,
}
