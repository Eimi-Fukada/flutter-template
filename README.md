# flutter-template
使用flutter搭建的模板项目

## flutter踩坑
1. pubspec.yaml文件的dependencies是配置项目依赖的地方，确保所有的依赖都在这里引入了
2. flutter启动项目可能会报错Dart library 'dart:ui' is not available on this platform，要卸载vscode中安装的Code Runer插件，这个会导致项目启动报错
3. 如果是在macOS上启动项目，可能会提示 Process exited abnormally with exit code 69: You have not agreed to the Xcode license agreements.这类的报错，需要再控制台输入sudo xcodebuild -license，然后输入密码填写agree，运行电脑安装桌面端应用
4. Widget Inspector可以实现和浏览器的选中布局一样的功能，在启动项目的状态栏的最后一个，然后点击左上角的箭头选中某一个元素