#!/bin/bash

if [ "${ARCH}" == "arm" ]; then
  echo "We are running an ARM build"
  docker run -it --rm -v ${PWD}:/source nineties/rust-arm cargo build
fi

if [ "${ARCH}" == "x64" ]; then
  echo "We are running normal build"
  cargo build
  pwd
  find .
fi

