# neovim
My configuration files for neovim

## Requirements
Install [NeoVim](https://github.com/neovim/neovim/releases)
- [Packer](https://github.com/wbthomason/packer.nvim)
  - run :PackerSync
- LSP
  - Windows (C/C++)
    - Download these clangd [Binaries](https://github.com/clangd/clangd/releases)
    - Move to somewhere and add to PATH (test it works in terminal with 'clangd'
  - Linux: - sudo apt install clangd
  - Python (Windows): [NodeJS](https://nodejs.org/en/download/)
  - Python (Linux): npm install -g pyright
  - C# (Windows) [.NET](https://dotnet.microsoft.com/en-us/download)
    - dotnet tool install --global omnisharp
    - omnisharp --help
## Usage
- [Telescope (Fuzzy Finder)](https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#usage)
    - \ff to open

## Helpful commands
Tab spacing wrong
- set shiftwidth=4
- set tabstop=4

## LSP
Test with :LspInfo
