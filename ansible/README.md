# Ansible Playbook for Arch Linux

This playbook is made to automate installation and configurationi of an Arch Linux machine for personal use.

## Requirements

Install `ansible` on your machine:

```bash
sudo pacman -S ansible
```

## Project Structure

The main script is [installer](./installer.yml) which is the entry point for the ansible playbook. This script has four main steps:

- **Install dependencies**: installs basic dependencies for this Arch desktop environment using Hyprland, some git tool and configures fish shell and kitty terminal
- **Download application**: installs desktop application such as JetBrains Toolbox, VS Code, Brave etc.
- **Setup dotfiles**: configures the dotfiles for the system using this repo along with `stow`
- **Wallpaper**: set the wallpaper

## Usage

You can run the complete playbook with the following command:

```bash
ansible-playbook -K -i inventory.ini installer.yml
```

Alternatively, you can run each step separately using the tags that are defined in the [installer](./installer.yml) file:

```bash
ansible-playbook -K -i inventori.ini installer.yml --tags "tag_name"
```