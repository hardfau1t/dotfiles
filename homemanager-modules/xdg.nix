{ config, ... }:
let
  create_dot_path =
    file_path:
    config.lib.file.mkOutOfStoreSymlink "${config.dots_dir}/homemanager-modules/configs/${file_path}";
in
{
  xdg = {
    configFile = {
      "starship.toml".source = create_dot_path "starship.toml";
      "bat" = {
        source = create_dot_path "bat";
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
        source = create_dot_path "nvim";
        recursive = true;
      };
      "xkb" = {
        source = create_dot_path "xkb";
        recursive = true;
      };
      "eww" = {
        source = create_dot_path "eww";
        recursive = true;
      };
      "hypr" = {
        source = create_dot_path "hypr";
        recursive = true;
      };
      "zellij" = {
        source = create_dot_path "zellij";
        recursive = true;
      };
      "alacritty" = {
        source = create_dot_path "alacritty";
        recursive = true;
      };
      uwsm = {
        source = create_dot_path "uwsm";
        recursive = true;
      };
      "nushell/config.nu".source = create_dot_path "nushell/config.nu";
      "nushell/env.nu".source = create_dot_path "nushell/env.nu";
      "nushell/login.nu".source = create_dot_path "nushell/login.nu";
      "nushell/libs" = {
        source = create_dot_path "nushell/libs";
        recursive = true;
      };
    };
  };
}
