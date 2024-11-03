{ pkgs, ... }:
{
  plugins.vimtex = {
    enable = true;
    zathuraPackage = pkgs.zathura;
    texlivePackage = null;
    settings = {
      view_method = "zathura";
    };
  };
}
