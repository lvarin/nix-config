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
├─ flake.nix
├─ flake.lock
├─ nixos/
│  ├─ configuration.nix
│  └─ hardware-configuration.nix
└─ home-manager/
   ├─ home.nix
   ├─ sway/
   │  └─ config
   ├─ waybar/
   │  ├─ config
   │  └─ style.css
   ├─ foot/
   │  └─ foot.ini
   └─ wofi/
      └─ config
```

* `flake.nix` – main entry point for the system
* `nixos/` – system-level configuration
* `home-manager/` – user environment and dotfiles
* dotfiles are symlinked into `~/.

## Quick starts

After nixOS is installed:

1. Enable flakes

    Edit the system configuration:

    ```sh
    sudo nano /etc/nixos/configuration.nix
    ```

    Add:

    ```ini
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    ```

    Apply once:

    ```sh
    sudo nixos-rebuild switch
    ```

2. Clone the configuration repository

    Clone this repository anywhere (commonly in the home directory):

    ```sh
    git clone https://github.com/YOUR_USERNAME/nix-config
    cd nix-config
    ```

3. Copy your hardware configuration

    NixOS generates a hardware configuration during installation.

    Copy it into the repository:

    ```sh
    sudo cp /etc/nixos/hardware-configuration.nix nixos/
    ```

4. Verify hostname

    Ensure the hostname in flake.nix and nixos/configuration.nix matches your system.

    Example:

    ```sh
    networking.hostName = "xixon";
    ```

    And the flake rebuild command will use the same hostname.

5. Build the system using the flake

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

Then rebuild:

```sh
sudo nixos-rebuild switch --flake .#xixon
```

### Updating Configuration

After editing any file in this repository:

```sh
sudo nixos-rebuild switch --flake .#xixon
```

