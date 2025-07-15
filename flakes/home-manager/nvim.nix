{ config, pkgs, ... }:

{



    programs.neovim = {
      enable = true;
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
        #nvim-treesitter-parsers.latex
      ];
    };



}

