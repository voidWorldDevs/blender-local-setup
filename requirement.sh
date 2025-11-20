#!/bin/bash

packages=(
    base-devel
    subversion
    cmake
    libepoxy
    libxi
    libxcursor
    libxrandr
    libxinerama
    libxxf86vm
    python
    wayland-protocols
    libxkbcommon
    libdecor
)

missing=()

echo "Checking installed packages..."

for pkg in "${packages[@]}"; do
    if pacman -Qi "$pkg" &>/dev/null; then
        echo "✔ $pkg is already installed."
    else
        echo "✘ $pkg is missing."
        missing+=("$pkg")
    fi
done

if [ ${#missing[@]} -eq 0 ]; then
    echo "All packages already installed. Nothing to do."
else
    echo "Installing missing packages: ${missing[*]}"
    sudo pacman -S --noconfirm "${missing[*]}"
fi

