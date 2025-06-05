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

    # Formatter
    rustfmt
    typstyle
    nixfmt-rfc-style
    dprint
    superhtml
  ];
}
