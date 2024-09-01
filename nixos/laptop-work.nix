{ ... }: {
  networking.hostName = "work-laptop";
  networking = { firewall = { enable = true; }; };
  system.stateVersion = "23.11";
}
