#!/usr/bin/env bash

##? Manages project versioning.
##?
##? Commands:

set -o errexit

declare reset="\e[0m"
declare red="\e[0;31m"

err() { echo -e "${red}$@${reset}" 1>&2 ; }
errexit() { err "$@" ; exit 1 ; }

usage() {
    [[ "$#" -gt 0 ]] && err "$@"
    sed -n 's:^##? \?::p' "$0"
    exit 1
}

tags() { git tag | grep -E 'v[0-9]+\.[0-9]+\.[0-9]+' ; }
last_tag() { tags | sort --reverse | head -n1 ; }

get_major() { echo "$1" | sed 's:v\([0-9]\+\)\..*:\1:' ; }
get_minor() { echo "$1" | sed 's:v[0-9]\+\.\([0-9]\+\)\..*:\1:' ; }
get_patch() { echo "$1" | sed 's:v[0-9]\+\.[0-9]\+\.\([0-9]\+\):\1:' ; }

inc() {
    local level="$1"
    [[ -z "$level" ]] && usage
    local last="${2:-$(last_tag)}"
    local patch="$(get_patch "$last")"
    local minor="$(get_minor "$last")"
    local major="$(get_major "$last")"
    local "$level"="$(($level+1))"
    case "$level" in
        minor) patch="0" ;;
        major) patch="0" ; minor="0" ;;
    esac
    echo "v$major.$minor.$patch"
}

case "$1" in
##?   last                                Returns last version.
    last) last_tag ;;
##?   list                                Lists all versions.
    list) tags ;;
##?   inc (major|minor|patch) <version>   Increases a version level. By default,
##?                                       will use the last version.
    inc) shift ; inc "$@" ;;
    "") usage ;;
    *) usage "Unknown command '$1'" ;;
esac
