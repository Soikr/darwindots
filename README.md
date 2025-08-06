<h1 align="center"> 
Soikr's Darwindots!
</h1>

![Preview](./Assets/Screenshot.png)
<p align="center"> A usable, performance oriented, and practical setup (2013 iMac)</p>

# Installation

### 1. Installing nix:
```shell
# Select NO for determinate option
curl -fsSL https://install.determinate.systems/nix | sh -s -- install
```
> [!CAUTION]  
> You MUST select NO when the determinate option shows up.
> 
> Otherwise uninstall.

### 2. Clone the repo into a designated spot in your home folder (ie. ~/.nixpgs):

```shell
nix shell --extra-experimental-features 'nix-command flakes' nixpkgs#git nixpkgs#vim
git clone https://github.com/SoiKr/darwindots ~/.nixconf
cd ~/.nixconf
```

### 3. Edit the configuration, especially the username and hostname

> [!IMPORTANT]  
> Dont forget to set your system hostname and user to this.

### 4. Setting up nix-darwin and applying the config:

```shell
sudo nix run nix-darwin/master#darwin-rebuild -- switch —flake .
```
> [!NOTE]  
> It may error due to missing XCode, you might have to install this.
> 
> Its too inconsistent to install through Nix.

Please reboot after this.

## Applying changes from the config
```shell
darwin-rebuild switch --flake ~/.nixconf
```

## Updating
```shell
nix flake update # All Inputs
nix flake lock --update-input <input> # Single  Input
```

### Preset ZSH Aliases for managing nix:
```
dr = darwin-rebuild switch --flake ~/.nixconf # Darwin
nim = "vim ~./.nixconf"
nsearch = "nix search nixpkgs"
ngc = "nix-collect-garbage -d && && nix store optimise"
nv = "nix store verify"
```

## Additional configuration steps:
1. Initialize a rustup toolchain. (ie. `rustup toolchain install stable`)
2. Configure Zen Browser, Tailscale, Syncthing, Discord
3. Launch Raycast, KeePassXC
4. Set wallpaper

## Resources
[nix-darwin Page](https://github.com/LnL7/nix-darwin/tree/master)

[nix-darwin Options](https://daiderd.com/nix-darwin/manual/index.html)

[home-manager Options](https://nix-community.github.io/home-manager/options.xhtml)

[Aerospace Guide](https://nikitabobko.github.io/AeroSpace/guide)

[Sketchybar Guide](https://felixkratz.github.io/SketchyBar)

## Credits
Code formatted with [Alejandra](https://github.com/kamadorueda/alejandra)
  - You can do this with `nix fmt`

Thanks for all the public github repos and software (I couldn't list every resource here) <3
