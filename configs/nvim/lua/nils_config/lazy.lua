vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = "\\" -- Same for `maplocalleader`
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- {
	-- 	"folke/edgy.nvim",
	-- },
	-- {
	-- 	"folke/edgy.nvim",
	-- 	event = "VeryLazy",
	-- 	opts = {
	-- 		bottom = {
	-- 			"Trouble",
	-- 			{ ft = "qf", title = "QuickFix" },
	-- 			{
	-- 				ft = "help",
	-- 				size = { height = 20 },
	-- 				-- only show help buffers
	-- 				filter = function(buf)
	-- 					return vim.bo[buf].buftype == "help"
	-- 				end,
	-- 			},
	-- 		},
	-- 	},
	-- },
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"stevearc/conform.nvim",
	},
	{
		"stevearc/oil.nvim",
	},
	{ "rose-pine/neovim", name = "rose-pine" },
	{
		"windwp/nvim-autopairs",
	},
	{
		"numToStr/Comment.nvim",
	},
	{
		"lewis6991/gitsigns.nvim",
	},
	{
		"brenoprata10/nvim-highlight-colors",
	},
	{
		"neovim/nvim-lspconfig",
	},
	{
		"VonHeikemen/lsp-zero.nvim",
	},
	{
		"echasnovski/mini.nvim",
	},
	{
		"nvim-treesitter/nvim-treesitter",
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"onsails/lspkind.nvim",
		},
	},
	{
		"L3MON4D3/LuaSnip",
		-- tag = "V2.*",
		build = "LUA_LDLIBS=-lluajit5.1 make install_jsregexp",
	},
	{
		"rebelot/kanagawa.nvim",
	},
	{
		"projekt0n/github-nvim-theme",
	},
	{
		"nvim-tree/nvim-web-devicons",
	},
	{
		"github/copilot.vim",
	},
	-- {
	-- 	"MeanderingProgrammer/markdown.nvim",
	-- 	name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
	-- 	dependencies = { "nvim-treesitter/nvim-treesitter" },
	-- 	config = function()
	-- 		require("render-markdown").setup({
	-- 			fat_tables = false,
	-- 		})
	-- 	end,
	-- },
	{
		"cdmill/neomodern.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("neomodern").setup({
				-- optional configuration here
				style = "iceclimber",
				-- style = "darkforest",
			})
			require("neomodern").load()
		end,
	},
	-- {
	-- 	"unisonweb/unison",
	-- 	branch = "trunk",
	-- 	config = function(plugin)
	-- 		vim.opt.rtp:append(plugin.dir .. "/editor-support/vim")
	-- 		require("lazy.core.loader").packadd(plugin.dir .. "/editor-support/vim")
	-- 	end,
	-- 	init = function(plugin)
	-- 		require("lazy.core.loader").ftdetect(plugin.dir .. "/editor-support/vim")
	-- 	end,
	-- },
	-- {
	-- 	"iamcco/markdown-preview.nvim",
	-- 	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	-- 	ft = { "markdown" },
	-- 	build = function()
	-- 		vim.fn["mkdp#util#install"]()
	-- 	end,
	-- },
})
