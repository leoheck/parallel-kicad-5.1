#!/bin/bash

# Install Kicad 5.1 PPA
# sudo add-apt-repository ppa:kicad/kicad-5.1-releases

skip_3dmodels=$1

tool=kicad
version=5.1.12

output_dir="$(pwd)/${tool}-${version}"
mkdir -p ${output_dir}

KICAD_PATH=$(pwd)/${output_dir}

# Get full version of Kicad 5.1.12 packages
kicad_fullversion=$(apt-cache policy kicad | grep ${version} | sed "s/^[ ]\+//g" | cut -d" " -f1)
kicad_libraries_fullversion=$(apt-cache policy kicad-libraries | grep ${version} | sed "s/^[ ]\+//g" | cut -d" " -f1)
kicad_symbols_fullversion=$(apt-cache policy kicad-symbols    | grep ${version} | sed "s/^[ ]\+//g" | cut -d" " -f1)
kicad_footprints_fullversion=$(apt-cache policy kicad-footprints | grep ${version} | sed "s/^[ ]\+//g" | cut -d" " -f1)

if [[ ${skip_3dmodels} == "" ]]; then
	kicad_packages3d_fullversion=$(apt-cache policy kicad-packages3d | grep ${version} | sed "s/^[ ]\+//g" | cut -d" " -f1)
fi

cd /tmp

# Donwload packages
apt-get download kicad=${kicad_fullversion}
apt-get download kicad-libraries=${kicad_libraries_fullversion}
apt-get download kicad-symbols=${kicad_symbols_fullversion}
apt-get download kicad-footprints=${kicad_footprints_fullversion}
if [[ ${skip_3dmodels} == "" ]]; then
	apt-get download kicad-packages3d=${kicad_packages3d_fullversion}
fi

# Install packages
dpkg-deb -x kicad_${version}*.deb "${output_dir}"
dpkg-deb -x kicad-libraries_${version}*.deb "${output_dir}"
dpkg-deb -x kicad-symbols_${version}*.deb "${output_dir}"
dpkg-deb -x kicad-footprints_${version}*.deb "${output_dir}"
if [[ ${skip_3dmodels} == "" ]]; then
	dpkg-deb -x kicad-packages3d_${version}*.deb "${output_dir}"
fi

# Update kicad-env.sh
sed -i "s|KICAD_PATH.*|KICAD_PATH=${KICAD_PATH}/usr/share|g" ${output_dir}/etc/profile.d/kicad-env.sh

# Load environment
clear
echo
echo "Loading the environment and launching Kicad 5.1.12:"
echo
echo "cd $(pwd) && source ./load_kicad_5.1.sh"
echo "kicad"
echo
