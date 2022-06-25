import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: Center(child: starRow()),
      ),
    );
  }

  Widget starRow() => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star, color: Colors.green[500]),
          Icon(Icons.star, color: Colors.green[500]),
          Icon(Icons.star, color: Colors.green[500]),
          const Icon(Icons.star, color: Colors.black),
          const Icon(Icons.star, color: Colors.black),
        ],
      );
}
