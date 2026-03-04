{pkgs, lib, config, ... }: {

  options = {
    ssh.enable = lib.mkEnableOption "enable ssh";
  };

  config = lib.mkIf config.ssh.enable {

    services.openssh = {
      enable = true;
      ports = [ 22 ];

      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
        AllowUsers = [ "${config.allowedSshUser}" ];
      };

    };

    programs.ssh = {
      startAgent = true;
      enableAskPassword = true;

      extraConfig = "
        Host backup
          Hostname 192.168.1.172
          Port 22
          User scattergun
          IdentityFile ~/.ssh/id_ed25519_backup
          IdentitiesOnly yes
        Host github.com
          Hostname github.com
          Port 22
          User git
          IdentityFile ~/.ssh/id_ed25519_github
          IdentitiesOnly yes
        Host main
          Hostname 192.168.1.185
          Port 22
          User nyxSeal
          IdentityFile ~/.ssh/id_ed25519_main
          IdentitiesOnly yes
       ";
     
    };

    programs.git = {
      enable = true;

      config = {
        user.name = "${config.gitUsername}";
        user.email = "${config.gitEmail}";
        #commit.gpgsign = true;
      };

    };

  };


}
