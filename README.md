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

# Applying changes from the config
```shell
darwin-rebuild switch --flake ~/.
```

Please reboot after this.

> [!WARNING]  
> I have set homebrew and its applications to not update and upgrade automatically through use of darwin-rebuild. Please use brew update and brew upgrade for this.

### Updating
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
1. Enable Brew services: (Very much optional, jankyborders is the only one configured in this system).
   - `brew services start borders`
   - `brew services start syncthing`
   - `brew services start sketchybar`
2. Installing your preferred JetBrains IDEs through the toolbox.
> [!NOTE]  
> You may have to apply `-Dsun.java2d.metal=false` to the applications JVM options
3. Sadly, firefox can be slightly buggy at first initialization and crash. Look at this:
    1. https://github.com/nix-community/home-manager/issues/3323
4. Run aerospace for the first time.
5. Vesktop may crash. Ignore it and try again. Quit the initilization stuff vesktop does.
6. Enable and configure firefox extensions (pre-installed).
7. Initialize a rustup toolchain. (ie. `rustup toolchain install stable`)

## Roadmap:
- [ ] Writing a flake for a neovim configuration.
- [ ] Migrate to flake-parts.
- [ ] Extra testing and fixes in certain modules (ie. Roblox) and advance them by making proper homemanager flake modules.
- [ ] Sketchybar configuration.
- [ ] Add additional configuration steps (its not complete).

##
Code formatted with [Alejandra](https://github.com/kamadorueda/alejandra)
  - You can do this with `nix fmt`

Credits to [breuerfelix's dotfiles](https://github.com/breuerfelix/dotfiles) for providing a base to learn nix and nix-darwin.
