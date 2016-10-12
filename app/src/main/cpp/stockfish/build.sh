#!/bin/bash

# Purpose:  Generate stockfish
#           Copy them into assets directories
#              asstest/ABI/
# Execution in Terminal:
#          source build.sh  ( or ./build.sh )

# Build stockfish in terminal with  ndk-build tool DIRECTLY
ndk-build APP_BUILD_SCRIPT=./Android.mk  NDK_PROJECT_PATH=. NDK_APPLICATION_MK=./Application.mk NDK_OUT=./obj NDK_LIBS_OUT=../../assets "$@"
