# dotfiles

This is a repository for my *personal* dotfiles. Use at your own risk.

## Details

- **OS**: Arch Linux
- **WM**: awesome
- **Shell**: zsh
- **Terminal**: kitty
- **Editor**: neovim
- **Compositor**: picom
- **Browser**: librewolf
- **GTK theme**: Flat Remix Darkest with custom color
- **QT theme**: Fluent Orange Dark on kvantum
- **Icons**: Tela Ubuntu Dark
- **Font**: Iosevka Nerd Font

## Dependencies

This awesome setup has some dependencies:

- `brightnessctl` (brightness widget)
- `networkmanager` and `iw` (internet widget)
- `acpi` (battery widget)
- `arc-icon-theme` (battery widget)
- `alsa-utils` and `pulseaudio` (volume widget)
- `aur/i3lock-fancy-git` and `scrot` (screenlocking)

Most of the widgets can be configured to work with other tools.

`aur/librewolf`, `kitty`, `neovim`, `feh`, etc. are also being called in [`awesome/rc.lua`](awesome/rc.lua) but can easily be replaced by your own software suite.
