-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.api.nvim_exec(
	[[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
	false
)

local use = require('packer').use
require('packer').startup(function()
	use 'wbthomason/packer.nvim'

	-- Package manager
	use 'tpope/vim-fugitive'

	-- Git commands in nvim
	use 'tpope/vim-rhubarb'

	-- Fugitive-companion to interact with github
	use 'tpope/vim-commentary'

	-- "gc" to comment visual regions/lines
	-- use 'ludovicchabant/vim-gutentags' -- Automatic tags management TODO: consider whether I need this
	-- Determine whether you need gutentags
	-- UI to select things (files, grep results, open buffers...)
	use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'}}
	use 'joshdick/onedark.vim'

	-- Theme inspired by Atom
	use 'hoob3rt/lualine.nvim'

	-- Fancier statusline
	-- Add indentation guides even on blank lines
	use 'lukas-reineke/indent-blankline.nvim'

	-- Add git related info in the signs columns and popups
	use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}

	-- Highlight, edit, and navigate code using a fast incremental parsing library
	use 'nvim-treesitter/nvim-treesitter'

	-- Additional textobjects for treesitter
	use 'nvim-treesitter/nvim-treesitter-textobjects'
	use 'neovim/nvim-lspconfig'

	-- Collection of configurations for built-in LSP client
	use 'hrsh7th/nvim-cmp'

	-- Autocompletion plugin
	use 'hrsh7th/cmp-nvim-lsp'
	use 'saadparwaiz1/cmp_luasnip'
	use 'L3MON4D3/LuaSnip'

	-- Snippets plugin
	use 'mfussenegger/nvim-lint'

	-- Additional linting
	use 'psliwka/vim-smoothie'

	-- Smooth scrolling
	use 'folke/tokyonight.nvim'
	use 'kyazdani42/nvim-web-devicons'
	use 'ryanoasis/vim-devicons'
	use 'rmagatti/auto-session'
	use 'rmagatti/session-lens'

	-- use 'Pocco81/AutoSave.nvim'
	use 'ojroques/vim-oscyank'
	use 'kdheepak/tabline.nvim'
	use 'ojroques/nvim-bufdel'
	use 'kyazdani42/nvim-tree.lua'
	use 'lukas-reineke/lsp-format.nvim'
   use 'norcalli/nvim-colorizer.lua'
   use 'hkupty/iron.nvim'
   use 'ahmedkhalf/project.nvim'
   use 'windwp/nvim-autopairs'
end)

vim.o.inccommand = 'nosplit'
vim.o.hlsearch = false -- Incremental live completion (note: this is now a default on master)
vim.o.hidden = true -- Set highlight on search
vim.o.mouse = 'a' -- Do not save when switching buffers (note: this is now a default on master)
vim.o.breakindent = true -- Enable mouse mode
vim.o.ignorecase = true -- Enable break indent
-- vim.g.clipboard = 'clipboard-unnamedplus'

local indent, width = 3, 80
vim.opt.undofile = true
vim.o.completeopt = 'menuone,noselect'-- Save undo history
vim.opt.cursorline = true -- Set completeopt to have a better completion experience
vim.opt.expandtab = true -- Highlight cursor line
vim.opt.formatoptions = 'crqnj'-- Use spaces instead of tabs
vim.opt.hidden = true -- Automatic formatting options
vim.opt.ignorecase = true-- Enable background buffers
vim.opt.joinspaces = false-- Ignore case
vim.opt.list = true -- No double spaces with join
vim.opt.number = true -- Show some invisible characters
vim.opt.pastetoggle = '<F2>'-- Show line numbers
vim.opt.pumheight = 12 -- Paste mode
vim.opt.relativenumber = true-- Max height of popup menu
vim.opt.scrolloff = 4 -- Relative line numbers
vim.opt.shiftround = true -- Lines of context
vim.opt.shiftwidth = indent -- Round indent
vim.opt.shortmess = 'atToOFc' -- Size of an indent
vim.opt.sidescrolloff = 8 -- Prompt message options
vim.opt.signcolumn = 'yes' -- Columns of context
vim.opt.smartcase = true -- Show sign column
vim.opt.smartindent = true -- Do not ignore case with capitals
vim.opt.splitbelow = true -- Insert indents automatically
vim.opt.splitright = true -- Put new windows below current
vim.opt.tabstop = indent -- Put new windows right of current
vim.opt.termguicolors = true -- Number of spaces tabs count for
vim.opt.textwidth = width -- True color support
vim.opt.updatetime = 100 -- Maximum width of text
vim.opt.wildmode = {'list', 'longest'} -- Delay before swap file is saved
vim.opt.wrap = false -- Command-line completion mode
vim.opt.lazyredraw = true

-- Disable line wrap
vim.wo.number = true

-- Set color column as a workaroudn to stop artefacts appearing on line
-- highlight when you scroll. See more here: https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
-- NOTE: Revisit the issue periodically to check for a fix from neovim.
vim.wo.colorcolumn = "99999"

-- Make line numbers default
vim.wo.signcolumn = 'yes'

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', {noremap = true, silent = true})
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

--Add leader shortcuts
vim.api.nvim_set_keymap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sf', [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>st', [[<cmd>lua require('telescope.builtin').tags()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sp', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>so', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F3>', '<cmd>lua toggle_wrap()<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>s', ':%s//gcI<Left><Left><Left><Left>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>terminal<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>x', ':BufDel<CR>', {noremap = true, silent = true}) -- Allow escape in Terminal
vim.api.nvim_set_keymap('t', '<ESC>', '&filetype == "fzf" ? "\\<ESC>" : "\\<C-\\>\\<C-n>"', {expr = true})

-- Other shortcuts
vim.api.nvim_set_keymap('n', '<C-l>', ':nohlsearch<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '-', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'crr', ':IronRestart<CR>', {noremap = true, silent = true}) -- 'crr' for c-restart-repl
vim.api.nvim_set_keymap('n', 'cr', ':IronRepl<CR>', {noremap = true, silent = true}) -- 'cr' for create-repl
vim.api.nvim_set_keymap('n', 'crb', '<Cmd>lua require("iron").core.send(vim.api.nvim_buf_get_option(0,"ft"), vim.api.nvim_buf_get_lines(0, 0, -1, false))<CR>', {noremap = true, silent = true}) -- 'cr' for create-repl

-- Resize Windows with Keyboard Mappings
vim.api.nvim_set_keymap('n', '<S-Down>', '<C-w>2-', {noremap = true})
vim.api.nvim_set_keymap('n', '<S-Left>', '<C-w>2<', {noremap = true})
vim.api.nvim_set_keymap('n', '<S-Right>', '<C-w>2>', {noremap = true})
vim.api.nvim_set_keymap('n', '<S-Up>', '<C-w>2+', {noremap = true})

--Set colorscheme (order is important here)
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer"}
vim.g.tokyonight_transparent = true

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = {hint = "orange", error = "#ff0000"}

-- Load the colorscheme
vim.cmd [[colorscheme tokyonight]]

--Set statusbar
--[[vim.g.lightline = {
  colorscheme = 'onedark',
  active = { left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } } },
  component_function = { gitbranch = 'fugitive#head' },
}--]]

-- Lualine Setup and Theme
require 'lualine'.setup {
	options = {
		icons_enabled = true,
		theme = 'palenight',
		component_separators = {'│', '│'},
		section_separators = {'', ''}, 	-- 
   	disabled_filetypes = {} 		-- ', ''
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch'},
		lualine_c = {'vim.fn.getcwd()', 'filename'},
		lualine_x = {'encoding', 'file', 'filetype'},
		lualine_y = {'progress'},
		lualine_z = {'location'}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},

		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	extensions = {'nvim-tree'}
}

require 'tabline'.setup {
	-- Defaults configuration options
	enable = true,
	options = {
		-- If lualine is installed tabline will use separators configured in lualine by default.
		-- These options can be used to override those settings.
		section_separators = {'', ''},
		component_separators = {'', ''},
		max_bufferline_percent = 66,
   	show_tabs_always = false, 		-- set to nil by default, and it uses vim.o.columns * 2/3
   	show_devicons = true, 		-- this shows tabs only when there are more than one tab or if the first tab is named
      show_bufnr = false, 		-- this shows devicons in buffer section
		show_filename_only = false, 	-- this appends [bufnr] to buffer section,
	}
}

-- Highlight on yank
vim.api.nvim_exec(
	[[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
	false
)

-- Y yank until the end of line  (note: this is now a default on master)
vim.api.nvim_set_keymap('n', 'Y', 'y$', {noremap = true})

--Map blankline
vim.g.indent_blankline_char = '▏'
vim.g.indent_blankline_filetype_exclude = {'help', 'packer'}
vim.g.indent_blankline_buftype_exclude = {'terminal', 'nofile'}
vim.g.indent_blankline_char_highlight = 'LineNr'
vim.g.indent_blankline_show_trailing_blankline_indent = true

-- Gitsigns
require('gitsigns').setup {
	signs = {
		add = {hl = 'GitGutterAdd', text = '+'},
		change = {hl = 'GitGutterChange', text = '~'},
		delete = {hl = 'GitGutterDelete', text = '_'},
		topdelete = {hl = 'GitGutterDelete', text = '‾'},
		changedelete = {hl = 'GitGutterChange', text = '~'},
	},
}

-- Telescope
local telescope = require 'telescope'
telescope.setup {
	defaults = {
		mappings = {
			i = {
				['<C-u>'] = false,
				['<C-d>'] = false,
			},
		},
	},
}
telescope.load_extension('projects')

-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require('nvim-treesitter.configs').setup {
	highlight = {
		enable = true,
		-- false will disable the whole extension
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = 'gnn',
			node_incremental = 'grn',
			scope_incremental = 'grc',
			node_decremental = 'grm',
		},
	},
	indent = {
		enable = true,
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,

			-- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				['af'] = '@function.outer',
				['if'] = '@function.inner',
				['ac'] = '@class.outer',
				['ic'] = '@class.inner',
			},
		},
		move = {
			enable = true,
			set_jumps = true,

			-- whether to set jumps in the jumplist
			goto_next_start = {
				[']m'] = '@function.outer',
				[']]'] = '@class.outer',
			},
			goto_next_end = {
				[']M'] = '@function.outer',
				[']['] = '@class.outer',
			},
			goto_previous_start = {
				['[m'] = '@function.outer',
				['[['] = '@class.outer',
			},
			goto_previous_end = {
				['[M'] = '@function.outer',
				['[]'] = '@class.outer',
			},
		},
	},
}

-- LSP settings
local nvim_lsp = require('lspconfig')
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
   print('Attaching to ' .. client.name)
   local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
   local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
   -- Enable completion triggered by <c-x><c-o>
   buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
   -- Mappings
   local opts = { noremap=true, silent=true }
   -- See `:help vim.lsp.*` for documentation on any of the below functions
   buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
   buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
   buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
   buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
   buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
   buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
   buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
   buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
   buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
   buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
   buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
   buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
   buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
   buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
   buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
   buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
   buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Enable the following language servers NOTE: Does not include lua langauge
-- server config, dealt with seperately in lua/lua-ls.lua (and required below).
local servers = {'rust_analyzer', 'pyright', 'phpactor', 'denols'}
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup {
		on_attach = on_attach,
		flags = {
			debounce_text_changes = 150,
		}
	}
end

-- LSP signs

vim.fn.sign_define('LspDiagnosticsSignError', { text = "", texthl = "LspDiagnosticsDefaultError" })
vim.fn.sign_define('LspDiagnosticsSignWarning', { text = "", texthl = "LspDiagnosticsDefaultWarning" })
vim.fn.sign_define('LspDiagnosticsSignInformation', { text = "", texthl = "LspDiagnosticsDefaultInformation" })
vim.fn.sign_define('LspDiagnosticsSignHint', { text = "", texthl = "LspDiagnosticsSignHint" })
vim.fn.sign_define('GitSignsAdd', { text = "", texthl = "GitGutterAdd" })
vim.fn.sign_define('GitSignsDelete', { text = "", texthl = "GitGutterDelete" })
vim.fn.sign_define('GitSignsChange', { text = "ﰣ", texthl = "GitGutterChange" })

-- Enable Lua language server
require 'lua-ls'

local cmp = require 'cmp'
cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	mapping = {
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm({select = true}),
	},
	sources = {
		{name = 'nvim_lsp'},
		{name = 'luasnip'},
		{name = 'buffer'},
	}
})

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Setup further linting here
local lint = require('lint')
lint.linters_by_ft = {
	markdown = {'vale'},
}

