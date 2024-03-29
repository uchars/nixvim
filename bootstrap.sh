#!/usr/bin/env bash
# https://github.com/DieracDelta/vimconf_talk/blob/5_ci/setup.sh
NIX_PORTABLE_LOC="$PWD"
if [ ! -f "$NIX_PORTABLE_LOC/nix-portable" ]; then
  wget https://github.com/DavHau/nix-portable/releases/download/v008/nix-portable
fi
chmod +x nix-portable
NP_LOCATION=$NIX_PORTABLE_LOC NP_RUNTIME='bwrap' $PWD/nix-portable nix
printf "\nsubstituters = https://cache.nixos.org https://jrestivo.cachix.org \ntrusted-public-keys = cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY= jrestivo.cachix.org-1:+jSOsXAAOEjs+DLkybZGQEEIbPG7gsKW1hPwseu03OE=\n" >> $NIX_PORTABLE_LOC/.nix-portable/conf/nix.conf
printf "\nalias nix=\"NP_LOCATION=$NIX_PORTABLE_LOC NP_RUNTIME='bwrap' $PWD/nix-portable nix\"\n" >> $HOME/.bashrc
source $HOME/.bashrc
nix profile install .#nvim
