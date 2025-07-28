
{ config, pkgs, lib, ... }:

let 
  prog = "neovim";
  optname = "${prog}-program";
  message = "Home manager option to enable neovim config";
  pkgname = [ "pkgs.neovim-unwrapped" ];
  
in
{
  options = {
    "${optname}".enable = lib.mkEnableOption "${message}";
  };


  config = lib.mkIf config."${optname}".enable {


      programs."${prog}" = with pkgs; {
        enable = true;
        package = pkgs.neovim-unwrapped;
 	#package = "${pkgname}";
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;
        plugins = with pkgs.vimPlugins; [
          nvim-lspconfig
          nvim-treesitter.withAllGrammars
          tokyonight-nvim
          mason-nvim
	  fugitive-gitlab-vim
	  telescope-nvim
	  nvim-tree-lua
	  ollama-nvim
	  harpoon
	  lualine-nvim
	  lsp_extensions-nvim
	  undotree
	  render-markdown-nvim
	  twilight-nvim
	  zen-mode-nvim
	  snacks-nvim
	  noice-nvim
      ];
       extraLuaConfig = ''

         vim.g.mapleader = ","
         vim.keymap.set("n", "<Leader>gg", ':Gen<CR>')
         vim.keymap.set("n", "<Leader>vv", ':NvimTreeToggle<CR>')
         vim.keymap.set("v", "<Leader>gg", ':Gen<CR>')
         vim.keymap.set("n", "<Leader>,", ':lua ColourMyPencils()<CR>')
         vim.cmd('noremap <Leader>w :w<CR>')
         

         --harpoon
         vim.keymap.set('n','<leader>hh',require('harpoon.mark').add_file)
         vim.keymap.set('n','<leader>hn',require('harpoon.ui').nav_next)
         vim.keymap.set('n','<leader>hp',require('harpoon.ui').nav_prev)
         vim.keymap.set('n', [[hm]], ':Telescope harpoon marks<CR>')


         --telescope
         local builtin = require('telescope.builtin')
         vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
         vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
         vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
         vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
         vim.keymap.set('n', '<Leader>gf', builtin.git_files, {} )

         --For LaTeX Vimtex
         vim.keymap.set('n', '<Leader>cc', ':VimtexCompile<CR>')

         --for nvim-tmux-navigator
         local nvim_tmux_nav = require('nvim-tmux-navigation')

         nvim_tmux_nav.setup{

	disable_when_zoomed = true
         }

         vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
         vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
         vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
         vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
         vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
         vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
       '';
        
        };

};
}
