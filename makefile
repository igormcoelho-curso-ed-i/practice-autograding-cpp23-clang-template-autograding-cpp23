all: clean test

appTests: deps
	mkdir -p build
	clang++ -print-file-name=libc++.modules.json 
	echo "EXPECTED: /usr/lib/llvm-21/lib/libc++.modules.json"
	cd build && cmake .. -DCMAKE_CXX_STDLIB_MODULES_JSON=/usr/lib/llvm-21/lib/libc++.modules.json -GNinja  && ninja

test: appTests
	./build/app_tests

deps:
	python3 -m pip install --force-reinstall -v "cmake==4.3" --break-system-packages

clean:
	rm -f build/
