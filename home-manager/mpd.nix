{
    pkgs, lib, ...
}:
{
    services = {
        mpd = {
            enable = true;
            musicDirectory = "Music";
        };
    };
}
