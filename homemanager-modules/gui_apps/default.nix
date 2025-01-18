{lib, config, ...}: {
  options = {};
  config = lib.mkIf config.gui_apps.enable {

  };
}
