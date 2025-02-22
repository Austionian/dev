#!/usr/bin/env bash

script_dir="$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)"
dry="0"

while [[ $# > 0 ]]; do
    if [[ "$1" == "--dry" ]]; then
        dry="1"
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

log "--------- running env ---------"

cd $script_dir
copy_dir() {
    from=$1
    to=$2

    pushd $from
    dirs=$(find . -maxdepth 1 -mindepth 1 -type d)
    for dir in $dirs; do
        execute rm -rf $to/$dir
        execute cp -r $dir $to/$dir
    done
    popd
}

copy_file() {
    from=$1
    to=$2

    pushd env/
    name=$(basename $from)
    execute rm $to/$name
    execute cp $from $to/$name
    popd
}

copy_dir env/.config $HOME/.config
copy_dir env/.local $HOME/.local
copy_file .bashrc $HOME
copy_file .gitconfig $HOME
copy_file .ready-tmux $HOME
