# Installation

### 1. Installing nix:
```shell
sh <(curl -L https://nixos.org/nix/install)
```

### 2. Clone the repo into a designated spot in your home folder (ie. ~/.nixconf):

```shell
nix shell --extra-experimental-features 'nix-command flakes' nixpkgs#git nixpkgs#vim
git clone https://github.com/SoiKr/MacOS-Nix-Config.git ~/.nixconf
cd ~/.nixconf
```

### 3. Change the hostname and username in the `flake.nix`:

`vim ./flake.nix`
```nix
~/.nixconf/flake.nix

38.      user = "aridflake";
39.      hostname = "Arids-iMac";
```

### 4. Setting up nix-darwin and applying the config:

```shell
nix run --extra-experimental-features 'nix-command flakes' nix-darwin -- switch --flake .
darwin-rebuild switch --flake .
```

<details>
<summary>If darwin-rebuild isnt found:</summary>
<p></p>

```shell
nix --extra-experimental-features "nix-command flakes" build .
./result/sw/bin/darwin-rebuild switch --flake .
```

</details>

# Applying changes from the config
```shell
darwin-rebuild switch --flake ~/.
```

##### Imagine `nixos-rebuild switch` but its darwin. Does the same thing.
