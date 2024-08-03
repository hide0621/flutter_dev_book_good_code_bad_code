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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),

      /// Rowウィジェット
      /// 子ウィジェットを水平方向に並べる

      /// アンチパターン
      /// ウィジェットを右下に配置したい場合、RowウィジェットとColumnウィジェットを組み合わせて実現できるが、
      /// それだとウィジェットの階層が深くなってしまい再構築するウィジェットも増え、
      /// Elementの再利用判定などのコストが高くなってしまう
      body: Row(
        mainAxisAlignment: MainAxisAlignment.end, // 右寄せ
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.end, // 下寄せ
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const DetailScreen(),
                      ),
                    );
                  },
                  child: const Text('Go to Detail'),
                )
              ])
        ],
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
