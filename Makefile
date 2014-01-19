DEFAULT: all
XCODEBUILD		= xcodebuild CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO -target Ejecta -sdk iphoneos -jobs 2
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
