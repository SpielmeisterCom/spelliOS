.DEFAULT: release

.PHONY: clean
clean:
	rm -Rf build/ || true

.PHONY: release 
release: clean
	mkdir build/

