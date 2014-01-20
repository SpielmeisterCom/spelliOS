DEFAULT: all
SDK = iphoneos7.0
ARCHS = armv7 armv7s arm64
XCODEBUILD = xcodebuild CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO ONLY_ACTIVE_ARCH=NO ARCHS="$(ARCHS)" -target Ejecta -sdk $(SDK) -jobs 2
.PHONY: all
all:
	rm -rf build/ || true
	mkdir build

	mkdir modules/Ejecta/App || true
	cp index.js modules/Ejecta/App

	# try to compile Ejecta
	cd modules/Ejecta && $(XCODEBUILD) -configuration Debug 
	cd modules/Ejecta && $(XCODEBUILD) -configuration Release 

	cp -aR modules/Ejecta/* build/

	# remove prebuilt binarys
	rm -rf build/build
