#!/bin/sh
export GOPATH=$PWD/go
export CGO_ENABLED=1
if [ -n "$OS" ];    then 
    case "$OS" in
    "windows")
        export GOOS=windows
        export CC=x86_64-w64-mingw32-gcc
        export CXX=x86_64-w64-mingw32-g++
        BINARY_NAME="Ikemen_GO.exe"; 

        ;;
    "mac") 
        export GOOS=darwin
        export CC=o64-clang 
        export CXX=o64-clang++
        BINARY_NAME="Ikemen_GO_mac"; 

        ;;
    "linux") 
        BINARY_NAME="Ikemen_GO_linux"; 
        ;;
    esac 
else 
    BINARY_NAME="Ikemen_GO";  
fi;

go build -o $BINARY_NAME ./src
chmod +x $BINARY_NAME
