#!/bin/bash

if [ "${ARCH}" == "arm" ]; then
  echo "We are running an ARM build"
  false
fi

if [ "${ARCH}" == "x64" ]; then
  echo "We are running normal build"
  cargo build
fi

