// 全局常量定义

// API 相关常量
class ApiConstants {
  // 基础 API URL
  static const String baseUrl = 'https://api.music.example.com';

  // API 版本
  static const String apiVersion = 'v1';

  // 超时时间（毫秒）
  static const int connectTimeout = 30000;
  static const int receiveTimeout = 30000;
}

// 路由常量
class RoutePaths {
  static const String home = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String musicPlayer = '/player';
  static const String playlist = '/playlist';
  static const String search = '/search';
  static const String profile = '/profile';
}

// 音乐播放相关常量
class MusicConstants {
  // 默认音量
  static const double defaultVolume = 1;

  // 播放模式
  static const String playModeLoop = 'loop'; // 循环播放
  static const String playModeSingle = 'single'; // 单曲循环
  static const String playModeRandom = 'random'; // 随机播放

  // 音频质量
  static const String qualityLow = 'low'; // 低质量
  static const String qualityMedium = 'medium'; // 中等质量
  static const String qualityHigh = 'high'; // 高质量
  static const String qualityLossless = 'lossless'; // 无损音质

  // 默认音频质量
  static const String defaultQuality = qualityHigh;

  // 进度条更新间隔（毫秒）
  static const int progressUpdateInterval = 1000;
}

// 缓存相关常量
class CacheConstants {
  // 最大缓存大小（字节）
  static const int maxCacheSize = 100 * 1024 * 1024; // 100MB

  // 播放历史最大保存数量
  static const int maxPlayHistory = 100;

  // 收藏歌曲最大保存数量
  static const int maxFavorites = 500;
}

// 用户相关常量
class UserConstants {
  // 用户名最小长度
  static const int minUsernameLength = 3;

  // 用户名最大长度
  static const int maxUsernameLength = 20;

  // 密码最小长度
  static const int minPasswordLength = 6;

  // 密码最大长度
  static const int maxPasswordLength = 20;
}

// 时间格式常量
class TimeFormats {
  static const String displayFormat = 'mm:ss';
  static const String fullDisplayFormat = 'HH:mm:ss';
}
