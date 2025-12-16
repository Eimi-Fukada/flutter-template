import 'package:get_it/get_it.dart';
import 'package:flutter_template/core/config/app_config.dart';
import 'package:flutter_template/core/utils/logger.dart';
import 'package:flutter_template/features/music/domain/services/audio_player_service.dart';

/// 依赖注入容器实例
final getIt = GetIt.instance;

/// 初始化依赖注入
Future<void> initDependencies() async {
  // 注册配置管理器
  getIt.registerSingleton<AppConfig>(AppConfig());

  // 注册日志工具
  getIt.registerSingleton<Logger>(Logger());

  // 注册音频播放服务
  getIt.registerLazySingleton<AudioPlayerService>(() => AudioPlayerService());

  // 在这里可以注册其他服务，如API服务、数据库服务等
  getIt<Logger>().info('Dependencies initialized');
}