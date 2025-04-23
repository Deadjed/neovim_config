# neovim
My configuration files for neovim

## Requirements
Install [NeoVim](https://github.com/neovim/neovim/releases)
- [Packer](https://github.com/wbthomason/packer.nvim)
  - run :PackerSync
- clang for c/c++ LSP [LLVM](https://github.com/llvm/llvm-project/releases)
  - Linux: - sudo apt install clangd
- [NodeJS](https://nodejs.org/en/download/) for python
  - npm install -g pyright
- [.NET](https://dotnet.microsoft.com/en-us/download) SDK for C#
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
