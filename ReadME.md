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

    

