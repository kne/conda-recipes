#!/bin/bash

# Update the tags for the version number
git fetch origin --tags 


if [[ "$(uname)" == "Darwin" ]]; then
    if [[ -z "$(which brew)" ]]; then
        echo "Sorry, OSX requires a homebrew installation!"
        exit 1
    fi
    brew install jpeg libpng freetype
    brew install sdl2 sdl2_gfx sdl2_image sdl2_mixer sdl2_net sdl2_ttf 
    brew install portmidi smpeg
elif [[ "$(uname)" == "Linux" ]]; then
    if [[ -z "$(which apt-get)" ]]; then
        echo "** warning: Can only check dependencies on ubuntu/debian"
    else
        echo "Checking dependencies..."
        declare -a packages=("build-essential" "libsdl2-dev"
                             "libsdl2-image-dev" "libsdl2-mixer-dev"
                             "libsdl2-ttf-dev" "libjpeg-dev" "libpng12-dev")

        for dep in "${packages[@]}"
        do
            inst_ver=$(apt-cache policy $dep |grep Installed: | sed 's/\s*Installed: \(.*\)$/\1/')
            echo "Dependency $dep (installed version: $inst_ver)"
            if [[ "$inst_ver" == "(none)" ]]; then
                echo "Please install dependency $dep!"
                exit 1;
            fi
        done
    fi
fi

$PYTHON setup.py install
