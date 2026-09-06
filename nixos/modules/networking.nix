{ ... }: {
  networking.networkmanager.enable = true;
  networking.firewall.allowedTCPPorts = [
    53317
    5173
  ];

  networking.firewall.allowedUDPPorts = [
    53317
  ];
}
