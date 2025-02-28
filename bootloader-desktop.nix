{ config, pkgs, ...}:

{
    # Bootloader.
    boot = {
        loader = {
            grub = {
                device = "/dev/nvme0n1";
                enable = true;
                useOSProber = true;
            };
        };
    };
}
