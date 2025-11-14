{ pkgs, ... }:
{
  # Turn off nix-darwin's own Nix management (only if we still using Determinate)
  nix.enable = false;

  environment.systemPackages = [
    pkgs.vim
    pkgs.git
    pkgs.htop
  ];

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = [ "nix-command flakes" ];

  # Enable alternative shell support in nix-darwin
  programs.zsh.enable = true;

  # Drop ocnfiguration Revision for now to keep it simple
  # (using `self` in an external module requires specialArgs).
  # system.configurationRevision = self.rev or self.dirtyRev or null;

  system.stateVersion = 6;
  nixpkgs.hostPlatform = "aarch64-darwin";

}
