{ config, ... }:
let
  create_dot_path =
    file_path:
    config.lib.file.mkOutOfStoreSymlink "${config.dots_dir}/homemanager-modules/configs/${file_path}";
  create_dot_path_recursive = file_path: {
    source = create_dot_path file_path;
    recursive = true;
  };
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
      "nvim/after" = create_dot_path_recursive "nvim/after";
      "nvim/ftplugin" = create_dot_path_recursive "nvim/ftplugin";
      "nvim/lua" = create_dot_path_recursive "nvim/lua";
      "nvim/init.lua".source = create_dot_path "nvim/init.lua";
      "nvim/lazy-lock.json".source = create_dot_path "nvim/lazy-lock.json";
      "nvim/rocks.toml".source = create_dot_path "nvim/rocks.toml";
      "nvim/snippets".source = create_dot_path "nvim/snippets";
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
      "zellij/config.kdl".source = create_dot_path "zellij/config.kdl";
      "zellij/layouts" = create_dot_path_recursive "zellij/layouts";
      "zellij/themes" = create_dot_path_recursive "zellij/themes";

      "alacritty" = create_dot_path_recursive "alacritty";

      "uwsm/env".source = create_dot_path "uwsm/env";
      "nushell/config.nu".source = create_dot_path "nushell/config.nu";
      "nushell/env.nu".source = create_dot_path "nushell/env.nu";
      "nushell/login.nu".source = create_dot_path "nushell/login.nu";
      "nushell/libs" = {
        source = create_dot_path "nushell/libs";
        recursive = true;
      };
    };
    dataFile."qmk/keyboards/crkbd/keymaps/hardfau1t" = create_dot_path_recursive "qmk/keyboards/crkbd/keymaps/hardfau1t/";
  };
}
