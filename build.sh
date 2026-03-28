#!/usr/bin/env bash
set -euo pipefail

# Remove old build
rm -rf Forcepoint_VPN_CLI-x86_64.AppImage

# Ensure AppRun is executable
chmod 755 Forcepoint.AppDir/AppRun
chmod 755 Forcepoint.AppDir/usr/bin/_forcepoint-client

# Build AppImage
./appimagetool-x86_64.AppImage Forcepoint.AppDir

echo "AppImage built: Forcepoint_VPN_CLI-x86_64.AppImage"