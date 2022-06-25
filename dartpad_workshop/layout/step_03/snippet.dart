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
        body: Center(child: buildRow()),
        // body: Center(child: buildColumn()),
      ),
    );
  }

  Widget buildRow() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              child: Image.asset(
                  'https://cdn.jsdelivr.net/gh/DanielL916/images-warehouse@main/uPic/pic1.jpeg')),
          Expanded(
              flex: 2,
              child: Image.asset(
                  'https://cdn.jsdelivr.net/gh/DanielL916/images-warehouse@main/uPic/pic2.jpeg')),
          Expanded(
              child: Image.asset(
                  'https://cdn.jsdelivr.net/gh/DanielL916/images-warehouse@main/uPic/pic3.jpeg')),
        ],
      );

  Widget buildColumn() => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
              'https://cdn.jsdelivr.net/gh/DanielL916/images-warehouse@main/uPic/pic1.jpeg'),
          Image.asset(
              'https://cdn.jsdelivr.net/gh/DanielL916/images-warehouse@main/uPic/pic2.jpeg'),
          Image.asset(
              'https://cdn.jsdelivr.net/gh/DanielL916/images-warehouse@main/uPic/pic3.jpeg'),
        ],
      );
}
