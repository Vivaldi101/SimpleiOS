#!/bin/sh

mkdir -p build/ios

# Set up CMake to generate Xcode project targeting iOS
# Real ios
#cmake -G Xcode -DCMAKE_SYSTEM_NAME=iOS -DCMAKE_OSX_SYSROOT=iphoneos -DCMAKE_OSX_DEPLOYMENT_TARGET=13.0 -DCMAKE_XCODE_ATTRIBUTE_ONLY_ACTIVE_ARCH=YES -DCMAKE_OSX_ARCHITECTURES=arm64 -DCMAKE_IOS_INSTALL_COMBINED=NO -DCMAKE_XCODE_ATTRIBUTE_DEVELOPMENT_TEAM=GP77L2DRZ7 -DMACOSX_BUNDLE_GUI_IDENTIFIER=com.test.vulkanapp  -S . -B build/ios
cmake -G Xcode -DCMAKE_SYSTEM_NAME=iOS -DCMAKE_OSX_SYSROOT=iphoneos -DCMAKE_OSX_DEPLOYMENT_TARGET=15.0 -DCMAKE_XCODE_ATTRIBUTE_ONLY_ACTIVE_ARCH=YES -DCMAKE_OSX_ARCHITECTURES=arm64 -DCMAKE_IOS_INSTALL_COMBINED=NO -S . -B build/ios

# Simulator
#cmake -G Xcode -DCMAKE_SYSTEM_NAME=iOS -DCMAKE_OSX_SYSROOT=iphonesimulator -DCMAKE_OSX_DEPLOYMENT_TARGET=15.0 -DCMAKE_XCODE_ATTRIBUTE_ONLY_ACTIVE_ARCH=YES -DCMAKE_OSX_ARCHITECTURES=x86_64 -DCMAKE_IOS_INSTALL_COMBINED=NO -S . -B build/ios

# Disable teh build for now 
cmake --build build/ios -j$(sysctl -n hw.ncpu) -- -sdk iphoneos -allowProvisioningUpdates