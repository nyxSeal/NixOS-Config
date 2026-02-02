
{ config, lib, pkgs, inputs, global,  ... }:



{

  # to create these ASCII titles: https://patorjk.com/software/taag/#p=display&f=Big+Money-ne



# /$$$$$$ /$$      /$$ /$$$$$$$   /$$$$$$  /$$$$$$$  /$$$$$$$$ /$$$$$$ 
#|_  $$_/| $$$    /$$$| $$__  $$ /$$__  $$| $$__  $$|__  $$__//$$__  $$
#  | $$  | $$$$  /$$$$| $$  \ $$| $$  \ $$| $$  \ $$   | $$  | $$  \__/
#  | $$  | $$ $$/$$ $$| $$$$$$$/| $$  | $$| $$$$$$$/   | $$  |  $$$$$$ 
#  | $$  | $$  $$$| $$| $$____/ | $$  | $$| $$__  $$   | $$   \____  $$
#  | $$  | $$\  $ | $$| $$      | $$  | $$| $$  \ $$   | $$   /$$  \ $$
# /$$$$$$| $$ \/  | $$| $$      |  $$$$$$/| $$  | $$   | $$  |  $$$$$$/
#|______/|__/     |__/|__/       \______/ |__/  |__/   |__/   \______/ 



  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];





# /$$      /$$ /$$$$$$  /$$$$$$   /$$$$$$ 
#| $$$    /$$$|_  $$_/ /$$__  $$ /$$__  $$
#| $$$$  /$$$$  | $$  | $$  \__/| $$  \__/
#| $$ $$/$$ $$  | $$  |  $$$$$$ | $$      
#| $$  $$$| $$  | $$   \____  $$| $$      
#| $$\  $ | $$  | $$   /$$  \ $$| $$    $$
#| $$ \/  | $$ /$$$$$$|  $$$$$$/|  $$$$$$/
#|__/     |__/|______/ \______/  \______/ 



  documentation.dev.enable = true; # enables extra man pages


 
  nixpkgs.config.allowUnfree = true; # allows unfree software to be installed





#  /$$$$$$  /$$     /$$ /$$      /$$ /$$       /$$$$$$ /$$   /$$ /$$   /$$  /$$$$$$ 
# /$$__  $$|  $$   /$$/| $$$    /$$$| $$      |_  $$_/| $$$ | $$| $$  /$$/ /$$__  $$
#| $$  \__/ \  $$ /$$/ | $$$$  /$$$$| $$        | $$  | $$$$| $$| $$ /$$/ | $$  \__/
#|  $$$$$$   \  $$$$/  | $$ $$/$$ $$| $$        | $$  | $$ $$ $$| $$$$$/  |  $$$$$$ 
# \____  $$   \  $$/   | $$  $$$| $$| $$        | $$  | $$  $$$$| $$  $$   \____  $$
# /$$  \ $$    | $$    | $$\  $ | $$| $$        | $$  | $$\  $$$| $$\  $$  /$$  \ $$
#|  $$$$$$/    | $$    | $$ \/  | $$| $$$$$$$$ /$$$$$$| $$ \  $$| $$ \  $$|  $$$$$$/
# \______/     |__/    |__/     |__/|________/|______/|__/  \__/|__/  \__/ \______/ 



  #systemd.tmpfiles.rules = let
  #homeDir = /home/${global.mainUser};
  #in [
  #  "L+ /homeDir/.local/share/Steam /homeDir/steam" # creates a symlink from normal steam directory to steam subvolume
  #  "L+ /homeDir/.steam /homeDir/steam" # creates a symlink from normal steam directory to steam subvolume
  #  #"f+ " # site said these were needed? not sure, just keeping them just in case
  #  "C+ /homeDir/steam /homeDir/.local/share/Steam" # site said these were needed? not sure, just keeping them just in case
  #  "C+ /homeDir/steam /homeDir/.steam" # site said these were needed? not sure, just keeping them just in case
  #];