-- Auto formatting
require "lsp-format".setup {
	["*"] = {{cmd = {"sed -i 's/[ \t]*$//'"}}},
	vim = {
		{
			cmd = {"luafmt  replace"},
			start_pattern = "^lua << EOF$",
			end_pattern = "^EOF$"
		}
	},
	vimwiki = {
		{
			cmd = {"prettier -w --parser babel"},
			start_pattern = "^{{{javascript$",
			end_pattern = "^}}}$"
		}
	},
	lua = {
		{
			cmd = {
				function(file)
					return string.format("luafmt --f %s", file)
				end
			}
		}
	},
	go = {{cmd = {"gofmt -w", "goimports -w"}, tempfile_postfix = ".tmp"}},
	javascript = {{cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}},
	markdown = {
		{cmd = {"prettier -w"}},
		{
			cmd = {"black"},
			start_pattern = "^```python$",
			end_pattern = "^```$",
			target = "current"
		}
	}
}

require "lspconfig".gopls.setup { on_attach = require "lsp-format".on_attach }

-- luasnip setup
require 'luasnip'

-- Coloriser
require('colorizer').setup()

-- Iron (Interactive REPLS
local iron = require 'iron'
-- iron.core.set_config {repl_open_cmd = 'rightbelow vertical 100 split'}
iron.core.set_config {repl_open_cmd = 'vertical bo split'}

-- Session Manager (Auto Session with Session Lens setup)
require('auto-session').setup {
	auto_session_enable_last_session = true,
}
require("telescope").load_extension("session-lens")

require 'nvim-tree'.setup {
	disable_netrw = true,
	hijack_netrw = true, -- disables netrw completely
	open_on_setup = false,-- hijack netrw window on startup
	ignore_ft_on_setup = {},-- open the tree when running this setup function
	auto_close = false, -- will not open on setup if the filetype is in this list
	open_on_tab = false, -- closes neovim automatically when the tree is the last **WINDOW** in the view
	hijack_cursor = false, -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
	update_cwd = false,-- hijack the cursor in the tree to put it at the start of the filename
	lsp_diagnostics = false, -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
   update_focused_file = { -- show lsp diagnostics in the signcolumn
	enable = false, -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
		update_cwd = false,
		ignore_list = {}
	},
	system_open = {
   	cmd = nil, -- configuration options for the system open command (`s` in the tree by default)
   	args = {} -- the command to run this, leaving nil should work in most cases
		-- the command arguments as a list
	},
	view = {
		width = 30,
   	side = 'left', -- width of the window, can be either a number (columns) or a string in `%`
   	auto_resize = false, -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
   	mappings = { -- if true the tree will resize itself after opening a file
			custom_only = false,
   		list = {} -- list of mappings to set on the tree manually
		}
	}
}

-- Autosave

-- local autosave = require("autosave")
-- autosave.setup(
--     {
--         enabled = true,
--         execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
--         events = {"InsertLeave", "TextChanged"},
--         conditions = {
--             exists = true,
--             filename_is_not = {},
--             filetype_is_not = {},
--             modifiable = true
--         },
--         write_all_buffers = false,
--         on_off_commands = true,
--         clean_command_line_interval = 0,
--         debounce_delay = 135
--     }
-- )

-- Buffer Delete
require('bufdel').setup {
	next = 'cycle',
	-- or 'alternate'
	quit = true,
}

-- autopairs
require('nvim-autopairs').setup{}

-- Vim Rooter (to set root directories automatically)
require 'project_nvim'

function init_term()
	vim.cmd 'setlocal nonumber norelativenumber'
	vim.cmd 'setlocal nospell'
	vim.cmd 'setlocal signcolumn=auto'
end

function toggle_wrap()
	vim.wo.breakindent = not vim.wo.breakindent
	vim.wo.linebreak = not vim.wo.linebreak
	vim.wo.wrap = not vim.wo.wrap
end

function warn_caps()
	vim.cmd 'echohl WarningMsg'
	vim.cmd 'echo "Caps Lock may be on"'
	vim.cmd 'echohl None'
end

-- Autocommands
-- Commands in this list are run as autocommands. For more help see
-- help: autocommand
vim.tbl_map(
	function(c)
		vim.cmd(string.format('autocmd %s', c))
	end,
	{
		'TermOpen * lua init_term()',
		'TextYankPost * lua vim.highlight.on_yank {timeout = 200, on_visual = false}',
		'TextYankPost * if v:event.operator is "y" | OSCYankReg + | endif',
		'BufWritePost <buffer> lua require("lint").try_lint()'
		-- 'TextYankPost * if v:event.operator is "y" && v:event.regname is "+" | OSCYankReg + | endif',
	}
)
