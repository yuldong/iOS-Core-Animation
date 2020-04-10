//
//  ReadME.md
//  CAnimation
//
//  Created by yrion on 2020/4/3.
//  Copyright © 2020 yrion. All rights reserved.
//

## CALayer知识点

### 基础与概念
- Mac OS 与 iOS 的Y轴坐标是颠倒的的
- 点击事件的处理由视图在父视图中的顺序决定的
- 视图、图层的frame本质都是anchorPoint控制positon得到的
- cornerRadius作用于自身，不作用于子视图
- border位于图层最上方，不考虑子视图
- shadow 考虑子视图
- mask图层定义了父图层的部分可见区域
- shouldRasterize 可以解决父视图透明度受子视图影响的问题
- UIView通过设置transform属性做变换本质是封装了内部图层的变换
- 3D变换矩阵中的m34用来计算离视角的距离；灭点？？
    - sublayerTransform 对容器做3D变换以反馈到整个子图层
    - isDoubleSided 控制图层背面的绘制
    - 尽管Core Animation图层存在于3D空间之内，但它们并不都存在同一个3D空间;你不能够使用图层树去创建一个3D结构的层级关系--在相同场景下的任何3D表面必须和同样的图层保持一致，这是因为每个的父视图都把它的子视图扁平化了。
    
### 图层
#### CAShaperLayer
- 硬件加速
- 高效使用内存

#### CATextLayer
- uilabel的替换品
    
### 动画
- 动画执行的时间取决于当前事务的设置，动画类型取决于图层行为。
```
Core Animation在每个run loop周期中自动开始一次新的事务（run loop是iOS负责收集用户输入，
处理定时器或者网络事件并且重新绘制屏幕的东西），
即使你不显式的用[CATransaction begin]开始一次事务，
任何在一次run loop循环中属性的改变都会被集中起来，然后做一次0.25秒的动画。
```
- UIView 默认禁用隐式动画，通过`-actionForLayer:forKey`返回nil实现
```
1、图层首先检测它是否有委托，并且是否实现CALayerDelegate协议指定的-actionForLayer:forKey方法。
如果有，直接调用并返回结果。
2、如果没有委托，或者委托没有实现-actionForLayer:forKey方法，图层接着检查包含属性名称对应行为映射的actions字典。
3、如果actions字典没有包含对应的属性，那么图层接着在它的style字典接着搜索属性名。
4、最后，如果在style里面也找不到对应的行为，那么图层将会直接调用定义了每个属性的标准行为的-defaultActionForKey:方法。
```
- 图层树(model Layer)与呈现树(presentation Layer)
**大多数情况下，你不需要直接访问呈现图层，你可以通过和模型图层的交互，来让Core Animation更新显示。两种情况下呈现图层会变得很有用，一个是同步动画，一个是处理用户交互。**
    - 如果你在实现一个基于定时器的动画（见第11章“基于定时器的动画”），而不仅仅是基于事务的动画，
    这个时候准确地知道在某一时刻图层显示在什么位置就会对正确摆放图层很有用了。
    - 如果你想让你做动画的图层响应用户输入，
    你可以使用-hitTest:方法（见第三章“图层几何学”）来判断指定图层是否被触摸，
    这时候对呈现图层而不是模型图层调用-hitTest:会显得更有意义，
    因为呈现图层代表了用户当前看到的图层位置，而不是当前动画结束之后的位置。

- CAAnimationDelegate 代理方法不能更改参数类型，否则不触发
```
当更新属性的时候，我们需要设置一个新的事务，并且禁用图层行为。
否则动画会发生两次，一个是因为显式的CAAnimation，另一次是因为隐式动画
```
- 判断动画对应的图层的方案
```
1 、open func add(_ anim: CAAnimation, forKey key: String?), 通过key判断
2、CAAnimation实现了KVC（键-值-编码）协议，可以用-setValue:forKey:和-valueForKey:方法来存取属性。
但是CAAnimation有一个不同的性能：它更像一个NSDictionary。
可以让你随意设置键值对，即使和你使用的动画类所声明的属性并不匹配。
```
- 属性动画实际上是针对于关键路径而不是一个键, 这就意味着可以对子属性甚至是虚拟属性做动画
- 特殊的过渡动画: CATransition `与属性动画不同的是，对指定的图层一次只能使用一次CATransition`
```
1、CATransition并不作用于指定的图层属性
2、过渡动画的另类实现: 对原始的图层外观截图，
然后添加一段动画，平滑过渡到图层改变之后那个截图的效果
```

### 性能调优
**动画和屏幕上组合的图层实际上被一个单独的进程管理，而不是你的应用程序。
这个进程就是所谓的渲染服务。在iOS5和之前的版本是SpringBoard进程（同时管理着iOS的主屏）。
在iOS6之后的版本中叫做BackBoard。**

- 动画被分离的几大阶段
```
> 应用程序程序内
1、布局 - 这是准备你的视图/图层的层级关系，以及设置图层属性（位置，背景色，边框等等）的阶段。
2、显示 - 这是图层的寄宿图片被绘制的阶段。
绘制有可能涉及你的-drawRect:和-drawLayer:inContext:方法的调用路径。
3、准备 - 这是Core Animation准备发送动画数据到渲染服务的阶段。
这同时也是Core Animation将要执行一些别的事务例如解码动画过程中将要显示的图片的时间点。
4、提交 - 这是最后的阶段，Core Animation打包所有图层和动画属性，
然后通过IPC（内部处理通信）发送到渲染服务进行显示。
> 渲染服务
5、对所有的图层属性计算中间值，设置OpenGL几何形状（纹理化的三角形）来执行渲染
6、在屏幕上渲染可见的三角形
```




    