#  /$$$$$$  /$$$$$$$  /$$$$$$$  /$$       /$$$$$$  /$$$$$$   /$$$$$$  /$$$$$$$$ /$$$$$$  /$$$$$$  /$$   /$$  /$$$$$$ 
# /$$__  $$| $$__  $$| $$__  $$| $$      |_  $$_/ /$$__  $$ /$$__  $$|__  $$__/|_  $$_/ /$$__  $$| $$$ | $$ /$$__  $$
#| $$  \ $$| $$  \ $$| $$  \ $$| $$        | $$  | $$  \__/| $$  \ $$   | $$     | $$  | $$  \ $$| $$$$| $$| $$  \__/
#| $$$$$$$$| $$$$$$$/| $$$$$$$/| $$        | $$  | $$      | $$$$$$$$   | $$     | $$  | $$  | $$| $$ $$ $$|  $$$$$$ 
#| $$__  $$| $$____/ | $$____/ | $$        | $$  | $$      | $$__  $$   | $$     | $$  | $$  | $$| $$  $$$$ \____  $$
#| $$  | $$| $$      | $$      | $$        | $$  | $$    $$| $$  | $$   | $$     | $$  | $$  | $$| $$\  $$$ /$$  \ $$
#| $$  | $$| $$      | $$      | $$$$$$$$ /$$$$$$|  $$$$$$/| $$  | $$   | $$    /$$$$$$|  $$$$$$/| $$ \  $$|  $$$$$$/
#|__/  |__/|__/      |__/      |________/|______/ \______/ |__/  |__/   |__/   |______/ \______/ |__/  \__/ \______/ 



  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    borgbackup # backup system
    btop # tui system monitor
    btop-rocm # shows gpu info for btop
    fastfetch
    floorp-bin # replacement for librewolf
    kdePackages.ksshaskpass # kde ssh agent 
    kdePackages.filelight # file usage visualizer
    #librewolf  # currently is broken
    omnissa-horizon-client # virtual desktop client
    prismlauncher # minecraft launcher
    tealdeer # man pages but shorter
    vesktop # discord client with plugins
    wget # idk
    vim # text editor
    vorta # gui for borgbackup
  ];



  programs.bash.enable = false;



  system.userActivationScripts.zshrc = "touch .zshrc";



  programs.zsh = { # shell language
    enable = true;
    #enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    ohMyZsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "agnoster"; 
    };

    shellAliases = { # aliases
      rewrite = "sudo nixos-rebuild switch --flake ~/.nixconfig"; 
      update = "sudo nix flake update";
      loadConfig = "vim ~/.nixconfig/configuration.nix";
      saveGit = "zsh ~/.nixconfig/gitSave.sh";
    };

    histSize = 10000;
    histFile = "~/.zsh_history";

    #setOptions = [
    #
    #];

  };



  system.activationScripts.createSteamSubvolume.text = ''
    if [ ! -d /home/nyxSeal/steam ]; then
      echo "Creating Btrfs subvolume for Steam..."
      btrfs subvolume create /home/nyxSeal/steam
    fi
  '';



  programs.steam = {
    enable = true;
    remotePlay.openFirewall = false; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };





