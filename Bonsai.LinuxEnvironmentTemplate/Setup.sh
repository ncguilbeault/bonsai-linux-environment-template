#! /bin/bash

SETUP_SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"

if [ ! -f "$SETUP_SCRIPT_DIR/Bonsai.exe" ]; then
    CONFIG="$SETUP_SCRIPT_DIR/Bonsai.config"
    if [ -f "$CONFIG" ]; then
        VERSION=$(xmllint --xpath '//PackageConfiguration/Packages/Package[@id="Bonsai"]/@version' "$CONFIG" | sed -e 's/^[^"]*"//' -e 's/"$//')
        RELEASE="https://github.com/bonsai-rx/bonsai/releases/download/$VERSION/Bonsai.zip"
    else
        RELEASE="https://github.com/bonsai-rx/bonsai/releases/latest/download/Bonsai.zip"
    fi
    wget $RELEASE -O "$SETUP_SCRIPT_DIR/temp.zip"
    mv -f "$SETUP_SCRIPT_DIR/NuGet.config" "$SETUP_SCRIPT_DIR/temp.config"
    unzip -d "$SETUP_SCRIPT_DIR" -o "$SETUP_SCRIPT_DIR/temp.zip"
    mv -f "$SETUP_SCRIPT_DIR/temp.config" "$SETUP_SCRIPT_DIR/NuGet.config"
    rm -rf "$SETUP_SCRIPT_DIR/temp.zip"
    rm -rf "$SETUP_SCRIPT_DIR/Bonsai32.exe"
fi

source "$SETUP_SCRIPT_DIR/activate"
source "$SETUP_SCRIPT_DIR/run" --no-editor