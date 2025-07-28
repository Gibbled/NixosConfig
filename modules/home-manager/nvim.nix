
{ config, pkgs, lib, ... }:

let 
  prog = "neovim";
  optname = "${prog}-program";
  message = "Home manager option to enable neovim config";
  pkgname = pkgs.neovim-unwrapped;
  
in
{
  options = {
    "${optname}".enable = lib.mkEnableOption "${message}";
  };


  config = lib.mkIf config."${optname}".enable {


      programs."${prog}" = with pkgs; {
        enable = true;
        #package = pkgs.neovim-unwrapped;
 	package = pkgname;
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
	  #snacks-nvim
	  noice-nvim
      ];
       extraLuaConfig = ''

         vim.g.mapleader = ","
         vim.keymap.set("n", "<Leader>gg", ':Gen<CR>')
         vim.keymap.set("n", "<Leader>vv", ':NvimTreeToggle<CR>')
         vim.keymap.set("v", "<Leader>gg", ':Gen<CR>')
         vim.keymap.set("n", "<Leader>,", ':lua ColourMyPencils()<CR>')
         vim.cmd('noremap <Leader>w :w<CR>')
         
	 --ZenMode
	 vim.keymap.set("n", "<Leader>zz", ':ZenMode<CR>')

	 --Twilight
	 vim.keymap.set("n", "<Leader>z,", ':Twilight<CR>')

         --Undotree
	 vim.keymap.set("n", "<Leader>aa", ':UndotreeToggle<CR>')
	 

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



         local builtin = require('telescope.builtin')
         vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
         local status_ok, telescope = pcall(require, "telescope")
         if not status_ok then
           return
         end
         
         local actions = require "telescope.actions"
         
         
         telescope.setup {
           defaults = {
             prompt_prefix = " ",
             selection_caret = " ",
             path_display = { "smart" },
             mappings = {
               i = {
                 ["<C-n>"] = actions.cycle_history_next,
                 ["<C-p>"] = actions.cycle_history_prev,
         
	         --["<C-j>"] = actions.move_selection_next,
                 --["<C-k>"] = actions.move_selection_previous,
         
                 ["<C-c>"] = actions.close,

                 ["<Down>"] = actions.move_selection_next,
                 ["<Up>"] = actions.move_selection_previous,
         
                 ["<CR>"] = actions.select_default,
                 ["<C-x>"] = actions.select_horizontal,
                 ["<C-v>"] = actions.select_vertical,
                 ["<C-t>"] = actions.select_tab,
         
                 ["<C-u>"] = actions.preview_scrolling_up,
                 ["<C-d>"] = actions.preview_scrolling_down,

                 ["<PageUp>"] = actions.results_scrolling_up,
                 ["<PageDown>"] = actions.results_scrolling_down,

                 ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                 ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                 ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                 ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                 --["<C-l>"] = actions.complete_tag,
                 ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
               },
         
               n = {
                 ["<esc>"] = actions.close,
                 ["<CR>"] = actions.select_default,
                 ["<C-x>"] = actions.select_horizontal,
                 ["<C-v>"] = actions.select_vertical,
                 ["<C-t>"] = actions.select_tab,
         
                 ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                 ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                 ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                 ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

                 ["j"] = actions.move_selection_next,
                 ["k"] = actions.move_selection_previous,
                 ["H"] = actions.move_to_top,
                 ["M"] = actions.move_to_middle,
                 ["L"] = actions.move_to_bottom,

                 ["<Down>"] = actions.move_selection_next,
                 ["<Up>"] = actions.move_selection_previous,
                 ["gg"] = actions.move_to_top,
                 ["G"] = actions.move_to_bottom,

                 ["<C-u>"] = actions.preview_scrolling_up,
                 ["<C-d>"] = actions.preview_scrolling_down,

                 ["<PageUp>"] = actions.results_scrolling_up,
                 ["<PageDown>"] = actions.results_scrolling_down,
         
                 ["?"] = actions.which_key,
               },
             },
           },
           pickers = {
             -- Default configuration for builtin pickers goes here:
             -- picker_name = {
             --   picker_config_key = value,
             --   ...
             -- }
             -- Now the picker_config_key will be applied every time you call this
             -- builtin picker
           },
           load_extensions = { "yank_history", "bibtex" },
           extensions = {
             bibtex = {
               depth = 1,
               -- Depth for the *.bib file
               custom_formats = {},
               -- Custom format for citation label
               },
         }
}










       '';
        
        };

};
}
