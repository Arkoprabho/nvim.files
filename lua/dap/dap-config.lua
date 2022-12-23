local icons = require("globals.icons")
vim.fn.sign_define("DapBreakpoint", { text = icons.ui.Circle, texthl = "", linehl = "", numhl = "" })

require("dap.csharp").setup()
require("dap.python")
require("dap.kotlin").setup()
