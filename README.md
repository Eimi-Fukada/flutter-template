# flutter-template
🚀 一个功能完整的 Flutter 应用模板，集成了现代 Flutter 开发的最佳实践和常用功能。

## 📱 项目特色

### 🏗️ 现代化架构
- **Riverpod** 状态管理 - 专注 UI 状态，类型安全
- **GetIt + Injectable** 依赖注入 - 高性能、类型安全的 DI 容器
- **Freezed** 数据模型 - 不可变数据类，联合类型支持
- **Dartz** 函数式编程 - Either 类型处理错误

### 🚀 开发体验
- **GoRouter** 路由导航 - 官方推荐的声明式路由
- **Dio** 网络请求 - 功能丰富的 HTTP 客户端
- **代码生成** - 自动生成样板代码，提升开发效率
- **完整测试** - 单元测试、Widget 测试、集成测试

### 🎨 用户体验
- **Material 3** 设计系统 - Google 最新设计语言
- **主题切换** - 支持浅色/深色/跟随系统
- **国际化支持** - 多语言本地化
- **响应式设计** - 适配不同屏幕尺寸

## 🏗️ 项目架构

### 分层架构
```text
┌─────────────────────────────────────┐
│            UI Layer                 │  ← Riverpod (状态管理)
├─────────────────────────────────────┤
│         Business Layer             │  ← GetIt (依赖注入)
├─────────────────────────────────────┤
│           Data Layer               │  ← Freezed (数据模型)
└─────────────────────────────────────┘
```

### 目录结构
```text
lib/
├── di/                      # 🔧 依赖注入配置
│   ├── service_locator.dart # GetIt 容器配置
│   └── providers.dart       # Riverpod Providers
├── core/                    # 🏗️ 核心基础设施
│   ├── constants/          # 应用常量
│   ├── errors/             # 错误类型和异常处理
│   ├── extensions/         # 扩展方法
│   ├── network/            # 网络配置
│   └── utils/              # 工具类
├── features/               # 🎯 功能模块
│   ├── auth/               # 认证模块
│   ├── home/               # 首页模块
│   └── settings/           # 设置模块
├── shared/                 # 🔄 共享组件
│   ├── widgets/            # 通用 UI 组件
│   └── models/             # 数据模型
└── main.dart               # 🚀 应用入口
```

### 技术选型
| 层级         | 技术选型               | 用途                          |
|--------------|------------------------|-----------------------------|
| **UI 层**    | Riverpod              | UI 状态管理、响应式更新       |
| **业务层**   | GetIt + Injectable     | 依赖注入、服务定位            |
| **数据层**   | Freezed               | 不可变数据模型                |
| **网络层**   | Dio                   | HTTP 请求、拦截器             |
| **路由层**   | GoRouter              | 声明式路由导航                |

## 🚀 快速开始

### 环境要求
- Flutter SDK >= 3.0.0
- Dart SDK >= 3.0.0

### 安装依赖
```bash
flutter pub get
```

### 生成代码
```bash
dart run build_runner build --delete-conflicting-outputs
```

### 运行应用
```bash
flutter run
```

## 🧪 测试
### 运行单元测试
```bash
flutter test test/unit/
```

### 运行 Widget 测试
```bash
flutter test test/widget/
```

## 📦 核心依赖
- **状态管理**: `flutter_riverpod`
- **依赖注入**: `get_it` + `injectable`
- **路由导航**: `go_router`
- **网络请求**: `dio`
- **数据模型**: `freezed`

## 📚 文档指南
- [Riverpod 使用指南](docs/RIVERPOD_GUIDE.md)
- [GetIt 集成指南](docs/GET_IT_GUIDE.md)
- [Freezed 数据模型](docs/FREEZED_GUIDE.md)

## 🐛 故障排除
### 常见问题
1. **依赖冲突**
   ```bash
   flutter clean
   flutter pub get
   ```

2. **代码生成失败**
   ```bash
   dart run build_runner clean
   dart run build_runner build --delete-conflicting-outputs
   ```

## ✨ 功能特性
- **用户认证系统** - 登录/注册、会话管理
- **主题切换** - 支持浅色/深色模式
- **国际化** - 多语言支持

## 技术选型分析

### Flutter
- **优点**:
  - 跨平台开发（iOS/Android/Web/Desktop）
  - 高性能，接近原生体验
  - 丰富的组件库和社区支持
- **缺点**:
  - 对原生功能依赖较强时，可能需要编写平台特定代码
  - 包体积较大
- **文档地址**: [Flutter 官方文档](https://flutter.dev/docs)

### Riverpod（状态管理）
- **优点**:
  - 轻量级，易于测试和复用
  - 支持依赖注入和异步状态管理
  - 与 Flutter 深度集成
- **缺点**:
  - 学习曲线较 Provider 略高
  - 需要手动处理部分依赖关系
- **文档地址**: [Riverpod 官方文档](https://riverpod.dev/docs)

### 其他技术栈对比
1. **React Native**:
   - 优点：生态成熟，社区活跃
   - 缺点：性能略逊于 Flutter，依赖原生桥接
   - 文档: [React Native 官方文档](https://reactnative.dev/docs/getting-started)
2. **原生开发（Kotlin/Swift）**:
   - 优点：性能最佳，功能支持最全面
   - 缺点：开发成本高，无法跨平台
   - 文档: [Kotlin](https://kotlinlang.org/docs/home.html) / [Swift](https://docs.swift.org/swift-book/)

## flutter 踩坑
1. pubspec.yaml文件的dependencies是配置项目依赖的地方，确保所有的依赖都在这里引入了
2. flutter启动项目可能会报错Dart library 'dart:ui' is not available on this platform，要卸载vscode中安装的Code Runer插件，这个会导致项目启动报错
3. 如果是在macOS上启动项目，可能会提示 Process exited abnormally with exit code 69: You have not agreed to the Xcode license agreements.这类的报错，需要再控制台输入sudo xcodebuild -license，然后输入密码填写agree，运行电脑安装桌面端应用
4. Widget Inspector可以实现和浏览器的选中布局一样的功能，在启动项目的状态栏的最后一个，然后点击左上角的箭头选中某一个元素
5. @override 是一个内置的注解，用于标识子类中的方法覆盖了父类中的方法，比如class MyWidget extends StatelessWidget，代表MyWidget中的方法是覆盖了 StatelessWidget 类中的方法的，清晰的告诉你哪些方法是从父类继承并被重写的
6. 使用cmd + . 或者ctrl + . 可以调出重构菜单

## 打包
```bash
flutter build apk --debug --verbose
```

## 打包很慢的解决方案
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