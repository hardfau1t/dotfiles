{ lib, config, ... }:
{
  config = lib.mkIf config.wallpapers.enable {

    home.file = {
      ".local/share/wallpaper/main-mon.png".source = ./home.png;
      ".local/share/wallpaper/external-mon.png".source = ./home.png;
      ".local/share/wallpaper/main-mon-lock.png".source = ./lockscreen.png;
      ".local/share/wallpaper/external-mon-lock.png".source = ./lockscreen.png;
    };
  };
}
