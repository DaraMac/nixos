{
    pkgs, lib, ...
}:
{
    programs = {
        rofi = {
            enable = true;
            package = pkgs.rofi-wayland;
            plugins = [ pkgs.rofi-calc ];
        };
    };
}
