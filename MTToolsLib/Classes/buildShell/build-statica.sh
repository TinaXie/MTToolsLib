if [ "${ACTION}" == "build" ] ;then
	SDK_NAME="${PROJECT_NAME}"

	BUILD_DIR="${SRCROOT}/build"

    BUILD_OS_DIR="${SRCROOT}/buildos"
	DEVICE_HEADERS_DIR="${BUILD_OS_DIR}/Release-iphoneos/usr/local/include"
	BUILD_DEVICE_PATH="${BUILD_OS_DIR}/Release-iphoneos/lib${SDK_NAME}.a"

	BUILD_SIMULATOR_PATH="${BUILD_DIR}/Release-iphonesimulator/lib${SDK_NAME}.a"

	SDK_DIR="${SRCROOT}/Products"
	SDK_PATH="${SRCROOT}/Products/lib${SDK_NAME}.a"

	if [ -d "${SDK_DIR}" ] ;then
		rm -r "${SDK_DIR}"
	fi

	mkdir -p "${SDK_DIR}"

    if [ -d "${BUILD_OS_DIR}" ] ;then
        rm -r "${BUILD_OS_DIR}"
    fi

	xcodebuild -configuration "Release" -target "${SDK_NAME}" -sdk iphoneos clean build

    #必须copy出来 否则编译下面simulator时会将文件删除
    cp -r "${BUILD_DIR}" "${BUILD_OS_DIR}"
    cp -r "${DEVICE_HEADERS_DIR}" "${SDK_DIR}"

	xcodebuild -configuration "Release" -target "${SDK_NAME}" -sdk iphonesimulator clean build

	lipo -create "${BUILD_DEVICE_PATH}" "${BUILD_SIMULATOR_PATH}" -output "${SDK_PATH}"

	
	if [ $1 == "COPY_TO_UPLOAD_DIR" ] ;then
		LOCAL_TARGET_DIR="../../../ARTrackingSDKPackage"
		# headers
		LOCAL_TARGET_HEADER_DIR="${LOCAL_TARGET_DIR}/Headers"
		if [ -d "${LOCAL_TARGET_HEADER_DIR}" ] ;then
 			rm -r "${LOCAL_TARGET_HEADER_DIR}" 
		fi
		
		mkdir -p "${LOCAL_TARGET_HEADER_DIR}"
		cp -r "${SDK_DIR}/include/" "${LOCAL_TARGET_HEADER_DIR}/"

		# .a
		LOCAL_TARGET_A_DIR="${LOCAL_TARGET_DIR}/Libs"

        if [ -d "${LOCAL_TARGET_A_DIR}" ] ;then
            rm -r "${LOCAL_TARGET_A_DIR}"
        fi

        mkdir -p "${LOCAL_TARGET_A_DIR}"

		cp -f "${SDK_PATH}" "${LOCAL_TARGET_A_DIR}/lib${SDK_NAME}.a"

        #Assets
        LOCAL_TARGET_ASSETS_DIR="${LOCAL_TARGET_DIR}/Assets"

        if [ -d "${LOCAL_TARGET_ASSETS_DIR}" ] ;then
            rm -r "${LOCAL_TARGET_ASSETS_DIR}"
        fi

        SDK_ASSETS_PATH="../Assets"
        cp -r "${SDK_ASSETS_PATH}" "${LOCAL_TARGET_ASSETS_DIR}"

		open "${LOCAL_TARGET_A_DIR}"
	else
		open "${SDK_DIR}"
	fi

    #删除编译文件
    if [ -d "${BUILD_DIR}" ] ;then
        rm -r "${BUILD_DIR}"
    fi

    if [ -d "${BUILD_OS_DIR}" ] ;then
        rm -r "${BUILD_OS_DIR}"
    fi
fi
