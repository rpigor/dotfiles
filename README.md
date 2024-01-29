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

Most of widgets can be configured to work with other tools.

`librewolf`, `kitty`, `neovim`, `flameshot`, `picom`, `nm-applet` and `blueman` are also being called in [`rc.lua`](awesome/rc.lua) but can easily be replaced by your own software suite.
