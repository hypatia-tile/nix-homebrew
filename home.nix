{ pkgs, config, ... }:

{
  home.username = "kazukishinohara";
  home.homeDirectory = "/Users/kazukishinohara";
  home.stateVersion = "25.05"; # pick the current HM release or similar

  xdg.enable = true;

  programs.home-manager.enable = true;

  # user-level packages (no sudo):
  home.packages = with pkgs; [
    eza
    fd
    ripgrep
    bat
    neovim
    tmux
    alacritty
  ];


  # example: enable some HM-managed programs
  programs.git = {
    enable = true;
    userName = "shinokun";
    userEmail = "hypatia.tile02021@grail.com";
    extraConfig = {
      init.defaultBranch = "main";
      core.editor = "nvim";
    };
  };
  programs.zsh = {
    enable = true;
    dotDir = "${config.xdg.configHome}/zsh";
  };
}