#/$$$$$$$   /$$$$$$  /$$$$$$$  /$$$$$$$$ /$$$$$$ /$$$$$$$$ /$$$$$$  /$$$$$$  /$$   /$$ /$$$$$$ /$$   /$$  /$$$$$$ 
#| $$__  $$ /$$__  $$| $$__  $$|__  $$__/|_  $$_/|__  $$__/|_  $$_/ /$$__  $$| $$$ | $$|_  $$_/| $$$ | $$ /$$__  $$
#| $$  \ $$| $$  \ $$| $$  \ $$   | $$     | $$     | $$     | $$  | $$  \ $$| $$$$| $$  | $$  | $$$$| $$| $$  \__/
#| $$$$$$$/| $$$$$$$$| $$$$$$$/   | $$     | $$     | $$     | $$  | $$  | $$| $$ $$ $$  | $$  | $$ $$ $$| $$ /$$$$
#| $$____/ | $$__  $$| $$__  $$   | $$     | $$     | $$     | $$  | $$  | $$| $$  $$$$  | $$  | $$  $$$$| $$|_  $$
#| $$      | $$  | $$| $$  \ $$   | $$     | $$     | $$     | $$  | $$  | $$| $$\  $$$  | $$  | $$\  $$$| $$  \ $$
#| $$      | $$  | $$| $$  | $$   | $$    /$$$$$$   | $$    /$$$$$$|  $$$$$$/| $$ \  $$ /$$$$$$| $$ \  $$|  $$$$$$/
#|__/      |__/  |__/|__/  |__/   |__/   |______/   |__/   |______/ \______/ |__/  \__/|______/|__/  \__/ \______/                   


  boot = {
     
    loader = {
       systemd-boot.enable = true;
       efi.canTouchEfiVariables = true;
       timeout = 10; # extends the amount of time the generation table on boot is shown
     };
     
     kernelParams = [
       "zswap.enabled=1" # enables zswap
       "zswap.compressor=lz4" # compression algorithm
       "zswap.max_pool_percent=20" # maximum percentage of RAM that zswap is allowed to use
       "zswap.shrinker_enabled=1" # whether to shrink the pool proactively on high memory pressure
     ];
     
     initrd.systemd.enable = true; # required if using lz4 algorithm for zswap     
     kernelPackages = pkgs.linuxPackages_hardened; # use latest (hardened) kernel
  };



  services.swapspace = {
    enable = true; # dynamically creates swap when needed on SSD
    settings.swappath = "/home/${global.mainUser}/.swapspace";
  };




# /$$   /$$  /$$$$$$  /$$$$$$$  /$$$$$$$  /$$      /$$  /$$$$$$  /$$$$$$$  /$$$$$$$$
#| $$  | $$ /$$__  $$| $$__  $$| $$__  $$| $$  /$ | $$ /$$__  $$| $$__  $$| $$_____/
#| $$  | $$| $$  \ $$| $$  \ $$| $$  \ $$| $$ /$$$| $$| $$  \ $$| $$  \ $$| $$      
#| $$$$$$$$| $$$$$$$$| $$$$$$$/| $$  | $$| $$/$$ $$ $$| $$$$$$$$| $$$$$$$/| $$$$$   
#| $$__  $$| $$__  $$| $$__  $$| $$  | $$| $$$$_  $$$$| $$__  $$| $$__  $$| $$__/   
#| $$  | $$| $$  | $$| $$  \ $$| $$  | $$| $$$/ \  $$$| $$  | $$| $$  \ $$| $$      
#| $$  | $$| $$  | $$| $$  | $$| $$$$$$$/| $$/   \  $$| $$  | $$| $$  | $$| $$$$$$$$
#|__/  |__/|__/  |__/|__/  |__/|_______/ |__/     \__/|__/  |__/|__/  |__/|________/



  hardware = {
    graphics.enable = true;
  };





