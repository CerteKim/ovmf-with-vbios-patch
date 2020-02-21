#! /bin/bash

mkdir -p build
docker build -t ovmf-vbios-patch docker-build
docker run --rm -v "$PWD/build:/build" -v "$PWD/roms:/roms" ovmf-vbios-patch /ovmf/compile-ovmf.sh gtx-1060-maxq.rom
tar -czf build/ovmf-vbios-patched.tgz build/OVMF*
