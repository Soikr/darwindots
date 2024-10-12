<h1 align="center"> 
Soikr's Darwindots!
</h1>

![image](https://github.com/user-attachments/assets/0d97ed13-da67-4078-8471-d07380fbeed9)
<p align="center"> A usable and practical setup</p>

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

> [!NOTE]  
> The zsh.nix file located in home-manager/modules/ calls for the folder ~/.nixconf for some nice basic aliases. Change this if you want.

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

> [!WARNING]  
> I have set homebrew and its applications to not update and upgrade automatically through use of darwin-rebuild. Please use brew update and brew upgrade for this.

## Updating
```shell
nix flake update # All Inputs
nix flake lock --update-input <input> # Single  Input
```

### Preset ZSH Aliases for managing nix:
```
dr = darwin-rebuild switch --flake ~/.nixconf
ne = "nvim -c ':cd ~/.nixconf' ~/.nixconf";
nsh = "nix-shell";
ns = "nix search nixpkgs";
ngc = "nix-collect-garbage -d && nix-store --gc && nix-store --verify --check-contents && nix store optimise";
```

## Additional configuration steps: (Sadly not everything is reproducible easily).
1. Run aerospace for the first time.
2. Enable and configure firefox extensions (pre-installed) or setup zen browser.
3. Initialize a rustup toolchain. (ie. `rustup toolchain install stable`)
4. Installing your preferred JetBrains IDEs through the toolbox.
> [!NOTE]  
> You may have to apply `-Dsun.java2d.metal=false` to the applications JVM options
5. When running discord, do NOT add a helper. If you do, you can fix it by
> [!CAUTION]
> force removing the nix path that discord lays in with `rm -rf`
> nix-store --verify --check-contents --repair

## Roadmap:
- [ ] Fix sketchybar eventually
- [ ] Further nixify the config (options, colors, templates, all the stuff i dont wanna set up)
- [ ] Add additional configuration steps (its not complete).

## Credits
Code formatted with [Alejandra](https://github.com/kamadorueda/alejandra)
  - You can do this with `nix fmt`

[breuerfelix's dotfiles](https://github.com/breuerfelix/dotfiles) for providing a base to learn nix and nix-darwin.

[bfpimentel's dotfiles](https://github.com/bfpimentel/nixos) for their sketchybar/aerospace integration setup. (Learn off of this guy not me)
