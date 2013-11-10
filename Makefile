DEFAULT: release

.PHONY: clean
clean:
	rm -Rf build/ || true

.PHONY: release 
release: clean
	mkdir build/

	rm modules/native-ios/tealeaf/native-core
	ln -sf ../../../native-core modules/native-ios/tealeaf/native-core
