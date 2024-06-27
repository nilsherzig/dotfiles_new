vim.g.background = "dark"

-- require("github-theme").setup({
-- 	options = {
-- 		transparent = false, -- use terminal background color
-- 	},
-- })

-- vim.cmd("colorscheme github_dark_default")

-- vim.cmd("highlight TelescopeBorder guifg=#5C6370")
-- vim.cmd("highlight TelescopePromptBorder guifg=#5C6370")
-- vim.cmd("highlight TelescopeResultsBorder guifg=#5C6370")
-- vim.cmd("highlight TelescopePreviewBorder guifg=#5C6370")
--
-- vim.cmd("highlight StatusLine guibg=#21262D")
-- vim.cmd("highlight StatusLine guifg=#8b949e")
--
-- vim.cmd("highlight MiniTablineFill guibg=#241F31")
-- vim.cmd("highlight MiniTablineCurrent cterm=NONE gui=NONE guifg=#241F31 guibg=#1A5FB4")
-- vim.cmd("highlight MiniTablineHidden guifg=#8b949e guibg=#21262D")
--
-- vim.cmd("highlight MiniTablineModifiedCurrent cterm=italic gui=italic guifg=#241F31 guibg=#1A5FB4")
-- vim.cmd("highlight MiniTablineModifiedHidden cterm=italic gui=italic guifg=#8b949e guibg=#21262D")

-- vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")

require("rose-pine").setup({
	variant = "auto", -- auto, main, moon, or dawn
	dark_variant = "main", -- main, moon, or dawn
	dim_inactive_windows = false,
	extend_background_behind_borders = true,

	enable = {
		terminal = true,
		legacy_highlights = false, -- Improve compatibility for previous versions of Neovim
		migrations = true, -- Handle deprecated options automatically
	},

	styles = {
		bold = true,
		italic = true,
		transparency = true,
	},

	groups = {
		border = "muted",
		link = "iris",
		panel = "surface",

		error = "love",
		hint = "iris",
		info = "foam",
		note = "pine",
		todo = "rose",
		warn = "gold",

		git_add = "foam",
		git_change = "rose",
		git_delete = "love",
		git_dirty = "rose",
		git_ignore = "muted",
		git_merge = "iris",
		git_rename = "pine",
		git_stage = "iris",
		git_text = "rose",
		git_untracked = "subtle",

		h1 = "iris",
		h2 = "foam",
		h3 = "rose",
		h4 = "gold",
		h5 = "pine",
		h6 = "foam",
	},

	highlight_groups = {
		-- Comment = { fg = "foam" },
		-- VertSplit = { fg = "muted", bg = "muted" },
	},

	before_highlight = function(group, highlight, palette)
		-- Disable all undercurls
		-- if highlight.undercurl then
		--     highlight.undercurl = false
		-- end
		--
		-- Change palette colour
		-- if highlight.fg == palette.pine then
		--     highlight.fg = palette.foam
		-- end
	end,
})

-- vim.cmd("colorscheme neomodern")
-- vim.cmd("colorscheme rose-pine")
