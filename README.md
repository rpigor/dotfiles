# dotfiles

This is a repository for my *personal* dotfiles. Use at your own risk.

## Details

- **OS**: Arch Linux
- **Shell**: zsh
- **WM**: awesome
- **Terminal**: kitty
- **Editor**: neovim
- **Browser**: librewolf
- **Compositor**: picom

## Dependencies

This awesome setup has some dependencies:

- `brightnessctl` (brightness widget)
- `networkmanager` and `iw` (internet widget)
- `acpi` (battery widget)
- `arc-icon-theme` (battery widget)
- `alsa` and `pulseaudio` (volume widget)
- `i3lock-fancy` (screenlocking)

Most of widgets can be configured to work with other tools.

`librewolf`, `kitty`, `neovim`, `picom`, `nm-applet` and `blueman` are also being used in [`rc.lua`](awesome/rc.lua) but can easily be replaced by your own software suite.
