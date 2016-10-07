#!/bin/bash

function setup_rpi_docker {
}

if ["${ARCH}" = "arm" ]; then
  echo "We are running an ARM build"
else 
  echo "We are running normal build"
  cargo build
fi

