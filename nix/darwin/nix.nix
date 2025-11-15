{ pkgs, ... }:

{
  # Turn off nix-darwin's own Nix management (only if we still using Determinate)
  nix.enable = false;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = [ "nix-command flakes" ];

  nixpkgs.hostPlatform = "aarch64-darwin";
}
