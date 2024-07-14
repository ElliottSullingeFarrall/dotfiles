{ lib
, pkgs
, ...
}:

{
  imports = [
    ./efi.nix
    ./silent.nix
  ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    kernelParams = [
      "boot.shell_on_fail" # Allows for root shell if failure to boot. Requires root password.
    ];

    loader = {
      grub = {
        enable = true;
        device = "nodev";
        timeoutStyle = "hidden";
      };
      timeout = lib.mkDefault 3;
    };

    plymouth.enable = true;
  };

  services.kmscon = {
    enable = true;
    hwRender = true;
  };
}
