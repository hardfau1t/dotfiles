{ ... }:
{
  xdg = {
    configFile = {
      "starship.toml".source = ./configs/starship.toml;
      "bat" = {
        source = ./configs/bat;
        recursive = true;
      };
      "ipython/profile_default/ipython_config.py".text = ''
        c = get_config()  #noqa
        c.TerminalIPythonApp.display_banner = False
        c.InteractiveShell.pdb = False
        c.InteractiveShell.quiet = False
        c.TerminalInteractiveShell.editing_mode = 'vi'
        c.TerminalInteractiveShell.extra_open_editor_shortcuts = True
        c.TerminalInteractiveShell.quiet = True
      '';
      "nvim" = {
        source = ./configs/nvim;
        recursive = true;
      };
      "xkb" = {
        source = ./configs/xkb;
        recursive = true;
      };
      "eww" = {
        source = ./configs/eww;
        recursive = true;
      };
      "hypr" = {
        source = ./configs/hypr;
        recursive = true;
      };
      # ".config/starship.toml".source = ./configs/starship.toml;
      "zellij" = {
        source = ./configs/zellij;
        recursive = true;
      };
      "alacritty" = {
        source = ./configs/alacritty;
        recursive = true;
      };
      uwsm = {
        source = ./configs/uwsm;
        recursive = true;
      };
      "waybar" = {
        source = ./configs/waybar;
        recursive = true;
      };
    };
  };
}
