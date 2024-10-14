{
  description =
    "Collection of nix-compatible color schemes, and a home-manager module to make theming easier.";

  inputs = {
    nixpkgs-lib.url = "github:nix-community/nixpkgs.lib";

    # Upstream source of .yaml base16 schemes
    base16-schemes.url = "github:tinted-theming/base16-schemes";
    base16-schemes.flake = false;
  };

  outputs = { self, nixpkgs-lib, base16-schemes }:
    import ./. {
      nixpkgs-lib = nixpkgs-lib.lib;
      base16-schemes = base16-schemes.outPath;
    };
}	
