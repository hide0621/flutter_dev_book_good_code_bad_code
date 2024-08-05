import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: HomeScreen(),
    ),
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  /// アンチパターン
  /// buildメソッドの中でconst修飾子が付与されていないウィジェットがある
  ///
  /// const修飾子が付与されたウィジェットはコンパイル時定数なので常に同じインスタンスになり、
  /// buildメソッドが実行されてもそのウィジェットは再構築されない（これによりメモリ効率が良くなる）
  ///
  /// ただしconst修飾子が付与されたウィジェットは表示内容を更新できないかと言うとそうではない（StatefulWidget、InheritedWidgetを使った場合）
  /// const修飾子はそのウィジェットを更新不可にするのではなく、先祖の更新の影響を受けなくなる、という効果がある
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        A(
          child: Text('A'),
        ),
        B(
          child: Text('B'),
        ),
        const C(
          child: Text('C'),
        ),
      ],
    );
  }
}

class A extends StatelessWidget {
  const A({super.key, required this.child});

  final Widget child;

  /// アンチパターン
  /// const修飾子が使えるパターンがあれば、それを採用するべき
  ///
  /// 以下のContainerウィジェットはconstantコンストラクタを持っていないので
  /// 同様の実装ができ、かつ、constantコンストラクタを持っているColoredBoxウィジェットを使うべき
  ///
  /// ただし、以下のベストプラクティスを実装すると、コンパイル時定数と実行時定数が混在している（コンストラクタはコンパイル時定数、childは実行時定数）ので、エラーになる
  /// なので、こだわりすぎるのもダメ
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: child,
    );

    /// ベストプラクティス
    // return const ColoredBox(
    //   color: Colors.red,
    //   child: child,
    // );
  }
}

class B extends StatelessWidget {
  const B({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: child,
    );
  }
}

class C extends StatelessWidget {
  const C({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: child,
    );
  }
}
