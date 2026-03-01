{pkgs, ...}: {

  options = {
    niri.enable = lib.mkEnableOption "enable niri";
  };

  config = lib.mkIf config.niri.enable {

   programs.niri.enable = true; 

  };

}
