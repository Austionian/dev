#!/usr/bin/env bash

script_dir="$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)"
filter=""
dry="0"

cd $script_dir
scripts=$(find installs -maxdepth 1 -mindepth 1 -executable -type f)

while [[ $# > 0 ]]; do
    if [[ "$1" == "--dry" ]]; then
        dry="1"
    else
        filter="$1"
    fi
    shift
done

log() {
    if [[ $dry == "1" ]]; then
        echo "[DRY_RUN]: $@"
    else
        echo "$@"
    fi
}

execute() {
    log "execute: $@"
    if [[ $dry == "1" ]]; then
        return
    fi

    "$@"
}

log "running with filter=$filter"

for script in $scripts; do
    if echo "$script" | grep -qv "$filter"; then
        log "filtered: $filter -- $script"
        continue
    fi
    log "running script: $script"
    execute ./$script
done
