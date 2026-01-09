# Ansible Playbook for Arch Linux

This playbook automates the installation and configuration of an Arch Linux machine for personal use. The installation is organized in **6 phases** to ensure proper dependency order and system stability.

## Requirements

Install `ansible` on your machine:

```bash
sudo pacman -S ansible
```

Also install the `community.general` collection for AUR support:

```bash
ansible-galaxy collection install community.general
```

## Installation Phases

The playbook is organized in logical phases that should be executed in order:

### System Initialization
**Purpose**: Setup base system requirements before installing any packages
- **base**: Essential system packages (stow, git, base-devel, openssh, sddm, plymouth)
- **yay**: AUR helper installation
- **dotfiles**: Clone and setup dotfiles repository
- **power-profiles-daemon**: Power management

### Hardware & Services
**Purpose**: Configure system-level services and hardware support
- **wifi**: Network connectivity (iwd, impala TUI)
- **bluetooth**: Bluetooth services (blueberry, bluetui)
- **gpu**: NVIDIA drivers and utilities
- **authentication**: Security packages (gnome-keyring, 1password)

### Development Tools
**Purpose**: Setup terminal, shells, development tools, IDEs, and programming environments
- **terminal**: Terminal emulators (kitty, ghostty)
- **shell**: Shell configuration (fish, zsh, starship)
- **tools**: CLI utilities (fzf, ripgrep, eza, bat, zoxide, etc.)
- **git**: Git configuration and tools (lazygit, diff-so-fancy, delta)
- **docker**: Container runtime and tools
- **ides**: IDEs and editors (neovim, VS Code, JetBrains Toolbox)
- **dev-tools**: Development utilities (mise, uv, bruno, dbeaver)

### Phase 5: Desktop Environment
**Purpose**: Install Hyprland window manager and UI components
- **hyprland**: Window manager and ecosystem
- **wayland**: Wayland utilities (waybar, mako, swaybg)
- **launcher**: Application launcher (walker)

### Phase 6: Media & Applications
**Purpose**: Install multimedia tools and end-user applications
- **media**: Audio/video (pipewire, mpv, spotify, obs-studio)
- **files**: File managers (nautilus) and utilities
- **fonts**: System fonts (JetBrains Mono, Cascadia, Noto, etc.)
- **printer**: Printing support (CUPS)
- **browser**: Web browser (Brave)

## Project Structure

```
ansible/
├── installer.yml      # Main playbook entry point with phases
├── inventory.ini      # Host configuration
├── variables.yml      # Shared variables (user, home, python version)
├── README.md          # This documentation
└── tasks/
    ├── base.yml               # Phase 1: System initialization
    ├── wifi.yml               # Phase 2: WiFi services
    ├── bluetooth.yml          # Phase 2: Bluetooth services
    ├── gpu.yml                # Phase 2: GPU drivers
    ├── authentication.yml     # Phase 2: Security/auth packages
    ├── terminal.yml           # Phase 3: Terminal and shell
    ├── software_development.yml # Phase 4: Dev tools
    ├── hyprlandia.yml         # Phase 5: Desktop environment
    ├── media.yml              # Phase 6: Media applications
    ├── file_management.yml    # Phase 6: File utilities & fonts
    └── browser.yml            # Phase 6: Web browser
```

## Available Tags

| Tag        | Description                                                       |
| ---------- | ----------------------------------------------------------------- |
| `init`     | System initialization (base, yay, dotfiles)                       |
| `services` | Hardware & services (wifi, bluetooth, gpu, auth)                  |
| `dev`      | Development tools (terminal, shell, git, docker, ides, dev-tools) |
| `desktop`  | Desktop environment (hyprland, wayland, launcher)                 |
| `apps`     | Media & applications (media, files, fonts, browser)               |

### Category Tags
| Tag           | Description                        |
| ------------- | ---------------------------------- |
| `init`        | Initial system setup               |
| `services`    | System services and hardware       |
| `terminal`    | Terminal emulators and tools       |
| `development` | Development tools and environments |
| `desktop`     | Desktop environment components     |
| `apps`        | End-user applications              |

## Usage

### Complete Installation

Run the complete playbook with all phases in order:

```bash
ansible-playbook -K -i inventory.ini installer.yml
```

### Phase-Based Installation (Recommended)

Install the system in phases for better control and debugging:

```bash
# Phase 1: System initialization (REQUIRED FIRST)
ansible-playbook -K -i inventory.ini installer.yml --tags init

# Phase 2: Hardware & services
ansible-playbook -K -i inventory.ini installer.yml --tags services

# Phase 3: Development tools
ansible-playbook -K -i inventory.ini installer.yml --tags dev

# Phase 5: Desktop environment
ansible-playbook -K -i inventory.ini installer.yml --tags desktop

# Phase 6: Media & applications
ansible-playbook -K -i inventory.ini installer.yml --tags apps
```

### Skip Specific Phases or Tags

```bash
# Install everything except applications
ansible-playbook -K -i inventory.ini installer.yml --skip-tags apps
```

## Dry Run (Check Mode)

Test the playbook without making changes:

```bash
# Check what would be changed
ansible-playbook -K -i inventory.ini installer.yml --check

# Check specific phase
ansible-playbook -K -i inventory.ini installer.yml --tags init --check

# Check with verbose output
ansible-playbook -K -i inventory.ini installer.yml --check -v
```

## Troubleshooting

### Check Syntax

Validate the playbook syntax before running:

```bash
ansible-playbook --syntax-check installer.yml
```

### Run with Verbose Output

Get more detailed output during execution:

```bash
# Standard verbose
ansible-playbook -K -i inventory.ini installer.yml -v

# More verbose (show task arguments)
ansible-playbook -K -i inventory.ini installer.yml -vv

# Very verbose (show task results)
ansible-playbook -K -i inventory.ini installer.yml -vvv
```

### List Available Tags

See all available tags in the playbook:

```bash
ansible-playbook -i inventory.ini installer.yml --list-tags
```

### List Tasks

See all tasks that would be executed:

```bash
# List all tasks
ansible-playbook -i inventory.ini installer.yml --list-tasks

# List tasks for specific tags
ansible-playbook -i inventory.ini installer.yml --tags init --list-tasks
```

## Command Reference

| Command Flag              | Description                 |
| ------------------------- | --------------------------- |
| `-K`                      | Ask for sudo password       |
| `-i inventory.ini`        | Specify inventory file      |
| `--tags "tag1,tag2"`      | Run only specified tags     |
| `--skip-tags "tag1,tag2"` | Skip specified tags         |
| `--check`                 | Dry run (no changes)        |
| `-v`, `-vv`, `-vvv`       | Verbose output (levels 1-3) |
| `--list-tags`             | Show all available tags     |
| `--list-tasks`            | Show all tasks              |
| `--syntax-check`          | Validate playbook syntax    |

## Variables

The playbook uses variables defined in `variables.yml`:

| Variable          | Description                 | Default                      |
| ----------------- | --------------------------- | ---------------------------- |
| `user`            | Current system user         | `$USER` environment variable |
| `home`            | User home directory         | `$HOME` environment variable |
| `python_version`  | Python version to use       | `3.13`                       |
| `python_env_name` | Name for Python environment | `base_python`                |
