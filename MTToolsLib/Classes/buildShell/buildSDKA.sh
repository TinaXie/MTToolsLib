#!/bin/sh

#获取当前目录 和 获得 文件夹名
PROJECT_PATH=$(cd `dirname $0`; pwd)
PROJECT_NAME="${PROJECT_PATH##*/}"

PROJ=${PROJECT_NAME}.xcodeproj
#把项目名改为自己的即可使用
LIB_STATIC_NAME=${PROJECT_NAME}
#打包出来的文件的目录，可以自己定义
TEMP_DIR=~/XcodeSDKBuild

#静态库文件
LIB_NAME=lib${LIB_STATIC_NAME}.a
LIB_OUTFILE=$"lib_${PROJECT_NAME}.a"

IPHONE_OS_DIR=${TEMP_DIR}/${CONFIGURATION}-iphoneos
IPHONE_SIMULATOR_DIR=${TEMP_DIR}/${CONFIGURATION}-iphonesimulator

#创建真机库文件目录
if [[ ! -d ${IPHONE_OS_DIR} ]]; then
mkdir -p ${IPHONE_OS_DIR}
fi

#创建模拟器库文件目录
if [[ ! -d ${IPHONE_SIMULATOR_DIR} ]]; then
mkdir -p ${IPHONE_SIMULATOR_DIR}
fi

echo ${IPHONE_SIMULATOR_DIR}
echo ${IPHONE_OS_DIR}

#编译真机库文件
xcodebuild -project ${PROJ} \
-scheme ${LIB_STATIC_NAME} \
-configuration ${CONFIGURATION} \
-sdk iphoneos \
clean \
build \
CONFIGURATION_BUILD_DIR=${IPHONE_OS_DIR}

#编译模拟器库文件
xcodebuild build -project ${PROJ} \
-scheme ${LIB_STATIC_NAME} \
-configuration ${CONFIGURATION} \
-sdk iphonesimulator \
clean \
build \
CONFIGURATION_BUILD_DIR=${IPHONE_SIMULATOR_DIR}

#合并模拟器文件和真机文件
lipo -create ${IPHONE_OS_DIR}/${LIB_NAME} ${IPHONE_SIMULATOR_DIR}/${LIB_NAME} -output ${TEMP_DIR}/${LIB_OUTFILE}
lipo -info ${LIB_OUTFILE}


#拷贝头文件和.a文件到同一目录下
##建立SDK目录
pushd ${TEMP_DIR}
if [[ -d ${LIB_STATIC_NAME} ]]; then
rm -fR ${LIB_STATIC_NAME}
fi

mkdir -p ${LIB_STATIC_NAME}

##拷贝.a和头文件(与其他相关文件)
cp -fR ${LIB_OUTFILE} ${LIB_STATIC_NAME}
rm -fR ${LIB_OUTFILE}

cp -f ${IPHONE_SIMULATOR_DIR}/include/${LIB_STATIC_NAME}/*  ${LIB_STATIC_NAME}

cp -fR ${IMAGEBUDDLE_DIR} ${LIB_STATIC_NAME}
cp -fR ${DOC_DIR} ${LIB_STATIC_NAME}

#打包为zip文件
#PACKAGE_DATE=`date '+%Y%m%d%H'`
#GIT_VERSION=`git log --abbrev-commit|head -1|cut -d' ' -f2`
#
#SDK_ZIP_NAME=iOS_${LIB_STATIC_NAME}_${PACKAGE_DATE}_${GIT_VERSION}_${CONFIGURATION}.zip
#
#zip -qr ${SDK_ZIP_NAME} ${LIB_STATIC_NAME}

