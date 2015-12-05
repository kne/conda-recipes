#!/bin/bash
# Script to build and upload packages to anaconda.org
# See: https://anaconda.org/kne for my builds

PYTHON_VERSIONS="--py=2.7 --py=3.3 --py=3.4 --py=3.5"

source deactivate
conda config --set anaconda_upload yes
conda build pygame/1.9.2a0/ $PYTHON_VERSIONS
conda build pyglet/1.2.4/ $PYTHON_VERSIONS
conda build pygame_sdl2/dev/ $PYTHON_VERSIONS
conda build pybox2d/dev/ $PYTHON_VERSIONS
conda config --set anaconda_upload no
