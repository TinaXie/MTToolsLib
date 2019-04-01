#!/bin/bash
if [ "${ACTION}" == "build" ] ;then
	FRAMEWORK_NAME="${PROJECT_NAME}"

	FRAMEWORK_DIR="${SRCROOT}/Products/${FRAMEWORK_NAME}.framework"
	BUILD_DIR="build"
    BUILD_OS_DIR="buildos"

	BUILD_DEVICE_DIR="${BUILD_OS_DIR}/Release-iphoneos/${FRAMEWORK_NAME}.framework"
	BUILD_SIMULATOR_DIR="${BUILD_DIR}/Release-iphonesimulator/${FRAMEWORK_NAME}.framework"

    if [ -d "${BUILD_OS_DIR}" ] ;then
        rm -r "${BUILD_OS_DIR}"
    fi

	xcodebuild -configuration "Release" -target "${FRAMEWORK_NAME}" -sdk iphoneos clean build

    #必须copy出来 否则编译下面simulator时会将文件删除
    cp -r "${BUILD_DIR}" "${BUILD_OS_DIR}"

	xcodebuild -configuration "Release" -target "${FRAMEWORK_NAME}" -sdk iphonesimulator clean build
	if [ -d "${FRAMEWORK_DIR}" ] ;then
		rm -r "${FRAMEWORK_DIR}"
	fi

	mkdir -p "${FRAMEWORK_DIR}"
	cp -r "${BUILD_DEVICE_DIR}/" "${FRAMEWORK_DIR}/"

	lipo -create "${BUILD_DEVICE_DIR}/${FRAMEWORK_NAME}" "${BUILD_SIMULATOR_DIR}/${FRAMEWORK_NAME}" -output "${FRAMEWORK_DIR}/${FRAMEWORK_NAME}"

	if [ -d "${BUILD_DIR}" ] ;then
		rm -r "${BUILD_DIR}"
	fi

    if [ -d "${BUILD_OS_DIR}" ] ;then
        rm -r "${BUILD_OS_DIR}"
    fi
	
	if [ $1 == "COPY_TO_UPLOAD_DIR" ] ;then

        LOCAL_TARGET_DIR="../../../ARTrackingSDKPackage"
        LOCAL_TARGET_FRAMEWORKS_DIR="${LOCAL_TARGET_DIR}/Frameworks"
		if [ -d "${LOCAL_TARGET_FRAMEWORKS_DIR}" ] ;then
 			rm -r "${LOCAL_TARGET_FRAMEWORKS_DIR}"
		fi
		
		mkdir -p "${LOCAL_TARGET_FRAMEWORKS_DIR}"
		cp -r "${SRCROOT}/Products/" "${LOCAL_TARGET_FRAMEWORKS_DIR}/"

        #Assets
        LOCAL_TARGET_ASSETS_DIR="${LOCAL_TARGET_DIR}/Assets"

        if [ -d "${LOCAL_TARGET_ASSETS_DIR}" ] ;then
            rm -r "${LOCAL_TARGET_ASSETS_DIR}"
        fi

        SDK_ASSETS_PATH="../Assets"
        cp -r "${SDK_ASSETS_PATH}" "${LOCAL_TARGET_ASSETS_DIR}"

        open "${LOCAL_TARGET_FRAMEWORKS_DIR}/${FRAMEWORK_NAME}.framework"
	else
		open "${FRAMEWORK_DIR}"
	fi
fi
