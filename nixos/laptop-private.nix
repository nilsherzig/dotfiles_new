{ ... }: {
  networking.hostName = "laptop";
  hardware.tuxedo-rs.enable = false;
  hardware.tuxedo-rs.tailor-gui.enable = false;
  hardware.tuxedo-keyboard.enable = true;
  networking = {
    # trustedInterfaces = [ "virbr0" ];
    firewall = {
      enable = true;
      allowedTCPPorts = [ 8080 ];
      allowedUDPPorts = [ ];
    };
  };
  system.stateVersion = "23.11";

  services = {
    mullvad-vpn.enable = true;
    udev.extraRules = ''
      KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{serial}=="*vial:f64c2b3c*", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
      KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
    '';
    power-profiles-daemon.enable = false;
    # tailscale = {
    #   enable = true;
    #   extraUpFlags = [ "--ssh" ];
    # };
    # i hate fan noise, while using my laptop on my lap 
    tlp = {
      enable = true;
      settings = {
        START_CHARGE_THRESH_BAT0 = "75";
        STOP_CHARGE_THRESH_BAT0 = "80";

        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        CPU_SCALING_MIN_FREQ_ON_AC = "400000";
        CPU_SCALING_MAX_FREQ_ON_AC = "8000000"; # not actually

        # battery usage does not scale linar to frequency. 
        # cutting frequency in half reduces power usage by about two thirds
        CPU_SCALING_MIN_FREQ_ON_BAT = "400000";
        CPU_SCALING_MAX_FREQ_ON_BAT = "2000000";

        CPU_BOOST_ON_AC = "1";
        CPU_BOOST_ON_BAT = "0";
      };
    };
  };
}
