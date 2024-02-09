export VISUAL=nvim
export EDITOR="${VISUAL}"

export XDG_DATA_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-${HOME}/.local/state}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-${HOME}/.cache}"
export XDG_DATA_DIRS="${XDG_DATA_DIRS:-/usr/local/share:/usr/share}"
export XDG_CONFIG_DIRS="${XDG_CONFIG_DIRS:-/etc/xdg}"

export PATH="${PATH}:/var/lib/flatpak/exports/bin"
export XDG_DATA_DIRS="${XDG_DATA_DIRS}:/var/lib/flatpak/exports/share:${HOME}/.local/share/flatpak/exports/share"
