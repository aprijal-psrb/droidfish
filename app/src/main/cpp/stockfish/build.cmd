@echo off
rem Purpose:  Generate stockfish
rem           Copy them into assets directories
rem              asstest/ABI/
rem Execution in Terminal:
rem          build

rem Build stockfish in terminal with  ndk-build tool DIRECTLY
ndk-build.cmd APP_BUILD_SCRIPT=./Android.mk  NDK_PROJECT_PATH=. NDK_APPLICATION_MK=./Application.mk NDK_OUT=./obj NDK_LIBS_OUT=../../assets %*
