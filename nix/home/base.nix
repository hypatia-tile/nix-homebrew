{config, ...}: {
  home.username = "kazukishinohara";
  home.homeDirectory = "/Users/kazukishinohara";
  home.stateVersion = "25.05"; # pick the current HM release or similar
  home.sessionPath = [
    "/Users/kazukishinohara/.nix-profile/bin"
    "/etc/profiles/per-user/kazukishinohara/bin"
    "/run/current-system/sw/bin"
    "/opt/homebrew/bin"
    "/opt/homebrew/sbin"
    "/nix/var/nix/profiles/default/bin"
    "/usr/local/bin"
    "/usr/bin"
    "/bin"
    "/usr/sbin"
    "/sbin"
  ];
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  xdg.enable = true;

  programs.home-manager.enable = true;
}
