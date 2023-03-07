#!/bin/bash
# Build script for testbed
set echo on

mkdir -p ../bin

# Get a list of all the .c files
cFilesnames=$(find . -type f -name "*.c")

# echo "Files:" $cFilesnames

assembly="testbed"
compilerFlags="-g -fdeclspec fPIC"
# -fms-extensions
# -Wall -Werror
includeFlags="-Isrc -I../engine/src"
linkerFlags="-L../bin -lengine -Wl,-rpath,."
defines="-D_DEBUG -DKEXPORT"

echo "Building $assembly..."
echo clang $cFilesnames $compilerFlags -o ../bin/$assembly $defines $includeFlags $linkerFlags
clang $cFilesnames $compilerFlags -o ../bin/$assembly $defines $includeFlags $linkerFlags