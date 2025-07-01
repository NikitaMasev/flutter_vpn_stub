.PHONY: clean watch gen genAll upgrade run_dev_mobile_debug run_prod_mobile_debug run_prod_mobile_release build_dev_mobile_debug build_prod_mobile_debug build_prod_mobile_release build_test_mobile_release build_dev_mobile_release build_stage_mobile_release

clean:
	@echo "Cleaning the project..."
	@del pubspec.lock
	@flutter clean
	@flutter pub get

watch:
	@echo "Watching the project..."
	@dart run build_runner watch --delete-conflicting-outputs

gen:
	@echo "Generating files by build_runner..."
	@dart run build_runner build --delete-conflicting-outputs

genAll:
	@echo "Generating all files..."
	@dart run build_runner build --delete-conflicting-outputs
	@dart run icons_launcher:create --path icons_launcher.yaml

upgrade: clean
	@echo "Upgrading dependencies..."
	@flutter pub upgrade
	@flutter pub get

run_dev_mobile_debug:
	@echo "Running DEV the mobile app debug"
	@flutter run --dart-define-from-file=envs/env_dev_keys.json

run_prod_mobile_debug:
	@echo "Running PROD the mobile app debug"
	@flutter run --dart-define-from-file=envs/env_prod_keys.json

run_prod_mobile_release:
	@echo "Running PROD the mobile app release"
	@flutter run --release --dart-define-from-file=envs/env_prod_keys.json

build_dev_mobile_debug:
	@echo "Building DEV the mobile app debug"
	@flutter build apk --dart-define-from-file=envs/env_dev_keys.json

build_prod_mobile_debug:
	@echo "Building PROD the mobile app debug"
	@flutter build apk --dart-define-from-file=envs/env_prod_keys.json

build_prod_mobile_release:
	@echo "Building PROD the mobile app release"
	@flutter build apk --release --dart-define-from-file=envs/env_prod_keys.json

build_test_mobile_release:
	@echo "Building TEST the mobile app release"
	@flutter build apk --release --dart-define-from-file=envs/env_test_keys.json

build_dev_mobile_release:
	@echo "Building DEV the mobile app release"
	@flutter build apk --release --dart-define-from-file=envs/env_dev_keys.json

build_stage_mobile_release:
	@echo "Building STAGE the mobile app release"
	@flutter build apk --release --dart-define-from-file=envs/env_stage_keys.json