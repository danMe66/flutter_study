# 把这一切放在一起 - 2

这是一个存储可变状态的示例父小部件：

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
      title: Text(
        product.name,
        style: _getTextStyle(context),
      ),
    );
  }
}

class ShoppingList extends StatefulWidget {
  const ShoppingList({required this.products, super.key});

  final List<Product> products;

  // The framework calls createState the first time
  // a widget appears at a given location in the tree.
  // If the parent rebuilds and uses the same type of
  // widget (with the same key), the framework re-uses
  // the State object instead of creating a new State object.

  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  final _shoppingCart = <Product>{};

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      // When a user changes what's in the cart, you need
      // to change _shoppingCart inside a setState call to
      // trigger a rebuild.
      // The framework then calls build, below,
      // which updates the visual appearance of the app.

      if (!inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((product) {
          return ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged,
          );
        }).toList(),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    title: 'Shopping App',
    home: ShoppingList(
      products: [
        Product(name: 'Eggs'),
        Product(name: 'Flour'),
        Product(name: 'Chocolate chips'),
      ],
    ),
  ));
}
```

`ShoppingList`类 extends ，这[`StatefulWidget`](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)意味着这个小部件存储可变状态。当`ShoppingList`小部件第一次插入树中时，框架调用该[`createState()`](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html#createState)函数来创建一个新的实例`_ShoppingListState`以与树中的该位置相关联。（请注意， 的子类 [`State`](https://api.flutter.dev/flutter/widgets/State-class.html)通常以前导下划线命名，以表明它们是私有实现细节。）当这个小部件的父级重建时，父级会创建一个 的新实例`ShoppingList`，但框架会重用`_ShoppingListState` 已经在树中的实例而不是调用 `createState`再次。

要访问 current`ShoppingList`的属性，`_ShoppingListState`可以使用其[`widget`](https://api.flutter.dev/flutter/widgets/Widget-class.html)属性。如果父级重建并创建一个新`ShoppingList`的 ，则`_ShoppingListState`使用新的小部件值进行重建。如果您希望在`widget`属性更改时收到通知，请覆盖该[`didUpdateWidget()`](https://api.flutter.dev/flutter/widgets/State-class.html#didUpdateWidget)函数，该函数会传递一个`oldWidget`以让您将旧小部件与当前小部件进行比较。

处理`onCartChanged`回调时，`_ShoppingListState` 通过添加或删除产品来改变其内部状态 `_shoppingCart`。为了向框架发出它改变了其内部状态的信号，它将这些调用包装在一个[`setState()`](https://api.flutter.dev/flutter/widgets/State/setState.html)调用中。调用`setState`会将这个小部件标记为脏，并安排在下次您的应用需要更新屏幕时重新构建它。如果您在修改小部件的内部状态时忘记调用`setState`，框架将不会知道您的小部件是脏的，并且可能不会调用小部件的[`build()`](https://api.flutter.dev/flutter/widgets/StatelessWidget/build.html)函数，这意味着用户界面可能不会更新以反映更改的状态。通过以这种方式管理状态，您无需编写单独的代码来创建和更新子小部件。相反，您只需实现`build` 函数，它处理这两种情况。