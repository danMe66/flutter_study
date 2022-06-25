# 包装小部件

默认情况下，一行或一列在其主轴上占据尽可能多的空间，但如果想将子项紧密地打包在一起，

可以将其设置 mainAxisSize 为 MainAxisSize.main 。如下：

![Row of 5 stars, packed together in the middle of the row](https://cdn.jsdelivr.net/gh/DanielL916/images-warehouse@main/uPic/packed.png)

```dart
Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    Icon(Icons.star, color: Colors.green[500]),
    Icon(Icons.star, color: Colors.green[500]),
    Icon(Icons.star, color: Colors.green[500]),
    const Icon(Icons.star, color: Colors.black),
    const Icon(Icons.star, color: Colors.black),
  ],
)
```
