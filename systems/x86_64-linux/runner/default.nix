{ ...
}:

{
  imports = [
    ./services
  ];

  environment.persistence."/persistent" = {
    hideMounts = true;
    files = [
      "/var/lib/nixos"
      "/var/lib/tailscale"
      "/etc/ssh/ssh_host_ed25519_key"
      "/etc/ssh/ssh_host_ed25519_key.pub"
      "/etc/ssh/ssh_host_rsa_key"
      "/etc/ssh/ssh_host_rsa_key.pub"
    ];
    users.elliott.files = [
      ".ssh/id_ed25519"
      ".ssh/id_ed25519.pub"
      ".ssh/id_rsa"
      ".ssh/id_rsa.pub"
    ];
  };

  /* --------------------------------- Locale --------------------------------- */

  locale = "uk";

}
