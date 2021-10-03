# Matlab 绘图后处理

实现图片标注、字体字号调整、图片宽度设置，导出pdf等功能

## 类属性

`color`: 自定义颜色表, 已预定义8种颜色, 低版本 Matlab 用此画图更美观

```matlab
plot(x, y, 'color', FIG.color(n,:))
```

其中 n=1:8

## 类方法

### 方法 1 —— 设置图片的宽度、宽高比、文字大小等

```matlab
FIG.figSetting(fig, width, ratio, 'FontSize', 10, 'FontSizeIn',10, 'Journal', 'acess', 'Interpreter', 'latex')
```

- `fig`(必选): 图片句柄, 当前图片可用 gcf 传入
- `width`(可选): 图像宽度/cm，默认 8
- `ratio`(可选): 图像高宽比，默认 0.75, 即默认高度 6cm
- `FontSize`(可选, name-value,下同): 坐标轴标注文字字号大小，默认10.5/五号
- `FontSizeIn`: 图内文字字号大小，默认10.5/五号
- `Journal`: 内置期刊名，提前定义好图片尺寸、图片文字的字体字号，目前只定义了`acess`,`mythesis`
- `Interpreter`：解析器，默认 `tex`, 有较复杂数学表达式时，需用 `latex`

### 方法 2 —— 保存图片为 pdf

```matlab
FIG.savepdf(fig, filename, filepath)
```

- `fig`: 图片句柄
- `filename`(可选参数): 保存文件名字符串，默认为 `MySavedFile`
- `filepath`(可选参数): 保存文件的路径，默认为系统桌面
