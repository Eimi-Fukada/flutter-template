# flutter-template
使用flutter搭建的模板项目

## flutter踩坑
1. pubspec.yaml文件的dependencies是配置项目依赖的地方，确保所有的依赖都在这里引入了
2. flutter启动项目可能会报错Dart library 'dart:ui' is not available on this platform，要卸载vscode中安装的Code Runer插件，这个会导致项目启动报错
3. 如果是在macOS上启动项目，可能会提示 Process exited abnormally with exit code 69: You have not agreed to the Xcode license agreements.这类的报错，需要再控制台输入sudo xcodebuild -license，然后输入密码填写agree，运行电脑安装桌面端应用
4. Widget Inspector可以实现和浏览器的选中布局一样的功能，在启动项目的状态栏的最后一个，然后点击左上角的箭头选中某一个元素
5. @override 是一个内置的注解，用于标识子类中的方法覆盖了父类中的方法，比如class MyWidget extends StatelessWidget，代表MyWidget中的方法是覆盖了 StatelessWidget 类中的方法的，清晰的告诉你哪些方法是从父类继承并被重写的
6. 使用cmd + . 或者ctrl + . 可以调出重构菜单

## 打包
flutter build apk --debug --verbose 可以看到打包的日志

## 打包很慢的解决方案：
1. 配置 Flutter 的国内镜像环境变量
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn

2. Gradle 全局配置
打开 android/build.gradle 文件，检查 buildscript 和 allprojects 部分的 repositories 是否也配置了阿里云镜像：
buildscript {
    repositories {
        maven { url 'https://maven.aliyun.com/repository/google' }
        maven { url 'https://maven.aliyun.com/repository/central' }
        // google()
        // mavenCentral()
    }
}

allprojects {
    repositories {
        maven { url 'https://maven.aliyun.com/repository/google' }
        maven { url 'https://maven.aliyun.com/repository/central' }
        // google()
        // mavenCentral()
    }
}

3. Gradle 缓存问题
Gradle 可能会缓存旧的依赖地址，导致即使修改了配置，仍然尝试从国外下载，需要清理 Gradle 缓存：
rm -rf ~/.gradle/caches/
重新运行构建命令
flutter clean && flutter build apk --debug --verbose