# 在页面上添加布局小组件

Flutter 应用程序本身就是一个小部件，大部分小部件都有一个 build() 方法。

在应用程序中，build() 方法会实例化返回小部件，并且显示小部件。

## Material apps

在 Material 应用程序中，可以使用 Scaffold 小部件，这个小部件提供默认的横幅、背景颜色等。

```dart
return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
```

默认情况下，非 Material 应用不包含 AppBar、标题或背景颜色。如果需要在非 Material 应用中使用这些功能，那么必须自己构建实现。
