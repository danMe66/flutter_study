# 嵌套行和列

布局框架允许您根据需要将行和列嵌套在行和列中。让我们看一下以下布局的概述部分的代码：

![pavlova 应用程序的屏幕截图，评级和图标行以红色标出](https://cdn.jsdelivr.net/gh/DanielL916/images-warehouse@main/uPic/pavlova-large-annotated.png)

概述的部分实现为两行。评分行包含五颗星和评论数。图标行包含三列图标和文本。

评分行的小部件树：

![评分行小部件树](https://cdn.jsdelivr.net/gh/DanielL916/images-warehouse@main/uPic/widget-tree-pavlova-rating-row.png)

该`ratings`变量创建一行，其中包含一小行 5 星图标和文本：

```dart
var stars = Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    Icon(Icons.star, color: Colors.green[500]),
    Icon(Icons.star, color: Colors.green[500]),
    Icon(Icons.star, color: Colors.green[500]),
    const Icon(Icons.star, color: Colors.black),
    const Icon(Icons.star, color: Colors.black),
  ],
);

final ratings = Container(
  padding: const EdgeInsets.all(20),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      stars,
      const Text(
        '170 Reviews',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w800,
          fontFamily: 'Roboto',
          letterSpacing: 0.5,
          fontSize: 20,
        ),
      ),
    ],
  ),
);
```

评级行下方的图标行包含 3 列；每列包含一个图标和两行文本，如您在其小部件树中所见：

![Icon widget tree](https://cdn.jsdelivr.net/gh/DanielL916/images-warehouse@main/uPic/widget-tree-pavlova-icon-row.png)

点击 **Show Solution** 按钮 即可运行