#!/bin/bash

if [ "${ARCH}" == "arm" ]; then
  echo "We are running an ARM build"
  docker run -it --rm -v ${PWD}:/source nineties/rust-arm cargo build --release
  whoami
  sudo mv target/arm-unknown-linux-gnueabihf/debug/test-for-pi target/arm-unknown-linux-gnueabihf/debug/test-for-pi-arm
  sudo chmod a+rwx target/arm-unknown-linux-gnueabihf/debug/test-for-pi-arm
fi

if [ "${ARCH}" == "x64" ]; then
  echo "We are running normal build"
  cargo build --release
  mv target/release/test-for-pi target/release/test-for-pi-x64
fi

