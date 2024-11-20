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
ne = "nvim -c ':cd ~/.nixconf' ~/.nixconf";
nsh = "nix-shell";
ns = "nix search nixpkgs";
ngc = "nix-collect-garbage -d && nix-store --gc && nix-store --verify --check-contents && nix store optimise";
```

## Additional configuration steps: (Sadly not everything is reproducible easily).
1. Run aerospace for the first time.
2. Initialize a rustup toolchain. (ie. `rustup toolchain install stable`)
3. Run discord in the terminal first to patch its settings preventing the helper popup and auto updates.
4. If discord does prompt you with the helper popup, ignore it. If you dont, you can fix discord by doing this: 
> [!CAUTION]
> force removing the nix path that discord lays in with `rm -rf`
>
> nix-store --verify --check-contents --repair

## Roadmap:
- [ ] First initialization script to automate a few things.
- [ ] Convert current aerospace implementation into the now-available nix-darwin aerospace module
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
