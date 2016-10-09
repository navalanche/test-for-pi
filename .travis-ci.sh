#!/bin/bash

if [ "${ARCH}" == "arm" ]; then
  echo "We are running an ARM build"
  mkdir deploy
  docker run -it --rm -v ${PWD}:/source nineties/rust-arm cargo build --release
  whoami
  sudo mv target/arm-unknown-linux-gnueabihf/debug/test-for-pi deploy/test-for-pi-arm
  sudo chown travis.travis deploy/test-for-pi-arm
fi

if [ "${ARCH}" == "intel" ]; then
  echo "We are running normal build"
  mkdir deploy
  cargo build --release
  mv target/release/test-for-pi deploy/test-for-pi-intel
fi

