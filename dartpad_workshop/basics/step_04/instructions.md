# 更改小部件以响应输入

到目前为止，这个页面只使用了无状态的小部件。无状态小部件从其父小部件接收参数，并将其存储在[`final`](https://dart.dev/guides/language/language-tour#final-and-const)成员变量中。当一个小部件被要求时[`build()`](https://api.flutter.dev/flutter/widgets/StatelessWidget/build.html)，它使用这些存储的值来为它创建的小部件派生新的参数。

为了构建更复杂的体验——例如，以更有趣的方式对用户输入做出反应——应用程序通常带有一些状态。Flutter`StatefulWidgets`用来捕捉这个想法。`StatefulWidgets`是知道如何生成 `State`对象的特殊小部件，然后用于保存状态。考虑这个基本示例，使用[`ElevatedButton`](https://api.flutter.dev/flutter/material/ElevatedButton-class.html)前面提到的：

您可能想知道为什么`StatefulWidget`和`State`是单独的对象。在 Flutter 中，这两种类型的对象具有不同的生命周期。 `Widgets`是临时对象，用于构建应用程序当前状态的表示。`State`另一方面，对象在对 的调用之间是持久的 `build()`，允许它们记住信息。

上面的示例接受用户输入并直接在其`build()`方法中使用结果。在更复杂的应用程序中，小部件层次结构的不同部分可能负责不同的关注点；例如，一个小部件可能会呈现一个复杂的用户界面，目的是收集特定信息，例如日期或位置，而另一个小部件可能会使用该信息来更改整体呈现方式。

在 Flutter 中，更改通知通过回调的方式“向上”流向小部件层次结构，而当前状态“向下”流向进行演示的无状态小部件。重定向此流的共同父级是`State`. 下面稍微复杂一点的例子展示了它在实践中是如何工作的：

点击 **Show Solution** 按钮 即可运行
