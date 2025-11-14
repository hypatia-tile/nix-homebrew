{
  description = "Shino's Nix-Darwin configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, ... }:
    {
      darwinConfigurations."Kazukis-MacBook-Air" = nix-darwin.lib.darwinSystem {
        modules = [
          ./configuration.nix
          # Integrate Home Manager as a module
          home-manager.darwinModules.home-manager
          # Configure Home Manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.backupFileExtension = "hm-bak";

            home-manager.users.kazukishinohara = import ./home.nix;
          }
        ];
      };
    };
}
