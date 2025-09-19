# Flutter 项目常用命令

# 安装依赖
install:
	flutter pub get

# 生成代码（Freezed、Injectable、JSON 序列化等）
gen:
	dart run build_runner build --delete-conflicting-outputs

# 监听文件变化并自动生成代码（开发时使用）
watch:
	dart run build_runner watch --delete-conflicting-outputs

# 清理生成的文件
clean:
	dart run build_runner clean

# 运行所有测试
test:
	flutter test

# 启动开发环境（调试模式）
run:
	flutter run

# 打包 Android APK
build-apk:
	flutter build apk --split-per-abi

# 打包 Android App Bundle
build-aab:
	flutter build appbundle

# 安装 APK 到设备
install-apk:
	adb install build/app/outputs/flutter-apk/app-release.apk