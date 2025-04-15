{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    gh
    lazygit
  ];

  programs.git.config = {
    enable = true;
    userName = "TheTacBanana";
    userEmail = "github@vivianeris.com";
  };
}
