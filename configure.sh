#!/bin/bash

# configure.sh
# Ryan Stenmark <ryanpstenmark@gmail.com>
# April 9th, 2022

packages=(
    gcc
    perl
    build-essential
    git
    i3
    python3
    htop
)

# Run as super-user.
if [ $(id -u) -eq 0 ] ; then
    # Update package lists:
    apt-get update -y

    # Install frequently used packages:
    apt-get install "${packages[@]}" --assume-yes

    # Overwrite default configs:
    cp ./.config/* /home/${SUDO_USER}/.config/ -rv
    cp ./etc/* /etc/ -rv
else
    # Prompt to run as super-user and then quit:
    echo 'Run as super-user.'
    exit 1
fi
