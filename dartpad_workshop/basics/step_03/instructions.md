# 处理手势

大多数应用程序包括某种形式的用户与系统的交互。构建交互式应用程序的第一步是检测输入手势。通过创建一个简单的按钮来了解它是如何工作的：

```dart
class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('MyButton was tapped!');
      },
      child: Container(
        height: 50.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: const Center(
          child: Text('Engage'),
        ),
      ),
    );
  }
}
```

该[`GestureDetector`](https://api.flutter.dev/flutter/widgets/GestureDetector-class.html)小部件没有视觉表示，而是检测用户做出的手势。当用户点击 时[`Container`](https://api.flutter.dev/flutter/widgets/Container-class.html)，`GestureDetector`调用它的[`onTap()`](https://api.flutter.dev/flutter/widgets/GestureDetector-class.html#onTap)回调，在这种情况下将消息打印到控制台。您可以使用它 `GestureDetector`来检测各种输入手势，包括点击、拖动和缩放。

许多小部件使用 a[`GestureDetector`](https://api.flutter.dev/flutter/widgets/GestureDetector-class.html)为其他小部件提供可选的回调。例如， [`IconButton`](https://api.flutter.dev/flutter/material/IconButton-class.html)、[`ElevatedButton`](https://api.flutter.dev/flutter/material/ElevatedButton-class.html)和 [`FloatingActionButton`](https://api.flutter.dev/flutter/material/FloatingActionButton-class.html)小部件具有[`onPressed()`](https://api.flutter.dev/flutter/material/ElevatedButton-class.html#onPressed) 在用户点击小部件时触发的回调。

有关更多信息，请参阅[Flutter 中的手势](https://docs.flutter.dev/development/ui/advanced/gestures)。