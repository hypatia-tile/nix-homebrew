{ pkgs, ... }:

{
  # user-level packages (no sudo):
  home.packages = with pkgs; [
    eza
    fd
    ripgrep
    bat
    fzf
    neovim
    vim
    tree
    htop
    nodejs_22
    deno
    direnv
    gh
    lazygit
    # claude-code
  ];
}
