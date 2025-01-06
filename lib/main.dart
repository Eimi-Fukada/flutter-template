import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 使用 ChangeNotifierProvider 创建状态并将其提供给整个应用
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          // Colors.deepOrange可以选择调色板，Color.fromRGBO可以选择透明色，Color(0xFF00FF00)可以使用十六进制
          colorScheme:
              ColorScheme.fromSeed(seedColor: Color.fromRGBO(0, 255, 0, 0.1)),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

// ChangeNotifier可以向其他人通知自己的更改
class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorities = <WordPair>[];

  void toggleFavorite() {
    if (favorities.contains(current)) {
      favorities.remove(current);
    } else {
      favorities.add(current);
    }
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text('A random idea:'),
            BigCard(pair: pair),
            SizedBox(height: 50),
            // 添加按钮
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton.icon(
                    onPressed: () {
                      appState.toggleFavorite();
                    },
                    icon: appState.favorities.contains(pair)
                        ? Icon(Icons.favorite)
                        : Icon(Icons.favorite_border),
                    label: Text(appState.favorities.contains(pair)
                        ? 'UnLike'
                        : 'Like')),
                SizedBox(width: 10),
                ElevatedButton(
                    onPressed: () {
                      print('button pressed');
                      appState.getNext();
                    },
                    child: Text('Next')),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!
        .copyWith(color: theme.colorScheme.surface);

    return Card(
      color: theme.colorScheme.primary,
      // elevation代表阴影
      elevation: 50.0,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          pair.asLowerCase,
          style: style,
          semanticsLabel: "${pair.first} ${pair.second}",
        ),
      ),
    );
  }
}
