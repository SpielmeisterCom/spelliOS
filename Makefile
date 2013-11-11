DEFAULT: release

.PHONY: clean
clean:
	rm -Rf build/ || true

.PHONY: release 
release: clean
	mkdir build/

	mkdir -p build/release
	cp -aR modules/native-ios/tealeaf build/release
	cp -aR modules/native-core/* build/release/tealeaf/native-core

