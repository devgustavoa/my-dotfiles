return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",

	dependencies = {
		"neovim-treesitter/treesitter-parser-registry",
		{
			"nvim-treesitter/nvim-treesitter-textobjects",
			branch = "main",
		},
	},

	config = function()
		local ts = require("nvim-treesitter")

		ts.install({
			"c",
			"cpp",
			"python",
			"rust",
			"go",
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"c",
				"cpp",
				"python",
				"rust",
				"go",
			},
			callback = function()
				vim.treesitter.start()

				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
				vim.wo.foldmethod = "expr"
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})

		local textobjects = require("nvim-treesitter-textobjects")

		textobjects.setup({
			select = {
				lookahead = true,

				selection_modes = {
					["@parameter.outer"] = "v",
					["@function.outer"] = "V",
				},

				include_surrounding_whitespace = false,
			},

			move = {
				set_jumps = true,
			},
		})

		local select = require("nvim-treesitter-textobjects.select")

		for _, mode in ipairs({ "x", "o" }) do
			vim.keymap.set(mode, "af", function()
				select.select_textobject("@function.outer", "textobjects")
			end)

			vim.keymap.set(mode, "if", function()
				select.select_textobject("@function.inner", "textobjects")
			end)

			vim.keymap.set(mode, "ac", function()
				select.select_textobject("@class.outer", "textobjects")
			end)

			vim.keymap.set(mode, "ic", function()
				select.select_textobject("@class.inner", "textobjects")
			end)

			vim.keymap.set(mode, "aa", function()
				select.select_textobject("@parameter.outer", "textobjects")
			end)

			vim.keymap.set(mode, "ia", function()
				select.select_textobject("@parameter.inner", "textobjects")
			end)

			vim.keymap.set(mode, "ab", function()
				select.select_textobject("@block.outer", "textobjects")
			end)

			vim.keymap.set(mode, "ib", function()
				select.select_textobject("@block.inner", "textobjects")
			end)
		end

		local move = require("nvim-treesitter-textobjects.move")

		local move_keys = {
			["]f"] = { "goto_next_start", "@function.outer" },
			["]c"] = { "goto_next_start", "@class.outer" },
			["]a"] = { "goto_next_start", "@parameter.inner" },

			["]F"] = { "goto_next_end", "@function.outer" },
			["]C"] = { "goto_next_end", "@class.outer" },
			["]A"] = { "goto_next_end", "@parameter.inner" },

			["[f"] = { "goto_previous_start", "@function.outer" },
			["[c"] = { "goto_previous_start", "@class.outer" },
			["[a"] = { "goto_previous_start", "@parameter.inner" },

			["[F"] = { "goto_previous_end", "@function.outer" },
			["[C"] = { "goto_previous_end", "@class.outer" },
			["[A"] = { "goto_previous_end", "@parameter.inner" },
		}

		for key, config in pairs(move_keys) do
			vim.keymap.set({ "n", "x", "o" }, key, function()
				move[config[1]](config[2], "textobjects")
			end, {
				silent = true,
				desc = config[1] .. " " .. config[2],
			})
		end
	end,
}
