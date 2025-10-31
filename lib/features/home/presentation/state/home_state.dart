import 'package:flutter_riverpod/flutter_riverpod.dart';

// 首页计数器状态Provider
final counterProvider = StateProvider<int>((ref) => 0);
