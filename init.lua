-- Initialize packer
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'  -- Package manager

    -- Color scheme
    use { 
        'morhetz/gruvbox',
        config = function()
            vim.cmd('colorscheme gruvbox')
            vim.opt.termguicolors = true  -- Enable true colors
            -- Set transparency
            vim.cmd([[highlight Normal guibg=NONE ctermbg=NONE]])
            vim.cmd([[highlight NonText guibg=NONE ctermbg=NONE]])
        end
    }

    -- Plenary (Telescope requirement)
    use "nvim-lua/plenary.nvim"

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim', 
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Treesitter syntax highlighting
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

    -- Autocompletion plugin
	use {
	  'hrsh7th/nvim-cmp',
	  requires = {
	    'hrsh7th/cmp-nvim-lsp',     -- LSP source for nvim-cmp
	    'hrsh7th/cmp-buffer',       -- Buffer word completion
	    'hrsh7th/cmp-path',         -- File path completion
	    'hrsh7th/cmp-cmdline',      -- Command-line completion
	    'L3MON4D3/LuaSnip',         -- Snippet engine
	    'saadparwaiz1/cmp_luasnip', -- Snippet completions
	  }
	}

	-- LSP Config
	use 'neovim/nvim-lspconfig'  -- Collection of configurations for built-in LSP client

    -- Optionally add other plugins here
end)

-- Keymap for searching files
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })

-- Set up treesitter
require('nvim-treesitter.configs').setup { 
	highlight = { 
		enable = true,              -- false will disable the whole extension 
		additional_vim_regex_highlighting = true, 
	}, 
	ensure_installed = { "cpp", "c", "c_sharp", "python", "prolog"},  -- Specify the languages 
}

-- Setup autocomplete (LSP)
local lspconfig = require('lspconfig')

-- Enable LSP servers here
-- lspconfig.pyright.setup{}  -- Python
lspconfig.clangd.setup{}   -- C/C++

-- Set up nvim-cmp
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
  })
})

-- Set shiftwidth/tabstop
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Set terminal
vim.g.terminal_emulator='powershell'
vim.opt.shell = 'powershell.exe'
