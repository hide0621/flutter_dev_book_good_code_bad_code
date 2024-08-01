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

  @override
  Widget build(BuildContext context) {
    /// 画面遷移のためにNavigatorStateクラスを取得する以下の処理は
    /// ウィジェットの階層によっては計算量の大きな処理になる
    /// 不要な際は呼ばれないようにするためにも、
    /// 「ボタンがタップされた時」などのイベントに紐付けて呼ばれるべき
    // final navigator = Navigator.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
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
