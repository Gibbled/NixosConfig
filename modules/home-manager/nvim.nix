
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
        };





};
}
