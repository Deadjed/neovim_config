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

    -- Optionally add other plugins here
end)

-- Keymap for searching files
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })

-- Set up treesitter
require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true,              -- false will disable the whole extension
        additional_vim_regex_highlighting = false,
    },
    ensure_installed = { "c", "cpp", "python", "prolog" },  -- Specify the languages
}

