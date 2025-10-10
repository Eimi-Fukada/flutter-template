import 'package:flutter/foundation.dart';
import 'package:flutter_template/shared/constants.dart';

/// 应用配置管理类
class AppConfig {
  // 私有构造函数
  AppConfig._();

  /// 工厂构造函数，确保单例模式
  factory AppConfig() => _instance;
  
  /// 单例实例
  static final AppConfig _instance = AppConfig._();

  /// 获取API基础URL
  static String get apiUrl => ApiConstants.baseUrl;

  /// 获取是否为调试模式
  static bool get isDebugMode => kDebugMode;

  /// 获取应用版本
  static String get version => '1.0.0';

  /// 获取默认超时时间
  static int get defaultTimeout => ApiConstants.connectTimeout;
}