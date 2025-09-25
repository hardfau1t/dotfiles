{lib, config, ...}: 
lib.mkIf config.services.dunst.enable {
    xdg.configFile."dunst/dunstrc".source = config.lib.file.mkOutOfStoreSymlink "${config.dots_dir}/homemanager-modules/gui_apps/dunst/dunstrc";
}
