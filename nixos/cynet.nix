{ pkgs, ... }:
{
  systemd = {
    services.cynet = {
      description = "custom cynet service";
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];
      path = with pkgs; [ nix ];
      script = "/run/current-system/sw/bin/nix-alien /home/nils/Downloads/cynet/temp/opt/Cynet/CynetEPS slb.cynet.com -port 443 -lightagent -cs -msi -tknv 1 -tkn e5f81617-c072-40b9-9a4e-3c8be22ab3d0 -nosp";

      serviceConfig = {
        Restart = "always";
        User = "root";
      };
    };
  };
}
