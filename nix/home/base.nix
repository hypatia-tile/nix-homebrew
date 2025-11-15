{ config, ... }:

{
  home.username = "kazukishinohara";
  home.homeDirectory = "/Users/kazukishinohara";
  home.stateVersion = "25.05"; # pick the current HM release or similar

  xdg.enable = true;

  programs.home-manager.enable = true;
}
