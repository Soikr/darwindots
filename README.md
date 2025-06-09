<h1 align="center"> 
Soikr's Darwindots!
</h1>

![Screenshot 2025-01-19 at 01 32 44](https://github.com/user-attachments/assets/eeebd424-5683-40b4-a58c-624cf11c8974)
<p align="center"> A usable and practical setup (2013 iMac)</p>

# Installation

### 1. Installing nix and homebrew:
```shell
sh <(curl -L https://nixos.org/nix/install)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. Clone the repo into a designated spot in your home folder (ie. ~/.nixpgs):

```shell
nix shell --extra-experimental-features 'nix-command flakes' nixpkgs#git nixpkgs#vim
git clone https://github.com/SoiKr/darwindots ~/.nixconf
cd ~/.nixconf
```

### 3. Change the hostname and username in the `flake.nix`:

```nix
~/.nixconf/flake.nix

38.      user = "soikr";
39.      hostname = "snowmalus";
```
> [!WARNING]  
> Dont forget to set your system hostname and user to this and reboot.

### 4. Setting up nix-darwin and applying the config:

```shell
nix --extra-experimental-features "nix-command flakes" build ".#darwinConfigurations.hostname_here.system"
./result/sw/bin/darwin-rebuild switch --flake .
```

<details>
<summary>If you already have the nix-darwin binary built:</summary>
<p></p>

```shell
nix run --extra-experimental-features 'nix-command flakes' nix-darwin -- switch --flake ".#darwinConfigurations.hostname_here.system"
darwin-rebuild switch --flake .
```

</details>

## Applying changes from the config
```shell
darwin-rebuild switch --flake ~/.
```

Please reboot after this.

## Updating
```shell
nix flake update # All Inputs
nix flake lock --update-input <input> # Single  Input
```

### Preset ZSH Aliases for managing nix:
```
dr = darwin-rebuild switch --flake ~/.nixconf
nim = "nvim -c ':cd ~/.nixconf' ~/.nixconf"
nsh = "nix-shell"
nsearch = "nix search nixpkgs"
ngc = "nix-collect-garbage -d && && nix store optimise"
nv = "nix store verify"
```

## Additional configuration steps: (Sadly not everything is reproducible easily).
1. Initialize a rustup toolchain. (ie. `rustup toolchain install stable`)

## Roadmap:
- [ ] Further nixify the config (options, colors, templates, all the stuff i dont wanna set up)

## Resources
[nix-darwin](https://github.com/LnL7/nix-darwin/tree/master)
[nix-darwin options](https://daiderd.com/nix-darwin/manual/index.html)
[home-manager options](https://nix-community.github.io/home-manager/options.xhtml)

## Credits
Code formatted with [Alejandra](https://github.com/kamadorueda/alejandra)
  - You can do this with `nix fmt`

[breuerfelix's dotfiles](https://github.com/breuerfelix/dotfiles) for providing a base to learn nix and nix-darwin.

[bfpimentel's dotfiles](https://github.com/bfpimentel/nixos) for their sketchybar/aerospace integration setup.
