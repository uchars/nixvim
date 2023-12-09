## Bootstrap

```bash
curl -o- https://raw.githubusercontent.com/uchars/nixvim/main/bootstrap.sh | bash
```

This script does the following.

1. Downloads & sets up nix-portable
2. Downloads the repository
3. Installs nvim

## Installation

Install NixOS or the nix package manager: https://nixos.org/download

> NOTE (corporate): make sure the `HTTP(s)_PROXY`, `http(s)_proxy`, `ftp_proxy` environment variables are set

### NixOS (with flakes)

1. Add your flake to you NixOS flake inputs.
1. Add the overlay provided by this flake.

```nix
nixpkgs.overlays = [
    # replace <kickstart-nix-nvim> with the name you chose
    <kickstart-nix-nvim>.overlays.default
];
```

You can then add the overlay's output(s) to the `systemPackages`:

```nix
environment.systemPackages = with pkgs; [
    nvim-pkg # The default package added by the overlay
];
```

### Non-NixOS

With Nix installed (flakes enabled), from the repo root:

```console
nix profile install .#nvim
```
