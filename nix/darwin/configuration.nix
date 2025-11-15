{ pkgs, ... }:
{
  imports = [
    ./nix.nix
    ./users.nix
    ./fonts.nix
    ./macos.nix
  ];
}