# /$$   /$$ /$$$$$$$$ /$$$$$$$$ /$$      /$$  /$$$$$$  /$$$$$$$  /$$   /$$ /$$$$$$ /$$   /$$  /$$$$$$ 
#| $$$ | $$| $$_____/|__  $$__/| $$  /$ | $$ /$$__  $$| $$__  $$| $$  /$$/|_  $$_/| $$$ | $$ /$$__  $$
#| $$$$| $$| $$         | $$   | $$ /$$$| $$| $$  \ $$| $$  \ $$| $$ /$$/   | $$  | $$$$| $$| $$  \__/
#| $$ $$ $$| $$$$$      | $$   | $$/$$ $$ $$| $$  | $$| $$$$$$$/| $$$$$/    | $$  | $$ $$ $$| $$ /$$$$
#| $$  $$$$| $$__/      | $$   | $$$$_  $$$$| $$  | $$| $$__  $$| $$  $$    | $$  | $$  $$$$| $$|_  $$
#| $$\  $$$| $$         | $$   | $$$/ \  $$$| $$  | $$| $$  \ $$| $$\  $$   | $$  | $$\  $$$| $$  \ $$
#| $$ \  $$| $$$$$$$$   | $$   | $$/   \  $$|  $$$$$$/| $$  | $$| $$ \  $$ /$$$$$$| $$ \  $$|  $$$$$$/
#|__/  \__/|________/   |__/   |__/     \__/ \______/ |__/  |__/|__/  \__/|______/|__/  \__/ \______/ 



  networking = {
    hostName = "${global.hostName}";
    networkmanager.enable = true; # enables network configurations interactively with nmcli or nmtui
  };



  time.timeZone = "America/New_York";



  services.openssh = {
    enable = true;
    ports = [ 5000 22 ];

    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };

  };



  programs.ssh = {
    startAgent = true;
    enableAskPassword = true;

    extraConfig = "
      Host backupServer
        Hostname 192.168.1.172
        Port 5000
        User scattergun
      Host github.com
        Hostname github.com
        Port 22
        User git
        IdentityFile ~/.ssh/id_ed25519_2
        IdentitiesOnly yes
    ";

  };



  environment.variables = {
    SSH_ASKPASS_REQUIRE = "prefer";
  };



  services = {
    displayManager.ly.enable = true;
    desktopManager.plasma6.enable = true;
    printing.enable = true; # Enables CUPS

    pipewire = {
      enable = true;
      pulse.enable = true;
    };

  };



  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;



  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";





# /$$      /$$  /$$$$$$  /$$$$$$ /$$   /$$ /$$$$$$$$ /$$$$$$$$ /$$   /$$  /$$$$$$  /$$   /$$  /$$$$$$  /$$$$$$$$
#| $$$    /$$$ /$$__  $$|_  $$_/| $$$ | $$|__  $$__/| $$_____/| $$$ | $$ /$$__  $$| $$$ | $$ /$$__  $$| $$_____/
#| $$$$  /$$$$| $$  \ $$  | $$  | $$$$| $$   | $$   | $$      | $$$$| $$| $$  \ $$| $$$$| $$| $$  \__/| $$      
#| $$ $$/$$ $$| $$$$$$$$  | $$  | $$ $$ $$   | $$   | $$$$$   | $$ $$ $$| $$$$$$$$| $$ $$ $$| $$      | $$$$$   
#| $$  $$$| $$| $$__  $$  | $$  | $$  $$$$   | $$   | $$__/   | $$  $$$$| $$__  $$| $$  $$$$| $$      | $$__/   
#| $$\  $ | $$| $$  | $$  | $$  | $$\  $$$   | $$   | $$      | $$\  $$$| $$  | $$| $$\  $$$| $$    $$| $$      
#| $$ \/  | $$| $$  | $$ /$$$$$$| $$ \  $$   | $$   | $$$$$$$$| $$ \  $$| $$  | $$| $$ \  $$|  $$$$$$/| $$$$$$$$
#|__/     |__/|__/  |__/|______/|__/  \__/   |__/   |________/|__/  \__/|__/  |__/|__/  \__/ \______/ |________/



  system.autoUpgrade = { # Automatic updating
    enable = true;
    dates = "weekly";
  };



  nix = { 

    gc = { # Automatic rollback version cleanup
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 10d";
    };

    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };

  };





# /$$$$$$$   /$$$$$$   /$$$$$$  /$$   /$$ /$$   /$$ /$$$$$$$ 
#| $$__  $$ /$$__  $$ /$$__  $$| $$  /$$/| $$  | $$| $$__  $$
#| $$  \ $$| $$  \ $$| $$  \__/| $$ /$$/ | $$  | $$| $$  \ $$
#| $$$$$$$ | $$$$$$$$| $$      | $$$$$/  | $$  | $$| $$$$$$$/
#| $$__  $$| $$__  $$| $$      | $$  $$  | $$  | $$| $$____/ 
#| $$  \ $$| $$  | $$| $$    $$| $$\  $$ | $$  | $$| $$      
#| $$$$$$$/| $$  | $$|  $$$$$$/| $$ \  $$|  $$$$$$/| $$      
#|_______/ |__/  |__/ \______/ |__/  \__/ \______/ |__/      



  programs.git = {
    enable = true;

    config = {
      user.name = "${global.gitUsername}";
      user.email = "${global.gitEmail}";
      pull.rebase = false;
      #commit.gpgsign = true;
    };

  };



  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;





