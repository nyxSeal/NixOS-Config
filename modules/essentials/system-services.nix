{pkgs, config, lib, ...}: {



  networking.networkmanager.enable = true;



  services.printing.enable = lib.mkDefault false;

  nixpkgs.config.allowUnfree = lib.mkDefault true;

  time.timeZone = lib.mkDefault "America/New_York";

  environment.systemPackages = [
    pkgs.wget # downloading tool often a default in linux
    pkgs.vim # very useful text editor
    pkgs.btop # tui system monitor
    pkgs.fastfetch # up-to-date neofetch
    pkgs.borgbackup # backup system
  ];

  networking.hostName = "${config.hostName}";

  
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;


  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";




  security = {
    apparmor.enable = true;
    sudo.execWheelOnly = true;
    protectKernelImage = true;
  };








  system.autoUpgrade = {
    enable = true;
    dates = "weekly";
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than-14d";
  };

  nix.settings = {
    auto-optimise-store = true;
    experimental-features = ["nix-command" "flakes" ];
  };








  system.stateVersion = "25.11"; # DO NOT CHANGE THIS VALUE UNLESS YOU ABSOLUTELY KNOW WHAT YOU ARE DOING


}
