{ lib, config, ... }:
lib.mkIf config.wayland.windowManager.hyprland.enable {
  wayland.windowManager.hyprland = {
    settings = {
      source = [
        "~/.config/hypr/themes/catppuccin-machiato.conf"
        "~/.config/hypr/shortcuts.conf"
        "~/.config/hypr/init.conf"
        "~/.config/hypr/private.conf"
        "~/.config/hypr/style.conf"
        "~/.config/hypr/workspace.conf"
        "~/.config/hypr/devices.conf"
        "~/.config/hypr/general.conf"
      ];
    };
    # systemd.enable = true;
    # xwayland.enable = false;
  };
}
