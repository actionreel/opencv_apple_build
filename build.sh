#!/bin/bash
set -e

(
    cd opencv_source
    rm -rf ../build
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

(cd build &&
    tar -czvf opencv2.xcframework.tar.gz opencv2.xcframework)
(cd build/catalyst &&
    tar -czvf ../opencv2.framework.catalyst.tar.gz opencv2.framework)
(cd build/iphoneos &&
    tar -czvf ../opencv2.framework.iphoneos.tar.gz opencv2.framework)
(cd build/iphonesimulator &&
    tar -czvf ../opencv2.framework.iphonesimulator.tar.gz opencv2.framework)
(cd build/macos &&
    tar -czvf ../opencv2.framework.macos.tar.gz opencv2.framework)
(cd build/visionos &&
    tar -czvf ../opencv2.framework.visionos.tar.gz opencv2.framework)
(cd build/visionsimulator &&
    tar -czvf ../opencv2.framework.visionsimulator.tar.gz opencv2.framework)