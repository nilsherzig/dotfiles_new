require("mini.align").setup()
-- require("mini.completion").setup()
-- require("mini.notify").setup()
require("mini.pairs").setup()
require("mini.pick").setup()
require("mini.bufremove").setup()
-- require("mini.indentscope").setup()

local MiniStatusline = require("mini.statusline")
MiniStatusline.setup({
	use_icons = false,
	content = {
		active = function()
			-- local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
			local mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
			local git = MiniStatusline.section_git({ trunc_width = 75 })
			local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
			local filename = MiniStatusline.section_filename({ trunc_width = 140 })
			-- local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
			-- local location = MiniStatusline.section_location({ trunc_width = 75 })
			local search = MiniStatusline.section_searchcount({ trunc_width = 75 })

			return MiniStatusline.combine_groups({
				-- { hl = mode_hl, strings = { mode } },
				"%<", -- Mark general truncate point
				{ hl = "MiniStatuslineFilename", strings = { git, filename } },
				"%=", -- End left alignment
				-- { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
				-- { hl = mode_hl, strings = { search, location } },
				{ hl = "MiniStatuslineDevinfo", strings = { diagnostics } },
				{ hl = mode_hl, strings = { search } },
			})
		end,
		-- inactive = nil,
	},
})
require("mini.tabline").setup()
