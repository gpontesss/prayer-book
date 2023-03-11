#!/usr/bin/env bash

# Lists tags from repository, selects greatest one and increases its patch,
# outputting as text.

set -o errexit

declare reset="\e[0m"
declare red="\e[0;31m"

err() { echo -e "${red}$@${reset}" 1>&2 ; }

tags() { git tag | grep -E 'v[0-9]+\.[0-9]+\.[0-9]+' ; }
last_tag() { tags | sort --reverse | head -n1 ; }

# git config user.email "$GITHUB_ACTOR@users.noreply.github.com"
# git config user.name "$GITHUB_ACTOR"

incr_patch() {
    local version="$1"
    local patch="${version##*.}"
    local rest="${version%.*}"
    local new="$rest.$((patch+1))"
    echo "$new"
}

old="$(last_tag)"
new="$(incr_patch "$old")"

err "Increasing minor version... ($old to $new)"
echo "$new"
