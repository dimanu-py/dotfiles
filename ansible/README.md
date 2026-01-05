# Ansible Playbook for Arch Linux

This playbook automates the installation and configuration of an Arch Linux machine for personal use.

## Requirements

Install `ansible` on your machine:

```bash
sudo pacman -S ansible
```

## Project Structure

```
ansible/
├── installer.yml      # Main playbook entry point
├── inventory.ini      # Host configuration
├── variables.yml      # Shared variables
└── tasks/
    ├── pre_requisites/
    │   ├── yay.yml           # AUR helper installation
    │   └── dotfiles.yml      # Dotfiles setup with stow
    ├── software_development/
    │   ├── git.yml           # Git and related tools
    │   ├── docker.yml        # Docker setup
    │   ├── python.yml        # Python environment
    │   ├── terminal.yml      # Terminal emulators
    │   ├── ides.yml          # IDEs and editors
    │   └── tools.yml         # Development utilities
    └── desktop_environment/
        ├── hyprlandia.yml    # Hyprland WM and components
        ├── utilities.yml     # Desktop utilities
        └── extras.yml        # Additional apps
```

## Available Tags

| Tag                    | Description                    |
| ---------------------- | ------------------------------ |
| `pre-requisites`       | Install yay and setup dotfiles |
| `yay`                  | Only install yay AUR helper    |
| `dotfiles`             | Only setup dotfiles            |
| `software-development` | All development tools          |
| `git`                  | Git and related tools          |
| `docker`               | Docker setup                   |
| `python`               | Python environment             |
| `terminal`             | Terminal emulators             |
| `ides`                 | IDEs and editors               |
| `tools`                | Development utilities          |
| `desktop-environment`  | Full desktop setup             |
| `hyprland`             | Hyprland WM                    |
| `utilities`            | Desktop utilities              |
| `extras`               | Additional applications        |

## Usage

### Run the complete playbook

```bash
ansible-playbook -K -i inventory.ini installer.yml
```

### Run specific sections

```bash
# Install only pre-requisites (yay + dotfiles)
ansible-playbook -K -i inventory.ini installer.yml --tags pre-requisites

# Setup only development environment
ansible-playbook -K -i inventory.ini installer.yml --tags software-development

# Install only desktop environment
ansible-playbook -K -i inventory.ini installer.yml --tags desktop-environment
```

### Run individual tasks

```bash
# Only install git tools
ansible-playbook -K -i inventory.ini installer.yml --tags git

# Only setup Python
ansible-playbook -K -i inventory.ini installer.yml --tags python

# Only install Hyprland
ansible-playbook -K -i inventory.ini installer.yml --tags hyprland
```

### Combine multiple tags

```bash
# Install git, docker and python
ansible-playbook -K -i inventory.ini installer.yml --tags "git,docker,python"

# Install terminal and IDEs
ansible-playbook -K -i inventory.ini installer.yml --tags "terminal,ides"
```

### Skip specific tasks

```bash
# Run everything except docker
ansible-playbook -K -i inventory.ini installer.yml --skip-tags docker

# Run software-development but skip python
ansible-playbook -K -i inventory.ini installer.yml --tags software-development --skip-tags python
```