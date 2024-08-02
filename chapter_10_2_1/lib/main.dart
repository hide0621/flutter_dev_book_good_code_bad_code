import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  /// ベストプラクティス
  // const HomeScreen({super.key, required this.filteredItems});
  // final List<Item> filteredItems;

  @override
  Widget build(BuildContext context) {
    /// アンチパターン
    /// 画面遷移のためにNavigatorStateクラスを取得する以下の処理は
    /// ウィジェットの階層によっては計算量の大きな処理になる
    /// 不要な際は呼ばれないようにするためにも、
    /// 「ボタンがタップされた時」などのイベントに紐付けて呼ばれるべき
    // final navigator = Navigator.of(context);

    /// アンチパターン
    /// 以下のような実装ではbuildメソッドが呼ばれるたびにリストのフィルタリングが行われてしまうため、
    /// あらかじめフィルタリングしたリストをウィジェットに渡してbuildメソッドの実行コストを下げるべき
    // final filteredItems = items.where((item) => /* itemのフィルタ条件 */).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            /// ベストプラクティス
            final navigator = Navigator.of(context);
            navigator.push(
              MaterialPageRoute(
                builder: (context) => const DetailScreen(),
              ),
            );
          },
          child: const Text('Go to Detail Screen'),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Screen'),
      ),
      body: const Center(
        child: Text('Detail'),
      ),
    );
  }
}
