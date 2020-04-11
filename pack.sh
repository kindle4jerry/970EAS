#!/bin/sh
#ENVIRONMENT
MAGISK_MODULE=MagiskModule
VERSION_INFO=`sed -n '/^version=/p' $MAGISK_MODULE/module.prop`
VERSION_CODE=${VERSION_INFO#*=}
ZIP_FILE_NAME=970EAS$VERSION_CODE.zip
#PACK
cd $MAGISK_MODULE
zip -r $ZIP_FILE_NAME *
mv -f $ZIP_FILE_NAME ../
cd ..

