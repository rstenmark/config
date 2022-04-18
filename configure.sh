#!/bin/bash

# configure.sh
# Ryan Stenmark <ryanpstenmark@gmail.com>
# April 9th, 2022

# Run as super-user.

packages=(
    gcc
    perl
    build-essential
    curl
    git
    i3
    python3
    python3-pip
    htop
)

if [ $(id -u) -eq 0 ] ; then
    # Resync package index files from sources
    apt-get update -y

    # Install frequently used packages
    apt-get install "${packages[@]}" -y

    # Overwrite default user & system configs
    cp ./.config/* /home/${SUDO_USER}/.config/ -rv
    cp ./etc/* /etc/ -rv
else
    # Prompt to run as super-user and then quit:
    echo 'Run as super-user.'
    exit 1
fi
