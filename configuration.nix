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

  users.users.kazukishinohara = {
    name = "kazukishinohara";
    home = "/Users/kazukishinohara";
    shell = pkgs.zsh; # or omit if you prefer the system default shell
  };
  ########################################
  # macOS system settings via nix-darwin #
  ########################################
  # Make Dock auto-hide and speed it up
  # system.defaults.dock.autohide = true;
  # system.defaults.dock.autohide-delay = 0.0;
  # system.defaults.dock.autohide-time-modifier = 0.15;

  # Faster key repeat (you can tweak these)
  # system.defaults.NSGlobalDomain.KeyRepeat = 2;
  # system.defaults.NSGlobalDomain.InitialKeyRepeat = 15;

  # Finder: show all filename extensions
  # system.defaults.finder.AppleShowAllExtensions = true;

  # (optional) Finder: show status bar
  # system.defaults.finder.ShowStatusBar = true;

}
