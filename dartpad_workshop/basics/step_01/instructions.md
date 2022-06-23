# Basic widgets：基础组件

runApp()函数接受给定Widiget，并且使其成为小部件树的根

## 代码示例

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    const Center(
      child: Text(
        'Hello, world!',
        textDirection: TextDirection.ltr,
      ),
    ),
  );
}
```

在此示例中，小部件树由两个小部件组成：

- 小Center 部件
- Text 小部件

框架强制根小部件覆盖屏幕，这意味着 Text小部件 的文本 “Hello，world”最终位于屏幕中心。 

## Flutter 自带了一套功能强大的基础小部件，其中常用的有以下几种：

- Text：Text 小部件允许在应用程序中创建一系列样式化的文本。
- Row、Column：flex 小部件可以在水平（Row）和垂直（Column）方向上创建灵活的布局。
- Stack：小部件不是线性定向（水平或者垂直），而是 Stack 让绘制顺序将小部件放置于彼此之上。然后，可以使用 A 的 Positioned 子级上的小部件 Stack 来相对于堆栈的顶部、右侧、底部或左侧边缘定位它们。Stacks 基于 web 的绝对布局模型。
- Container：Containers 小部件可以创建一个矩形视觉元素。容器可以用 装饰 BoxDecoration ，例如背景、边框或阴影。一个 Container 还可以对其大小、边距、填充和约束。此外，一个 Container 可以使用矩阵在三维空间中进行变换。

下面是一些简单的小部件，它们结合了这些小部件和其他小部件：

```dart
// Basic widgets：基础组件
class MyAppBar extends StatelessWidget {
  final Widget title;
  const MyAppBar({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: Colors.blue[500]),
      child: Row(
        children: [
          const IconButton(
            onPressed: null,
            icon: Icon(Icons.menu),
            tooltip: 'Nav menu',
          ),
          Expanded(child: title),
          const IconButton(
            onPressed: null,
            icon: Icon(Icons.search),
            tooltip: 'Search',
          ),
        ],
      ),
    );
  }
}
```

点击 **Show Solution** 按钮 即可运行

许多 Material Design 小部件需要在 MaterialApp`](https://api.flutter.dev/flutter/material/MaterialApp-class.html) 中才能正确显示，以便继承主题数据。因此，使用`MaterialApp`.

该`MyAppBar`小部件创建一个[`Container`](https://api.flutter.dev/flutter/widgets/Container-class.html)高度为 56 个与设备无关的像素，内部填充为 8 个像素的左侧和右侧。在容器内部， `MyAppBar`使用[`Row`](https://api.flutter.dev/flutter/widgets/Row-class.html)布局来组织其子项。中间的孩子，`title`小部件，被标记为[`Expanded`](https://api.flutter.dev/flutter/widgets/Expanded-class.html)，这意味着它会扩展以填充其他孩子尚未使用的任何剩余可用空间。您可以有多个孩子，并使用参数来`Expanded`确定它们消耗可用空间的比率 。[`flex`](https://api.flutter.dev/flutter/widgets/Expanded-class.html#flex)`Expanded`

小`MyScaffold`部件将其子级组织在一个垂直列中。在列的顶部，它放置一个 的实例`MyAppBar`，向应用栏传递一个[`Text`](https://api.flutter.dev/flutter/widgets/Text-class.html)小部件以用作其标题。将小部件作为参数传递给其他小部件是一种强大的技术，可让您创建可以以多种方式重用的通用小部件。最后，`MyScaffold`使用 an [`Expanded`](https://api.flutter.dev/flutter/widgets/Expanded-class.html)用它的主体填充剩余的空间，它由一个居中的消息组成。

有关详细信息，请参阅[布局](https://docs.flutter.dev/development/ui/widgets/layout)。

确保在文件的 部分中有一个`uses-material-design: true`条目。它允许您使用预定义的[材料图标](https://design.google.com/icons/)集。如果您使用的是材料库，通常最好包含此行。`flutter``pubspec.yaml`

```dart
name: my_app
flutter:
  uses-material-design: true
```
