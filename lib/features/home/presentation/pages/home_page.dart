import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_template/features/home/presentation/state/home_state.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);

    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('计数: $counter', style: const TextStyle(fontSize: 24)),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () => _onProfileButtonPressed(context),
            child: const Text('Go to Profile Page'),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () => _onIncrementButtonPressed(ref),
            child: const Text('增加数字'),
          ),
        ],
      )),
    );
  }
}

void _onProfileButtonPressed(BuildContext context) {
  print('个人资料按钮被点击了！'); // 打印日志
  context.push('/profile'); // 执行导航
}

void _onIncrementButtonPressed(WidgetRef ref) {
  print('增加数字按钮被点击了！');
  ref.read(counterProvider.notifier).state++; // 修改状态
}
