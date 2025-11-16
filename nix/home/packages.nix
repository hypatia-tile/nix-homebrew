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
    deno
    direnv
    gh
    lazygit
    alejandra # Nix code formatter
    statix # Nix linter
    deadnix # Detets unused dependencies in Nix files
    nil # Nix language server
    copilot-language-server
    claude-code
  ];
}
