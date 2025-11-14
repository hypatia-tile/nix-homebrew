{
  description = "Shino's Nix-Darwin configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, ... }:
    {
      darwinConfigurations."Kazukis-MacBook-Air" = nix-darwin.lib.darwinSystem {
        modules = [ ./configuration.nix ];
      };
    };
}
