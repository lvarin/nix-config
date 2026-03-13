{ config, pkgs, ... }:

{
  home.username = "alvaro";
  home.homeDirectory = "/home/alvaro";

  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    neovim
    tree-sitter
    nodejs
    gcc
    git
    waybar
    wlogout
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
  xdg.configFile."waybar/style.css".source = ./waybar/style.css;
  xdg.configFile."sway/config".source = ./sway/config;
  xdg.configFile."mako/config".source = ./mako/config;
  xdg.configFile."sway/foot.ini".source = ./foot/foot.ini;

  home.file.".zshrc".source = ./zsh/zshrc;
  home.file.".Xmodmap".source = ./zsh/Xmodmap;

  xdg.configFile."zsh" = {
    source = ./zsh/zsh;
    recursive = true;
  };

}
