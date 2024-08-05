import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  void increment() {
    setState(() {
      _counter++;
    });
  }

  /// バッドコード
  /// ボタンタップの度にScaffoldウィジェットやAppBarウィジェットも再構築されてしまう
  /// 状態更新があった際に、その状態とは関係のないウィジェットまで再構築されることは避けるべき
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('count = $_counter'),
          onPressed: () => increment(),
        ),
      ),
    );
  }
}
