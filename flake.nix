{

description = "Home manager configuration. with flakes"

inputs = {
  nixpkgs.url = "nixpkgs/nixos-unstable";

  home-manager = {
    url = "github.com:nix-community/home-manager/master";
    inputs.nixpkgs.follows = "nixpkgs";
  };
};

outputs = { nixpkgs, home-manager, ... }:
  let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    homeConfigurations = {
    ranjit = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [ ./flakes/home.nix ];
    };
    };
  };
}
