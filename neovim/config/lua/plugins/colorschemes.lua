return {
	{ -- You can easily change to a different colorscheme.
		-- Change the name of the colorscheme plugin below, and then
		-- change the command in the config to whatever the name of that colorscheme is.
		--
		-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
		"folke/tokyonight.nvim",
		priority = 1000, -- Make sure to load this before all the other start plugins.
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("tokyonight").setup({})

			-- Load the colorscheme here.
			-- Like many other themes, this one has different styles, and you could load
			-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
		end,
	},
	{
		"Mofiqul/dracula.nvim",
		priority = 1000, -- Make sure to load this before all the other start plugins.
		config = function()
			require("dracula").setup({
				styles = {
					comments = { italic = false }, -- Disable italics in comments
				},
			})
			vim.cmd.colorscheme("dracula")
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		priority = 1000, -- Load before other plugins
	},
	{
		"tanvirtin/monokai.nvim",
		priority = 1000, -- Load before other plugins
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000, -- Load before other plugins
	},
	{
		"shaunsingh/nord.nvim",
		priority = 1000, -- Load before other plugins
	},
	{
		"sainnhe/everforest",
		priority = 1000, -- Load before other plugins
	},
	{
		"EdenEast/nightfox.nvim",
		priority = 1000, -- Load before other plugins
	},
	{
		"navarasu/onedark.nvim",
		priority = 1000, -- Load before other plugins
	},
	{
		"olimorris/onedarkpro.nvim",
		priority = 1000, -- Load before other plugins
	},
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"zaldih/themery.nvim",
		lazy = false,
		config = function()
			-- Set cursor color after any colorscheme loads
			vim.api.nvim_create_autocmd("ColorScheme", {
				pattern = "*",
				callback = function()
					vim.api.nvim_set_hl(0, "Cursor", { fg = "#000000", bg = "#00FF00" })
					vim.api.nvim_set_hl(0, "iCursor", { fg = "#000000", bg = "#00BFFF" })
				end,
			})

			require("themery").setup({
				-- add the config here
				livePreview = true,
				themes = {
					"dracula",
					"kanagawa",
					"tokyonight",
					"tokyonight-storm",
					"tokyonight-moon",
					"catppuccin",
					"gruvbox",
					"nord",
					"everforest",
					"nightfox",
					"onedark",
					"onedark_vivid",
					"onedark_dark",
					"cyberdream",
					"vaporwave",
				},
			})
			-- vim.cmd.colorscheme("dracula") -- sets the default colorscheme

			-- Apply cursor highlight for the initial colorscheme
			vim.api.nvim_set_hl(0, "Cursor", { fg = "#000000", bg = "#00FF00" })
			vim.api.nvim_set_hl(0, "iCursor", { fg = "#000000", bg = "#00BFFF" })
		end,
	},
}