#  /$$$$$$  /$$$$$$$$  /$$$$$$  /$$   /$$ /$$$$$$$  /$$$$$$ /$$$$$$$$ /$$     /$$
# /$$__  $$| $$_____/ /$$__  $$| $$  | $$| $$__  $$|_  $$_/|__  $$__/|  $$   /$$/
#| $$  \__/| $$      | $$  \__/| $$  | $$| $$  \ $$  | $$     | $$    \  $$ /$$/ 
#|  $$$$$$ | $$$$$   | $$      | $$  | $$| $$$$$$$/  | $$     | $$     \  $$$$/  
# \____  $$| $$__/   | $$      | $$  | $$| $$__  $$  | $$     | $$      \  $$/   
# /$$  \ $$| $$      | $$    $$| $$  | $$| $$  \ $$  | $$     | $$       | $$    
#|  $$$$$$/| $$$$$$$$|  $$$$$$/|  $$$$$$/| $$  | $$ /$$$$$$   | $$       | $$    
# \______/ |________/ \______/  \______/ |__/  |__/|______/   |__/       |__/    



  security = {
    unprivilegedUsernsClone = true; # Allows apps to be launched with hardened kernel
    apparmor.enable = true;
    #allowUserNamespaces = true; # Needed for sandboxing?
    sudo.execWheelOnly = true;
    protectKernelImage = true;
  };  





# /$$   /$$  /$$$$$$  /$$$$$$$$ /$$$$$$$   /$$$$$$ 
#| $$  | $$ /$$__  $$| $$_____/| $$__  $$ /$$__  $$
#| $$  | $$| $$  \__/| $$      | $$  \ $$| $$  \__/
#| $$  | $$|  $$$$$$ | $$$$$   | $$$$$$$/|  $$$$$$ 
#| $$  | $$ \____  $$| $$__/   | $$__  $$ \____  $$
#| $$  | $$ /$$  \ $$| $$      | $$  \ $$ /$$  \ $$
#|  $$$$$$/|  $$$$$$/| $$$$$$$$| $$  | $$|  $$$$$$/
# \______/  \______/ |________/|__/  |__/ \______/ 



  users.users.${global.mainUser} = { # define a user account
    isNormalUser = true;
    extraGroups = [ "wheel" "git" "networkmanager"];

    packages = with pkgs; [
      tree
    ];

  };





  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };





# /$$$$$$$   /$$$$$$        /$$   /$$  /$$$$$$  /$$$$$$$$       /$$$$$$$$ /$$$$$$  /$$   /$$  /$$$$$$  /$$   /$$
#| $$__  $$ /$$__  $$      | $$$ | $$ /$$__  $$|__  $$__/      |__  $$__//$$__  $$| $$  | $$ /$$__  $$| $$  | $$
#| $$  \ $$| $$  \ $$      | $$$$| $$| $$  \ $$   | $$            | $$  | $$  \ $$| $$  | $$| $$  \__/| $$  | $$
#| $$  | $$| $$  | $$      | $$ $$ $$| $$  | $$   | $$            | $$  | $$  | $$| $$  | $$| $$      | $$$$$$$$
#| $$  | $$| $$  | $$      | $$  $$$$| $$  | $$   | $$            | $$  | $$  | $$| $$  | $$| $$      | $$__  $$
#| $$  | $$| $$  | $$      | $$\  $$$| $$  | $$   | $$            | $$  | $$  | $$| $$  | $$| $$    $$| $$  | $$
#| $$$$$$$/|  $$$$$$/      | $$ \  $$|  $$$$$$/   | $$            | $$  |  $$$$$$/|  $$$$$$/|  $$$$$$/| $$  | $$
#|_______/  \______/       |__/  \__/ \______/    |__/            |__/   \______/  \______/  \______/ |__/  |__/



  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  system.stateVersion = "25.11"; # did you read?





}

