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


    

