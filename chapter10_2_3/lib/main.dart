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

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: child,
    );
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
