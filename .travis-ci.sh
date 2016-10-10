#!/bin/bash

mkdir deploy
echo "Intel build:"
cargo build --release
mv target/release/test-for-pi deploy/test-for-pi-intel

echo "ARMv7 build:"
docker run -it --rm -v ${PWD}:/work rustcross/armv7-unknown-linux-gnueabihf:latest cargo build --release
whoami
sudo mv target/arm-unknown-linux-gnueabihf/debug/test-for-pi deploy/test-for-pi-arm
sudo chown travis.travis deploy/test-for-pi-arm

