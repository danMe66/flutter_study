# 垂直和水平布局多个小部件

最常见的布局模式之一是垂直或者水平排列小部件。

我们可以使用 Row 小部件水平排列小部件，并使用 Column 小部件垂直排列小部件。

## 重点说明：

> Row 和 Cloumn 是最常用的两种布局模式。
>
> Row 每个都有 Column 一个子小部件列表。
>
> 子小部件本身可以是 Row、Column 或其他复杂的小部件。
>
> 你可以指定 Row 或者 Column 垂直和水平对齐其子级别。
>
> 你可以拉伸或约束特定的子小部件。
>
> 可以指定子小部件如何使用`Row` 或 `Column` 的可用空间。

此布局组织为`Row`. 该行包含两个子项：左侧的列和右侧的图像：

![mzU8dA](https://cdn.jsdelivr.net/gh/DanielL916/images-warehouse@main/uPic/mzU8dA.jpg)

左列的小部件树嵌套行和列。

![RtevE9](https://cdn.jsdelivr.net/gh/DanielL916/images-warehouse@main/uPic/RtevE9.jpg)
