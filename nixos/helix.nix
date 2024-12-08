{ pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    helix

    # Language server
    marksman
    nil
    clang-tools
    typst-lsp
    zls

    # Formatter
    rustfmt
    typstfmt
    nixfmt-rfc-style
    dprint
  ];
}
