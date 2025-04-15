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

    # Formatter
    rustfmt
    typstyle
    nixfmt-rfc-style
    dprint
  ];
}
