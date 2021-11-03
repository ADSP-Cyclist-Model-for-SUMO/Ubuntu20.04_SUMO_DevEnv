#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
export TZ="Europe/Paris" 

export SUMO_HOME="/sumo"

echo -----------------------------------
echo Provisioning Ubuntu 20.04 VM
echo "for SUMO development..."
echo -----------------------------------


echo -----------------------------------
echo INSTALL GIT
echo -----------------------------------
sudo apt-get -y install git


echo -----------------------------------
echo INSTALL COMPILER
echo -----------------------------------
sudo apt-get -y install g++


echo -----------------------------------
echo INSTALL CMAKE
echo -----------------------------------
sudo apt-get -y install cmake


echo -----------------------------------
echo INSTALL DEPENDENCIES
echo -----------------------------------
sudo apt-get -y install libxerces-c-dev libfox-1.6-dev libgdal-dev libproj-dev libgl2ps-dev


echo -----------------------------------
echo INSTALL PYTHON AND SWIG
echo -----------------------------------
sudo apt-get -y install python python3 python3-pip swig
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py
python get-pip.py
pip install -U pip setuptools


echo -----------------------------------
echo INITIAL BUILD OF SUMO
echo -----------------------------------
cd "$SUMO_HOME"
mkdir build/cmake-build
cd build/cmake-build
cmake ../..
make -j$(nproc)


