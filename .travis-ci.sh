#!/bin/bash

if [ "${ARCH}" == "arm" ]; then
  echo "We are running an ARM build"
  docker run -it --rm -v ${PWD}:/source nineties/rust-arm cargo build --release
fi

if [ "${ARCH}" == "x64" ]; then
  echo "We are running normal build"
  cargo build --release
  pwd
  find .
fi

