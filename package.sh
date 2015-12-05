#!/bin/bash


echo "ns ma785q6v1"
cp -rf $DEVICE/packconfigs/fiber-ns-ma975q9v2 $PACKAGE/chips/sun6i/configs/android/
BOARD=fiber-ns-ma975q9v2
echo $BOARD

rm $OUT/system/app/Development.apk > /dev/null 2>&1
rm $OUT/system/app/SpeechRecorder.apk > /dev/null 2>&1
rm $OUT/system/app/VideoEditor.apk > /dev/null 2>&1
rm $OUT/system/app/OpenWnn.apk > /dev/null 2>&1
rm $OUT/system/app/BDVideoHD.apk > /dev/null 2>&1
rm $OUT/system/app/FireReader.apk > /dev/null 2>&1
rm $OUT/system/app/GoogleIME.apk > /dev/null 2>&1
rm $OUT/system/app/PinyinIME.apk > /dev/null 2>&1


make systemimage-nodeps
cd $PACKAGE
DEBUG="uart0"
SIGMODE="none"
if [ "$1" = "-d" -o "$2" = "-d" ]; then
	echo "--------debug version, have uart printf-------------"
	DEBUG="card0";
else
	echo "--------release version, donnot have uart printf-------------"
fi
if [ "$1" = "-s" -o "$2" = "-s" ]; then
	echo "-------------------sig version-------------------"
	SIGMODE="sig";
fi
	./pack -c sun6i -p android -b $BOARD  -d ${DEBUG} -s ${SIGMODE}

cd -
