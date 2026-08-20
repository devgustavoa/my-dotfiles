return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",

	dependencies = {
		"nvim-lua/plenary.nvim",

		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},

		"nvim-telescope/telescope-ui-select.nvim",
	},

	opts = {
		defaults = {
			prompt_prefix = " ",
			path_display = { "smart" },
			sorting_strategy = "ascending",

			file_ignore_patterns = {
				"%.git/",
				"build/",
				"cmake-build-.*/",
			},

			layout_config = {
				horizontal = {
					prompt_position = "top",
					preview_width = 0.55,
				},
				vertical = {
					mirror = false,
				},
				preview_cutoff = 120,
			},

			preview = {
				filesize_limit = 2,
				timeout = 1000,
			},
		},

		pickers = {
			find_files = {
				find_command = {
					"fdfind",
					"--type",
					"f",
					"--hidden",
					"--follow",
					"--exclude",
					".git",
				},
			},

			buffers = {
				theme = "dropdown",
				previewer = false,
			},
		},

		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},

			["ui-select"] = {
				require("telescope.themes").get_dropdown({}),
			},
		},
	},

	config = function(_, opts)
		local telescope = require("telescope")

		telescope.setup(opts)
		telescope.load_extension("fzf")
		telescope.load_extension("ui-select")
	end,

	keys = {
		{
			"<leader>ff",
			"<cmd>Telescope find_files<cr>",
			desc = "Find Files",
		},
		{
			"<leader>fg",
			"<cmd>Telescope live_grep<cr>",
			desc = "Live Grep",
		},
		{
			"<leader>fb",
			"<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
			desc = "Buffers",
		},
		{
			"<leader>fr",
			"<cmd>Telescope oldfiles<cr>",
			desc = "Recent Files",
		},
	},
}
