# NixOS Configuration (Flake-based)

This repository contains my **NixOS + Home Manager configuration** using **Nix flakes**.
It manages:

* system configuration
* user packages
* dotfiles (sway, waybar, foot, wofi)
* development tools

Everything needed to reproduce the system lives in this repository.

---

# Repository Structure

```
nix-config/
├── flake.lock
├── flake.nix
├── home-manager
│   ├── foot
│   │   └── foot.ini
│   ├── home.nix
│   ├── mako
│   │   └── config
│   ├── nvim
│   │   ├── init.lua
│   │   ├── lazy-lock.json
│   │   ├── lazyvim.json
│   │   ├── LICENSE
│   │   ├── lua
│   │   │   ├── config
│   │   │   │   ├── autocmds.lua
│   │   │   │   ├── keymaps.lua
│   │   │   │   ├── lazy.lua
│   │   │   │   └── options.lua
│   │   │   └── plugins
│   │   │       ├── disable.lua
│   │   │       └── example.lua
│   │   ├── README.md
│   │   └── stylua.toml
│   ├── sway
│   │   └── config
│   ├── waybar
│   │   ├── config
│   │   └── style.css
│   └── zsh
│       ├── Xmodmap
│       ├── zsh
│       │   ├── aliases.zsh
│       │   ├── config.zsh
│       │   ├── env.zsh
│       │   └── path.zsh
│       └── zshrc
├── nixos
│   ├── configuration.nix
│   └── hardware-configuration.nix
└── README.md
```

* `flake.nix` – main entry point for the system
* `nixos/` – system-level configuration
* `home-manager/` – user environment and dotfiles
* dotfiles are symlinked into `~/.

## Quick starts

After nixOS is installed:

1. Clone the configuration repository

    Clone this repository anywhere (commonly in the home directory):

    ```sh
    nix run nixpkgs#git clone https://github.com/lvarin/nix-config
    cd nix-config
    ```

2. Copy your hardware configuration

    NixOS generates a hardware configuration during installation.

    Copy it into the repository:

    ```sh
    sudo cp /etc/nixos/hardware-configuration.nix nixos/
    ```

3. Verify the hostname

    Ensure the hostname in flake.nix and nixos/configuration.nix matches your system.

    Example:

    ```sh
    networking.hostName = "xixon";
    ```

    And the flake rebuild command will use the same hostname.

4. Build the system using the flake

    Run:

    ```sh
    sudo nixos-rebuild switch --flake .#xixon
    ```

    Where xixon is the hostname defined in the flake.

    This will:

    - build the system configuration
    - install packages
    - configure Home Manager
    - link all dotfiles into ~/.config

### Updating the System

To update package versions:

```sh
nix flake update
```

Update the kernel:

```sh
sudo nixos-rebuild boot --flake .#xixon
```

Then rebuild:

```sh
sudo nixos-rebuild switch --flake .#xixon
```

### Updating Configuration

After editing any file in this repository:

```sh
sudo nixos-rebuild switch --flake .#xixon
```

