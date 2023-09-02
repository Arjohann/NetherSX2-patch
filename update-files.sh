#!/bin/bash
if command -v "aapt" >/dev/null 2>&1; then
	# Fixes License Compliancy Issue
	aapt r 15210-v1.5-4248-noads.apk assets/3rdparty.html
	aapt a 15210-v1.5-4248-noads.apk assets/3rdparty.html
	# Updates No Interlace Patches
	aapt r 15210-v1.5-4248-noads.apk assets/cheats_ni.zip
	aapt a 15210-v1.5-4248-noads.apk assets/cheats_ni.zip
	# Updates Widescreen Patches
	aapt r 15210-v1.5-4248-noads.apk assets/cheats_ws.zip
	aapt a 15210-v1.5-4248-noads.apk assets/cheats_ws.zip
	# Updates Game Controller Database
	aapt r 15210-v1.5-4248-noads.apk assets/game_controller_db.txt
	aapt a 15210-v1.5-4248-noads.apk assets/game_controller_db.txt
	# Updates GameDB with removed features not supported by the libemucore.so from March 13th
	aapt r 15210-v1.5-4248-noads.apk assets/GameIndex.yaml
	aapt a 15210-v1.5-4248-noads.apk assets/GameIndex.yaml
	# Adds the placeholder file that makes RetroAchievements Notifications work
	aapt a 15210-v1.5-4248-noads.apk assets/placeholder.png
else
	chmod +x lib/aapt
	lib/aapt r 15210-v1.5-4248-noads.apk assets/3rdparty.html
	lib/aapt a 15210-v1.5-4248-noads.apk assets/3rdparty.html

	lib/aapt r 15210-v1.5-4248-noads.apk assets/cheats_ni.zip
	lib/aapt a 15210-v1.5-4248-noads.apk assets/cheats_ni.zip

	lib/aapt r 15210-v1.5-4248-noads.apk assets/cheats_ws.zip
	lib/aapt a 15210-v1.5-4248-noads.apk assets/cheats_ws.zip

	lib/aapt r 15210-v1.5-4248-noads.apk assets/game_controller_db.txt
	lib/aapt a 15210-v1.5-4248-noads.apk assets/game_controller_db.txt

	lib/aapt r 15210-v1.5-4248-noads.apk assets/GameIndex.yaml
	lib/aapt a 15210-v1.5-4248-noads.apk assets/GameIndex.yaml

	lib/aapt a 15210-v1.5-4248-noads.apk assets/placeholder.png
fi

# Resigns the APK before exiting
if command -v "apksigner" >/dev/null 2>&1; then
	apksigner sign --ks lib/android.jks --ks-pass pass:android 15210-v1.5-4248-noads.apk
else
	exec java -jar lib/apksigner.jar sign --ks lib/android.jks --ks-pass pass:android 15210-v1.5-4248-noads.apk
fi
# Alternate Key:
# if command -v "apksigner" >/dev/null 2>&1; then
# 	apksigner sign --ks lib/public.jks --ks-pass pass:public 15210-v1.5-4248-noads.apk
# else
# 	exec java -jar lib/lib/apksigner.jar sign --ks lib/public.jks --ks-pass pass:public 15210-v1.5-4248-noads.apk
# fi