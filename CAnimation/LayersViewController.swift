//
//  LayersViewController.swift
//  CAnimation
//
//  Created by yrion on 2020/4/10.
//  Copyright © 2020 yrion. All rights reserved.
//

import UIKit

class LayersViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
//        drawShapeLayer()
//        drawCorner()
//        drawGradientLayer()
        drawReplicatorLayer()
    }
    
    func drawReplicatorLayer() {
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.frame = containerView.bounds
        containerView.layer.addSublayer(replicatorLayer)
        replicatorLayer.instanceCount = 10
        
        var transform = CATransform3DIdentity
        transform  = CATransform3DTranslate(transform, 0, 40, 0)
        transform = CATransform3DRotate(transform, CGFloat.pi / 5.0, 0, 0, 1)
        transform = CATransform3DTranslate(transform, 0, -40, 0)
        
        replicatorLayer.instanceTransform = transform
        
        replicatorLayer.instanceBlueOffset = -0.1
        replicatorLayer.instanceGreenOffset = -0.1
        
        replicatorLayer.instanceDelay = 1.5 / 10
        
        let subLayer = CALayer()
        subLayer.backgroundColor = UIColor.yellow.cgColor
        subLayer.frame = CGRect(x: 165, y: 30, width: 30, height: 30)
        replicatorLayer.addSublayer(subLayer)
        
        let duration = 1.5

        let shrink = CABasicAnimation(keyPath:"transform.scale")
        shrink.fromValue = 1.0
        shrink.toValue = 0.1
        shrink.duration = duration
        shrink.repeatCount = Float.infinity
        subLayer.add(shrink, forKey: nil)
        
        subLayer.transform = CATransform3DMakeScale(0.01, 0.01, 0.01)
        
    }
    
    func drawGradientLayer() {
        let layer = CAGradientLayer()
        layer.frame = containerView.bounds
        containerView.layer.addSublayer(layer)
        
        // 默认均匀渲染
        layer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
        // 通过location来调整属性空间
        layer.locations = [0.0, 0.5]
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x: 1, y: 1)
    }
    
    func drawCorner() {
        let path = UIBezierPath.init(roundedRect: containerView.bounds, byRoundingCorners: UIRectCorner.bottomRight.union(UIRectCorner.bottomLeft).union(.topLeft), cornerRadii: CGSize(width: 20, height: 20))
        
        let cornerLayer = CAShapeLayer()
        cornerLayer.path = path.cgPath
        cornerLayer.strokeColor = UIColor.lightGray.cgColor
        cornerLayer.fillColor = UIColor.clear.cgColor
        containerView.layer.addSublayer(cornerLayer)
    }
    
    func drawShapeLayer() {
        let path = UIBezierPath.init()
        path.move(to: CGPoint(x: 190, y: 50))
        
        path.addArc(withCenter: CGPoint(x: 175, y: 50), radius: 15, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        
        path.move(to: CGPoint(x: 175, y: 65))
        path.addLine(to: CGPoint(x: 175, y: 110))
        path.addLine(to: CGPoint(x: 150, y: 165))
        
        path.move(to: CGPoint(x: 150, y: 80))
        path.addLine(to: CGPoint(x: 205, y: 80))
        
        path.move(to: CGPoint(x: 175, y: 110))
        path.addLine(to: CGPoint(x: 200, y: 166))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 5
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.path = path.cgPath
        self.containerView.layer.addSublayer(shapeLayer)
    }

}
