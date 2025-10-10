import 'package:flutter/material.dart';
import 'package:flutter_template/core/di/injector.dart';
import 'package:flutter_template/core/theme/app_theme.dart';
import 'package:flutter_template/core/utils/logger.dart';

void main() async {
  // 确保初始化完成
  WidgetsFlutterBinding.ensureInitialized();
  
  // 初始化依赖注入
  await initDependencies();
  
  // 记录应用启动日志
  // 修改:使用getIt获取Logger实例来调用info方法
  getIt<Logger>().info('Application started');
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '网易云音乐',
      theme: AppTheme.lightTheme(), // 使用浅色主题
      darkTheme: AppTheme.darkTheme(), // 使用深色主题
      themeMode: ThemeMode.system, // 跟随系统主题
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('网易云音乐'),
      ),
      body: const Center(
        child: Text('欢迎使用网易云音乐'),
      ),
    );
  }
}