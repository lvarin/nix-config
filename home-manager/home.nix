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
    foot
    gum     # ncurses menu
    imv     # view images
    img2pdf # images to pdf
  ];

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
  };

  programs.git = {
    enable = true;
    settings.user.name = "Alvaro Gonzalez";
    settings.user.email = "tychoma4@gmail.com";
  };

  programs.firefox.enable = true;

  xdg.configFile."waybar/config".source = ./waybar/config;
  xdg.configFile."waybar/style.css".source = ./waybar/style.css;

  #xdg.configFile."sway/config".source = ./sway/config; # sway
  xdg.configFile."sway/config".source = ./sway/configfx; # sway fx

  xdg.configFile."mako/config".source = ./mako/config;
  xdg.configFile."foot/foot.ini".source = ./foot/foot.ini;
  #
  xdg.configFile."niri/config.kdl".source = ./niri/config.kdl;
  #
  #xdg.configFile."nvim/lazy-lock.json".source = nvim/lazy-lock.json
  xdg.configFile."nvim/init.lua".source = ./nvim/init.lua;
  xdg.configFile."nvim/.neoconf.json".source = ./nvim/.neoconf.json;
  xdg.configFile."nvim/stylua.toml".source = ./nvim/stylua.toml;
  xdg.configFile."nvim/LICENSE".source = ./nvim/LICENSE;
  xdg.configFile."nvim/lazyvim.json".source = ./nvim/lazyvim.json;
  xdg.configFile."nvim/README.md".source = ./nvim/README.md;
  #xdg.configFile."nvim/lua".source = ./nvim/lua;
  #xdg.configFile."nvim/lua/plugins".source = ./nvim/lua/plugins;
  xdg.configFile."nvim/lua/plugins/example.lua".source = ./nvim/lua/plugins/example.lua;
  xdg.configFile."nvim/lua/plugins/disable.lua".source = ./nvim/lua/plugins/disable.lua;
  #xdg.configFile."nvim/lua/config".source = ./nvim/lua/config;
  xdg.configFile."nvim/lua/config/lazy.lua".source = ./nvim/lua/config/lazy.lua;
  xdg.configFile."nvim/lua/config/autocmds.lua".source = ./nvim/lua/config/autocmds.lua;
  xdg.configFile."nvim/lua/config/options.lua".source = ./nvim/lua/config/options.lua;
  xdg.configFile."nvim/lua/config/keymaps.lua".source = ./nvim/lua/config/keymaps.lua;
  #

  xdg.configFile."wofi".source = ./wofi;

  home.file.".zshrc".source = ./zsh/zshrc;
  home.file.".Xmodmap".source = ./zsh/Xmodmap;

  xdg.configFile."zsh" = {
    source = ./zsh/zsh;
    recursive = true;
  };

}
