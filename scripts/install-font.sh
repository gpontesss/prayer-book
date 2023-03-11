#!/usr/bin/env bash

set -o errexit

TMP_DIR="/var/tmp"

declare reset="\e[0m"
declare red="\e[0;31m"

err() { echo -e "${red}$@${reset}" 1>&2 ; }

urlencode() {
    python -c 'import urllib.parse, sys; print(urllib.parse.quote(sys.argv[1], sys.argv[2]))' \
        "$1" "$urlencode_safe"
}

install_font() {
    local font="$1"
    err "Downloading font \"$font\"..."
    local url="https://fonts.google.com/download?family=$(urlencode "$font")"
    local font_zip="$TMP_DIR/$font.zip"
    local font_dir="$HOME/.local/share/fonts/ttf/$font"

    wget "$url" -O "$font_zip"
    mkdir -p "$font_dir"
    unzip -o "$font_zip" -d "$font_dir"
}


while [[ "$#" -gt 0 ]]; do
    install_font "$1"; shift
done

err "Rebuilding font cache..."
fc-cache -f
