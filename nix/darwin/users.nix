{ pkgs, ... }:
{
  # Enable alternative shell support in nix-darwin
  programs.zsh.enable = true;

  users.users.kazukishinohara = {
    name = "kazukishinohara";
    home = "/Users/kazukishinohara";
    shell = pkgs.zsh; # or omit if you prefer the system default shell
  };

}
