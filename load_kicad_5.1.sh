#!/bin/bash

tool=kicad
version=5.1.12
output_dir="${tool}-${version}"

# Update kicad-env.sh
INSTALL_PATH=$(pwd)/${output_dir}

export PATH="${INSTALL_PATH}/usr/bin:${PATH}"
export LD_LIBRARY_PATH="${INSTALL_PATH}/usr/lib/x86_64-linux-gnu:${LD_LIBRARY_PATH}"
export PYTHONPATH="${INSTALL_PATH}/usr/lib/python3/dist-packages:${PYTHONPATH}"

export KICAD_PATH="${INSTALL_PATH}/usr/share/kicad/"
export KICAD_SYMBOL_DIR="${KICAD_PATH}/library/"
export KICAD_TEMPLATE_DIR="${KICAD_PATH}/template/"
export KISYS3DMOD="${KICAD_PATH}/modules/packages3d/"
export KISYSMOD="${KICAD_PATH}/modules/"
