{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        git
        gh
    ];

    programs.git.config = {
        enable = true;
        userName  = "TheTacBanana";
        userEmail = "erisbrabham@gmail.com";
    };
}
