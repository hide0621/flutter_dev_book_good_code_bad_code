import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: HomeScreen(),
  ));
}

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _counter = 0;
//
//   void increment() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   /// アンチパターン
//   /// ボタンタップの度にScaffoldウィジェットやAppBarウィジェットも再構築されてしまう
//   /// 状態更新があった際[_counter]に、その状態とは関係のないウィジェットまで再構築されることは避けるべき
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home Screen'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           child: Text('count = $_counter'),
//           onPressed: () => increment(),
//         ),
//       ),
//     );
//   }
// }

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  /// ベストプラクティス
  /// CountButtonウィジェットを作成し、そのウィジェット内で状態[_counter]を管理する
  /// こうすることで、CountButtonウィジェットの状態更新時には、CountButtonウィジェットのみが再構築される
  ///
  /// また関心事を分けることにも繋がり、HomeScreen画面のコードからカウントアップのロジックを分離することができた
  /// これにより保守性が高まり、CountButtonウィジェットは再利用性も確保された
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: const Center(
        child: CountButton(),
      ),
    );
  }
}

class CountButton extends StatefulWidget {
  const CountButton({super.key});

  @override
  State createState() => _CountButtonState();
}

class _CountButtonState extends State<CountButton> {
  int _counter = 0;

  void increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('count = $_counter'),
      onPressed: () => increment(),
    );
  }
}
