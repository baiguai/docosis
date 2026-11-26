#!/bin/bash

# Builds and runs the sample C++ app in src/ using build/ for the binary.
# Set CXX and/or CXXFLAGS to override the compiler and compilation flags.

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC_DIR="$SCRIPT_DIR/src"
BUILD_DIR="$SCRIPT_DIR/build"
CXX="${CXX:-g++}"
CXXFLAGS="${CXXFLAGS:--std=c++17}"
BIN="$BUILD_DIR/sample_app"

mkdir -p "$BUILD_DIR"
$CXX $CXXFLAGS -I "$SRC_DIR" "$SRC_DIR/main.cpp" -o "$BIN"

exec "$BIN" "$@"
