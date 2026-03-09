{ config, pkgs, ... }:

{
  home.username = "alvaro";
  home.homeDirectory = "/home/alvaro";

  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    neovim
    git
    waybar
    grim
    slurp
    wl-clipboard
    mako
    font-awesome_4
    wofi
    jq
    ripgrep
    fd
  ];

  programs.git = {
    enable = true;
    settings.user.name = "Alvaro Gonzalez";
    settings.user.email = "tychoma4@gmail.com";
  };

  programs.firefox.enable = true;

  xdg.configFile."waybar/config".source = ./waybar/config;
}
