{config, lib, pkgs, inputs, user, ...}:

{
    imports = [];
    user.users.${user} = {};
    time = {};
    i18n = {};
    console = {};
    security = {};
    fonts = {};
    enviroment = {};
    services = {};
    xdg = {};
    nix = {};
    nixpkgs = {};
    system = {};
}