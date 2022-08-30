#!/bin/bash

APP_NAME="KakaoTalk"
NEW_APP_NAME="${APP_NAME}2"


# delete old app
if [ -e /Applications/${NEW_APP_NAME}.app ]; then
	rm -rf /Applications/${NEW_APP_NAME}.app
fi

# copy app
cp -a /Applications/${APP_NAME}.app /Applications/${NEW_APP_NAME}.app
mv /Applications/${NEW_APP_NAME}.app/contents/MacOS/KakaoTalk /Applications/${NEW_APP_NAME}.app/Contents/MacOS/${NEW_APP_NAME}
cd /Applications/${NEW_APP_NAME}.app/Contents/

sed -i .bak "s/${APP_NAME}<\/string>/${NEW_APP_NAME}<\/string>/g" Info.plist
sed -i .bak "s/com.kakao.${APP_NAME}Mac<\/string>/com.kakao.${NEW_APP_NAME}Mac<\/string>/g" Info.plist


codesign --force --deep --sign - /Applications/${NEW_APP_NAME}.app
#mv /Applications/KakaoTalkDev.app /Applications/KakaoTalkNew.app

# open app
open /Applications/${NEW_APP_NAME}.app