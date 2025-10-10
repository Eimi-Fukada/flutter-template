import 'package:get_it/get_it.dart';
import 'package:flutter_template/core/config/app_config.dart';
import 'package:flutter_template/core/utils/logger.dart';

/// 依赖注入容器实例
final getIt = GetIt.instance;

/// 初始化依赖注入
Future<void> initDependencies() async {
  // 注册配置管理器
  getIt.registerSingleton<AppConfig>(AppConfig());

  // 注册日志工具
  getIt.registerSingleton<Logger>(Logger());

  // 在这里可以注册其他服务，如API服务、数据库服务等
  // 修改:使用getIt获取Logger实例来调用info方法
  getIt<Logger>().info('Dependencies initialized');
}