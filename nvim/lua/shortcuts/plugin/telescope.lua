local PREVIEWERS = require("telescope.previewers")
local BUILTIN = require("telescope.builtin")

require("telescope").setup({
	defaults = {
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		color_devicons = true,
		path_display = { "truncate" },

		file_previewer = PREVIEWERS.vim_buffer_cat.new,
		grep_previewer = PREVIEWERS.vim_buffer_vimgrep.new,
		qflist_previewer = PREVIEWERS.vim_buffer_qflist.new,
		layout_strategy = "vertical",
		layout_config = {
			vertical = {
				height = 0.9,
				preview_cutoff = 0,
				preview_height = 0.6,
				results_height = 0.3,
				width = 0.7,
			},
		},

		-- common files to ignore
		file_ignore_patterns = { "^.git/", "^node_modules/", "^deps/" },

		-- default arguments with `--hidden` added to search in hidden files
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
		},
	},
	pickers = {
		find_files = {
			hidden = true,
		},
	},
	extensions = {
		file_browser = {
			initial_mode = "normal",
			path = "%:p:h",
			hidden = true,
		},
	},
})

require("telescope").load_extension("file_browser")

local T = {}

local delta = PREVIEWERS.new_termopen_previewer({
	title = "Git diff",
	get_command = function(entry)
		return { "git", "-c", "core.pager=delta", "diff", entry.path }
	end,
})

T.my_git_status = function(opts)
	opts = {
		previewer = delta,
		initial_mode = "normal",
	}

	BUILTIN.git_status(opts)
end

return T
