// 全局日志工具类

import 'package:flutter/foundation.dart';

class Logger {
  final String _tag = 'MusicApp'; // 实例变量替代静态常量

  /// 输出调试日志
  void debug(String message) {
    if (kDebugMode) {
      // 只在调试模式下输出日志
      print('[$_tag] DEBUG: $message');
    }
  }

  /// 输出信息日志
  void info(String message) {
    if (kDebugMode) {
      print('[$_tag] INFO: $message');
    }
  }

  /// 输出错误日志
  void error(String message, [StackTrace? stackTrace]) {
    if (kDebugMode) {
      print('[$_tag] ERROR: $message');
      if (stackTrace != null) {
        print(stackTrace);
      }
    }
  }

  /// 输出警告日志
  void warn(String message) {
    if (kDebugMode) {
      print('[$_tag] WARN: $message');
    }
  }
}