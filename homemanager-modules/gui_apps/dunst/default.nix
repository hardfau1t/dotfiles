{lib, config, ...}: 
lib.mkIf config.services.dunst.enable {
    xdg.configFile."dunst/dunstrc".source = ./dunstrc;
}
