# 把这一切放在一起 - 1

下面是一个将这些概念结合在一起的更完整示例： 一个假设的购物应用程序显示出售的各种产品，并维护一个购物车以供预期购买。首先定义表示类， `ShoppingListItem`：

```dart
import 'package:flutter/material.dart';

class Product {
  const Product({required this.name});

  final String name;
}

typedef CartChangedCallback = Function(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({
    required this.product,
    required this.inCart,
    required this.onCartChanged,
  }) : super(key: ObjectKey(product));

  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  Color _getColor(BuildContext context) {
    // The theme depends on the BuildContext because different
    // parts of the tree can have different themes.
    // The BuildContext indicates where the build is
    // taking place and therefore which theme to use.

    return inCart //
        ? Colors.black54
        : Theme.of(context).primaryColor;
  }

  TextStyle? _getTextStyle(BuildContext context) {
    if (!inCart) return null;

    return const TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onCartChanged(product, inCart);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
      ),
      title: Text(product.name, style: _getTextStyle(context)),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: ShoppingListItem(
            product: const Product(name: 'Chips'),
            inCart: true,
            onCartChanged: (product, inCart) {},
          ),
        ),
      ),
    ),
  );
}
```

小`ShoppingListItem`部件遵循无状态小部件的通用模式。它将在其构造函数中接收到的值存储在[`final`](https://dart.dev/guides/language/language-tour#final-and-const)成员变量中，然后在其[`build()`](https://api.flutter.dev/flutter/widgets/StatelessWidget/build.html)函数中使用。例如，`inCart`布尔值在两种视觉外观之间切换：一种使用当前主题的原色，另一种使用灰色。

当用户点击列表项时，小部件不会`inCart`直接修改其值。相反，小部件调用 `onCartChanged`它从其父小部件接收到的函数。此模式允许您将状态存储在小部件层次结构中的更高位置，从而导致状态持续更长的时间。在极端情况下，存储在传递给的小部件上的状态 [`runApp()`](https://api.flutter.dev/flutter/widgets/runApp.html)会在应用程序的生命周期内持续存在。

当父级收到`onCartChanged`回调时，父级会更新其内部状态，这会触发父级重建并创建具有`ShoppingListItem`新`inCart`值的新实例。尽管父级在重建时创建了一个新实例， `ShoppingListItem`但该操作很便宜，因为框架会将新构建的小部件与先前构建的小部件进行比较，并且仅将差异应用于底层 [`RenderObject`](https://api.flutter.dev/flutter/rendering/RenderObject-class.html).