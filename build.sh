#!/bin/env bash
set -e

(
    cd opencv_source
    python3 platforms/apple/build_xcframework.py --out ../build \
        --iphoneos_archs arm64 \
        --iphoneos_deployment_target 14.0 \
        --iphonesimulator_archs x86_64,arm64 \
        --visionos_archs arm64 \
        --visionsimulator_archs arm64 \
        --macos_archs x86_64,arm64 \
        --catalyst_archs x86_64,arm64 \
        --build_only_specified_archs \
        --without objc
)