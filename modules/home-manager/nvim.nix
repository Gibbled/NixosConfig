
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
	  nvim-notify
	  alpha-nvim
	  stay-centered-nvim
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

	 --Fugitive Git
	 vim.keymap.set("n", "<Leader>gs", vim.cmd.Git)

	 --Stay Centered
	 vim.keymap.set({ 'n', 'v' }, '<leader>ss', require('stay-centered').toggle, { desc = 'Toggle stay-centered.nvim' })

         --harpoon
         vim.keymap.set('n','<leader>hh',require('harpoon.mark').add_file)
         vim.keymap.set('n','<leader>hn',require('harpoon.ui').nav_next)
         vim.keymap.set('n','<leader>hp',require('harpoon.ui').nav_prev)
         vim.keymap.set('n', [[hm]], ':Telescope harpoon marks<CR>')
	 local mark = require("harpoon.mark")
         local ui = require("harpoon.ui")


         --Telescope
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

	 --Lualine
	 require('lualine').setup()

	 --Alpha
	 local alpha = require('alpha')
	 local status_ok, alpha = pcall(require, "alpha")
         if not status_ok then
          return
         end
         
         local dashboard = require("alpha.themes.dashboard")
         dashboard.section.header.val = {

             [[          ▀████▀▄▄              ▄█ ]],
             [[            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ]],
             [[    ▄        █          ▀▀▀▀▄  ▄▀  ]],
             [[   ▄▀ ▀▄      ▀▄              ▀▄▀  ]],
             [[  ▄▀    █     █▀   ▄█▀▄      ▄█    ]],
             [[  ▀▄     ▀▄  █     ▀██▀     ██▄█   ]],
             [[   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ]],
             [[    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ]],
             [[   █   █  █      ▄▄           ▄▀   ]],
         
         }

          dashboard.section.buttons.val = {
            dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
            dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
            dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
            dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.vim<CR>"),
            dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
         }

         local function footer()
          return "The Tao Rewards Good and Punishes Evil"
         end
         
         dashboard.section.footer.val = footer()
         
         dashboard.section.footer.opts.hl = "Type"
         dashboard.section.header.opts.hl = "Include"
         dashboard.section.buttons.opts.hl = "Keyword"
         
         dashboard.opts.opts.noautocmd = true
         alpha.setup(dashboard.opts)
         

         --Mason Config
	 local lsp_zero = require('lsp-zero')
	 lsp_zero.on_attach(function(client, bufnr)
  	 lsp_zero.default_keymaps({buffer = bufnr})
	 end)
	 vim.lsp.enable('basedpyright')
	 vim.lsp.enable('nixfmt')
	 vim.lsp.enable('qmlls')
	 vim.lsp.enable('alejandra')
	 vim.lsp.enable('lua-language-server')
	 vim.lsp.enable('bash-language-server')
	 vim.lsp.enable('docker-compose-language-server')
	 require("mason").setup()
	 require("mason-lspconfig").setup({
  	 -- Replace the language servers listed here
  	 -- with the ones you want to install
  	 handlers = {
    	 lsp_zero.default_setup,
  	 }
	 })


         vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
         vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
         vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
         vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
         vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
         vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)



	 --Noice Setup
	 require("noice").setup({
         lsp = {
           -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
           override = {
             ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
             ["vim.lsp.util.stylize_markdown"] = true,
             ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
           },
         },
         -- you can enable a preset for easier configuration
         presets = {
           bottom_search = true, -- use a classic bottom cmdline for search
           command_palette = true, -- position the cmdline and popupmenu together
           long_message_to_split = true, -- long messages will be sent to a split
           inc_rename = false, -- enables an input dialog for inc-rename.nvim
           lsp_doc_border = false, -- add a border to hover docs and signature help
         },
       })
       
         
         
         --Telescope Config
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



	  --This is a function that I stole from ThePrimagen
          --It restores transparency after updates
          function ColourMyPencils(colour)
                  colour = colour or "tokyonight"
                  vim.cmd.colorscheme(colour)

                  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
                  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
          end
          ColourMyPencils()


          --LSP config lspzero
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

          --Nvim-Tree Config
          vim.g.loaded_netrw = 1
          vim.g.loaded_netrwPlugin = 1
          vim.opt.termguicolors = true
          require("nvim-tree").setup({
            sort_by = "case_sensitive",
            view = {
              width = 30,
            },
            renderer = {
              group_empty = true,
            },
            filters = {
              dotfiles = true,
            },
          })

          --Relative line numbering
	  vim.wo.relativenumber = true



       '';
        
        };

};
}
