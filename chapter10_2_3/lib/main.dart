import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: HomeScreen(),
    ),
  );
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// ベストプラクティス
            /// ウィジェットは出来るだけconstantコンストラクタで実装して構築されるべきなので、
            /// 以下のようにウィジェットクラスをカスタムしてconstantコンストラクタで実装することが推奨される
            const ColoredText(
              text: 'You have pushed the button\nthis many times:',
              color: Colors.blueGrey,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

/// ベストプラクティス
/// ウィジェットは出来るだけconstantコンストラクタで実装して構築されるべきなので、
/// 以下のようにウィジェットクラスをカスタムしてconstantコンストラクタで実装することが推奨される
class ColoredText extends StatelessWidget {
  const ColoredText({super.key, required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    print('ColoredText build');
    return ColoredBox(
      color: color,
      child: Text(
        text,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
