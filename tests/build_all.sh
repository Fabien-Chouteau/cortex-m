#!/bin/sh

cores="m0 m0p m4 m4f m7f m7df"

set -e x

for core in ${cores}; do
    echo "Building for ${core}"
    sed -i "s/^cortex_m.core = .*$/cortex_m.core = \"${core}\"/" alire.toml
    cat alire.toml
    alr -n update
    alr -n build -- -f
done;
