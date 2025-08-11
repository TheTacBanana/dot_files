{ pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    helix

    # Language server
    marksman
    nil
    clang-tools
    tinymist
    zls
    typescript-language-server
    jdt-language-server
    python313Packages.jedi-language-server

    # Formatter
    rustfmt
    typstyle
    nixfmt-rfc-style
    dprint
    superhtml
    black
  ];
}
