{ pkgs, ... }:
{
  plugins.vimtex = {
    enable = true;
    zathuraPackage = pkgs.zathura;
    texlivePackage = null;
  };
}
