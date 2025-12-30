export VCPKG_ROOT=$(HOME)/Projects/vcpkg
CMAKE_TOOLCHAIN_FILE?=$(HOME)/Projects/vcpkg/scripts/buildsystems/vcpkg.cmake
BUILD_DIR=build/make
export CMAKE_PREFIX_PATH=vcpkg_installed/arm64-osx/share

build:
	vcpkg install
	vcpkg integrate install
	cmake -B $(BUILD_DIR) -S . \
		-DCMAKE_TOOLCHAIN_FILE=$(DCMAKE_TOOLCHAIN_FILE)
	cmake --build $(BUILD_DIR) --parallel
.PHONY: build

install-macos-deps:
	brew install vcpkg
.PHONY: install-macos-deps

run-2d:
	$(BUILD_DIR)/BlackHole2D
.PHONY: run-2d

run-3d:
	$(BUILD_DIR)/BlackHole3D
.PHONY: run-3d