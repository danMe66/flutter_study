# 对齐小部件

mainAxisAlignment您可以使用和crossAxisAlignment属性控制行或列如何对齐其子级 。对于一行，主轴水平运行，交叉轴垂直运行。对于列，主轴垂直运行，横轴水平运行。

![显示一行的主轴和交叉轴的图表](https://docs.flutter.dev/assets/images/docs/ui/layout/row-diagram.png)

枚举提供了多种用于控制对齐的常量 MainAxisAlignment、CrossAxisAlignment

## 横向布局显示

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Image.asset('images/pic1.jpg'),
    Image.asset('images/pic2.jpg'),
    Image.asset('images/pic3.jpg'),
  ],
);
```

![Row with 3 evenly spaced images](https://cdn.jsdelivr.net/gh/DanielL916/images-warehouse@main/uPic/row-spaceevenly-visual.png)

## 纵向布局显示

```dart
Column(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Image.asset('images/pic1.jpg'),
    Image.asset('images/pic2.jpg'),
    Image.asset('images/pic3.jpg'),
  ],
);
```

![Column showing 3 images spaced evenly](https://cdn.jsdelivr.net/gh/DanielL916/images-warehouse@main/uPic/column-visual.png)

## 调整小部件大小

布局太大而无法容纳设备时，沿受影响的边缘会出现黄色和黑色条纹图案。这是一个太宽的行的[示例：](https://github.com/flutter/website/tree/main/examples/layout/sizing)

![过宽的行](https://cdn.jsdelivr.net/gh/DanielL916/images-warehouse@main/uPic/layout-too-large.png)

可以使用小部件调整小部件的大小以适应行或列 [`Expanded`](https://api.flutter.dev/flutter/widgets/Expanded-class.html)。要修复前面的示例，即图像行对于其渲染框来说太宽，请使用`Expanded`小部件包装每个图像。

```dart
Row(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Expanded(
      child: Image.asset('images/pic1.jpg'),
    ),
    Expanded(
      child: Image.asset('images/pic2.jpg'),
    ),
    Expanded(
      child: Image.asset('images/pic3.jpg'),
    ),
  ],
);
```

![Row of 3 images that are too wide, but each is constrained to take only 1/3 of the space](https://cdn.jsdelivr.net/gh/DanielL916/images-warehouse@main/uPic/row-expanded-2-visual-20220625103908599.png)

还可以调整中间图片的大小：

```dart
Row(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Expanded(
      child: Image.asset('images/pic1.jpg'),
    ),
    Expanded(
      flex: 2,
      child: Image.asset('images/pic2.jpg'),
    ),
    Expanded(
      child: Image.asset('images/pic3.jpg'),
    ),
  ],
);
```

![Row of 3 images with the middle image twice as wide as the others](https://docs.flutter.dev/assets/images/docs/ui/layout/row-expanded-visual.png)