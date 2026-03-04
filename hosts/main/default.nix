{config, lib, pkgs, ...}: { 

  imports = [
    ./../../modules/modulebundle.nix
    ./hardware-configuration.nix
  ];


  config = {

    # user info
    mainUser = "nyxSeal";
    hostName = "nixy";
    allowedSshUser = "scattergun";
 
    # gui-related
    entertainment.enable = lib.mkForce true;
    gui.enable = lib.mkForce true;
    kde.enable = lib.mkForce true;
    home-manager.enable = lib.mkForce true;
    guiapps.enable = lib.mkForce true;
    librewolf.enable = lib.mkForce true;

    # system
    sound-driver.enable = lib.mkForce true;
    swapspace.enable = lib.mkForce true;
    zswap.enable = lib.mkForce true;
    systemd-boot.enable = lib.mkForce true;
    amd-gpu.enable = lib.mkForce true;

    # other
    services.printing.enable = lib.mkForce true;
    development.enable = lib.mkForce true;


    # user declaration
    users.users."${config.mainUser}" = {
      isNormalUser = true;
      extraGroups = [ "wheel" "git" "networkmanager" ];

      packages = [
        pkgs.tree
      ];

    };


  };



}
