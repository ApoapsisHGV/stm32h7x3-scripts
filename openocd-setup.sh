#!/bin/bash
if hash openocd 2>/dev/null; then
    echo "openocd already appears to be installed, consider removing it if you want this script to complete"
    openocd --version
else
    echo "OpenOCD doesn't appear to be installed, initializing installation..."
    echo "Downloading source..."
    git clone https://repo.or.cz/openocd.git
    echo "Done"
    cd openocd
    echo "Preparing compilation..."
    ./bootstrap
    ./configure --enable-stlink --disable-werror    echo "Done"
    echo "Compiling..."
    make
    echo "Done"
    echo "Installing..."
    sudo make install
fi
