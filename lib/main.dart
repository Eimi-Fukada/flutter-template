import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/router/router.dart';
import 'package:flutter_template/components/music_player_bar/index.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 定义最小宽高
    const double minWidth = 1052;
    const double minHeight = 748;

    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(
          // 设置为纯黑色主题
          primary: Colors.black,
          secondary: Colors.white,
          surface: Colors.white,
          onPrimary: Colors.black, // 文字颜色为白色
          onSecondary: Colors.white,
          onSurface: Colors.white,
        ),
      ),
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth < minWidth ||
                  constraints.maxHeight < minHeight) {
                return SizedBox(
                  width: minWidth,
                  height: minHeight,
                  child: child,
                );
              }
              return child!;
            },
          ),
          bottomNavigationBar: const MusicPlayerBar(),
        );
      },
    );
  }
}
