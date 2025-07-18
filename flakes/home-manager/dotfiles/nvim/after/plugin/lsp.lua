local lsp = require('lsp-zero')
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})

  vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', {buffer = bufnr})
end)

lsp.preset('recommended')
lsp.setup()

require("lspconfig").nixd.setup({
  cmd = { "nixd" },
  settings = {
    nixd = {
      nixpkgs = {
        expr = "import <nixpkgs> { }",
      },
      formatting = {
        command = { "alejandra" }, -- or nixfmt or nixpkgs-fmt
      },
      -- options = {
      --   nixos = {
      --       expr = '(builtins.getFlake "/PATH/TO/FLAKE").nixosConfigurations.CONFIGNAME.options',
      --   },
      --   home_manager = {
      --       expr = '(builtins.getFlake "/PATH/TO/FLAKE").homeConfigurations.CONFIGNAME.options',
      --   },
      -- },
    },
  },
})

