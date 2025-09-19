import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:english_words/english_words.dart';

// 1. 定义Riverpod的全局状态
final appStateProvider = StateNotifierProvider<MyAppState, _MyAppState>((ref) => MyAppState());

class _MyAppState {
  var current = WordPair.random();
  var history = <WordPair>[];
  var favorites = <WordPair>[];
}

class MyAppState extends StateNotifier<_MyAppState> {
  MyAppState() : super(_MyAppState());

  void getNext() {
    state.history.insert(0, state.current);
    state.current = WordPair.random();
    state = _MyAppState()
      ..current = state.current
      ..history = state.history
      ..favorites = state.favorites;
  }

  void toggleFavorite([WordPair? pair]) {
    pair = pair ?? state.current;
    if (state.favorites.contains(pair)) {
      state.favorites.remove(pair);
    } else {
      state.favorites.add(pair);
    }
    state = _MyAppState()
      ..current = state.current
      ..history = state.history
      ..favorites = state.favorites;
  }
}

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
    return MaterialApp(
      title: 'Namer App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(6, 248, 42, 0.5)),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Namer App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              appState.current.asPascalCase,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => ref.read(appStateProvider.notifier).getNext(),
              child: const Text('Next'),
            ),
            ElevatedButton(
              onPressed: () => ref.read(appStateProvider.notifier).toggleFavorite(),
              child: const Text('Toggle Favorite'),
            ),
          ],
        ),
      ),
    );
  }
}