DEFAULT: release
BUILD_DIR_RELEASE	= build/release

.PHONY: clean
clean:
	rm -Rf build/ || true

.PHONY: release 
release: clean
	mkdir build/

	mkdir -p $(BUILD_DIR_RELEASE) 
	cp -aR modules/native-ios/tealeaf $(BUILD_DIR_RELEASE)
	cp -aR modules/native-core/* $(BUILD_DIR_RELEASE)/tealeaf/native-core
	cp -aR modules/jansson/* $(BUILD_DIR_RELEASE)/tealeaf/deps/jansson
	cd $(BUILD_DIR_RELEASE)/tealeaf && xcodebuild -target TeaLeafIOS -sdk iphoneos6.1 -configuration Release -jobs 2

