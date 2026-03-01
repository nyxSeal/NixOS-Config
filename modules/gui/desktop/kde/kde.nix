{pkgs, lib, config, ...}: {

  options = {
    kde.enable = lib.mkEnableOption "enable kde plasma";
  };

  config = lib.mkIf config.kde.enable {
    desktopManager.plasma6.enable = true;
  };

}
