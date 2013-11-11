DEFAULT: all
BUILD_DIR_RELEASE	= build/release
BUILD_DIR_DEBUG		= build/debug

.PHONY: all
all: release debug

.PHONY: debug
debug:
	rm -Rf $(BUILD_DIR_DEBUG) || true
	mkdir -p $(BUILD_DIR_DEBUG) 
	cp -aR modules/native-ios/tealeaf $(BUILD_DIR_DEBUG)
	cp -aR modules/native-core/* $(BUILD_DIR_DEBUG)/tealeaf/native-core
	cp -aR modules/jansson/* $(BUILD_DIR_DEBUG)/tealeaf/deps/jansson
	cd $(BUILD_DIR_DEBUG)/tealeaf && xcodebuild -target TeaLeafIOS -sdk iphoneos6.1 -configuration Debug -jobs 2

.PHONY: release 
release:
	rm -Rf $(BUILD_DIR_RELEASE) || true
	mkdir -p $(BUILD_DIR_RELEASE) 
	cp -aR modules/native-ios/tealeaf $(BUILD_DIR_RELEASE)
	cp -aR modules/native-core/* $(BUILD_DIR_RELEASE)/tealeaf/native-core
	cp -aR modules/jansson/* $(BUILD_DIR_RELEASE)/tealeaf/deps/jansson
	cd $(BUILD_DIR_RELEASE)/tealeaf && xcodebuild -target TeaLeafIOS -sdk iphoneos6.1 -configuration Release -jobs 2

