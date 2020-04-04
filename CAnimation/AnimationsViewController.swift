//
//  AnimationsViewController.swift
//  CAnimation
//
//  Created by yrion on 2020/4/3.
//  Copyright © 2020 yrion. All rights reserved.
//

import UIKit

class AnimationsViewController: UIViewController {
    
    @IBOutlet weak var layerView: UIView!
    
    @IBOutlet weak var imgView: UIImageView!
    
    var ballImgView: UIImageView!
    
    var colorLayer: CALayer!
    
    var shipLayer: CALayer!
    
    let imgs = [UIImage(named: "flower"), UIImage(named: "snowman"), UIImage(named: "ship")]
    
    let mediaTimeNames: [CAMediaTimingFunctionName] = [.easeIn, .easeInEaseOut, .easeOut, .linear, .default]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        setUp()
        //        setUp2()
        //        setUpBasicCA()
        //        shipLayer = CALayer()
        //        shipLayer.frame = CGRect(x: 0, y: 0, width: 64, height: 64)
        //        shipLayer.position = CGPoint(x: 0, y: 150)
        //        shipLayer.contents = UIImage(named: "ship")?.cgImage
        //        shipLayer.contentsGravity = CALayerContentsGravity.resizeAspect
        //        layerView.layer.addSublayer(shipLayer)
        
        ballImgView = UIImageView(image: UIImage(named: "ball"))
        self.layerView.addSubview(ballImgView)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //        let point = touches.first!.location(in: view)
        //        if (colorLayer.presentation()?.hitTest(point)) != nil {
        //            let red = CGFloat(arc4random()) / CGFloat(Int32.max)
        //            let green = CGFloat(arc4random()) / CGFloat(Int32.max)
        //            let blue = CGFloat(arc4random()) / CGFloat(Int32.max)
        //            colorLayer.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1).cgColor
        //        } else {
        //            CATransaction.begin()
        //            CATransaction.setAnimationDuration(4.0)
        //            colorLayer.position = point
        //            CATransaction.commit()
        //        }
    }
    
    @IBAction func changerColor() {
        //        setUp_func()
        //        setUpBasicCA_func()
        //        setUpKeyCA()
        //        setUpCATransition()
        //        customTransition()
        //        drawMediaFunction()
        ballJumps()
    }
    
    @IBAction func start() {
        let animation = CABasicAnimation()
        animation.keyPath = "transform.rotation"
        animation.duration = 2
        animation.byValue = CGFloat.pi / 2
        animation.delegate = self
        shipLayer.add(animation, forKey: "rotateAnimation")
    }
    
    @IBAction func stop() {
        shipLayer.removeAnimation(forKey: "rotateAnimation")
    }
    
    func setUp_func() {
        CATransaction.begin()
        CATransaction.setAnimationDuration(2.0)
        CATransaction.setCompletionBlock {
            var transform = self.colorLayer.affineTransform()
            transform = transform.rotated(by: CGFloat.pi / 2)
            self.colorLayer.setAffineTransform(transform)
        }
        let red = CGFloat(arc4random()) / CGFloat(Int32.max)
        let green = CGFloat(arc4random()) / CGFloat(Int32.max)
        let blue = CGFloat(arc4random()) / CGFloat(Int32.max)
        colorLayer.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1).cgColor
        CATransaction.commit()
    }
    
    func setUpBasicCA_func() {
        let red = CGFloat(arc4random()) / CGFloat(Int32.max)
        let green = CGFloat(arc4random()) / CGFloat(Int32.max)
        let blue = CGFloat(arc4random()) / CGFloat(Int32.max)
        
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
        let animation = CABasicAnimation()
        animation.keyPath = "backgroundColor"
        animation.toValue = color.cgColor
        animation.delegate = self
        animation.duration = 2
        colorLayer.add(animation, forKey: nil)
        
    }
    
    func setUpKeyCA() {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "backgroundColor"
        animation.duration = 4.0
        // 需要开始和结束的关键帧来匹配当前属性的值
        animation.values = [UIColor.blue.cgColor,
                            UIColor.red.cgColor,
                            UIColor.green.cgColor,
                            UIColor.blue.cgColor]
        // 缓冲函数
        let funcs = CAMediaTimingFunction.init(name: .easeIn)
        animation.timingFunctions = [funcs, funcs, funcs]
        colorLayer.add(animation, forKey: nil)
        //        let path = UIBezierPath.init()
        //        path.move(to: CGPoint(x: 0, y: 150))
        //        path.addCurve(to: CGPoint(x: 300, y: 150), controlPoint1: CGPoint(x: 75, y: 0), controlPoint2: CGPoint(x: 225, y: 300))
        //
        //        let shapeLayer = CAShapeLayer()
        //        shapeLayer.path = path.cgPath
        //        shapeLayer.strokeColor = UIColor.red.cgColor
        //        shapeLayer.fillColor = UIColor.clear.cgColor
        //        shapeLayer.lineWidth = 3.0
        //        layerView.layer.addSublayer(shapeLayer)
        //
        //        let shipLayer = CALayer()
        //        shipLayer.frame = CGRect(x: 0, y: 0, width: 64, height: 64)
        //        shipLayer.position = CGPoint(x: 0, y: 150)
        //        shipLayer.contents = UIImage(named: "ship")?.cgImage
        //        shipLayer.contentsGravity = CALayerContentsGravity.resizeAspect
        //        layerView.layer.addSublayer(shipLayer)
        //
        //        let animation = CAKeyframeAnimation()
        //        animation.keyPath = "position"
        //        animation.path = path.cgPath
        //        animation.duration = 4.0
        //        animation.rotationMode = CAAnimationRotationMode.rotateAuto
        //        shipLayer.add(animation, forKey: nil)
    }
    
    func setUp() {
        colorLayer = CALayer()
        colorLayer.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        colorLayer.backgroundColor = UIColor.blue.cgColor
        let transition = CATransition()
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        colorLayer.actions = ["backgroundColor": transition]
        
        layerView.layer.addSublayer(colorLayer)
    }
    
    func setUp2() {
        colorLayer = CALayer()
        colorLayer.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        colorLayer.backgroundColor = UIColor.red.cgColor
        colorLayer.position = CGPoint(x: view.bounds.size.width / 2, y: view.bounds.size.height / 2)
        view.layer.addSublayer(colorLayer)
    }
    
    func setUpBasicCA() {
        colorLayer = CALayer()
        colorLayer.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        colorLayer.backgroundColor = UIColor.blue.cgColor
        layerView.layer.addSublayer(colorLayer)
    }
    
    func setUpCATransition() {
        // 自定义
        //        let transition = CATransition()
        //        transition.type = CATransitionType.reveal
        //        transition.duration = 2.0
        //        imgView.layer.add(transition, forKey: nil)
        //
        //        let currentImg = imgView.image
        //        var index = imgs.firstIndex(of: currentImg) ?? 0
        //        index = (index + 1) % imgs.count
        //        let img = imgs[index]
        //        imgView.image = img
        // UIView
        UIView.transition(with: imgView, duration: 2.0, options: .transitionFlipFromLeft, animations: {
            let currentImg = self.imgView.image
            var index = self.imgs.firstIndex(of: currentImg) ?? 0
            index = (index + 1) % self.imgs.count
            let img = self.imgs[index]
            self.imgView.image = img
        }) { (com) in
            
        }
    }
    
    func customTransition() {
        UIGraphicsBeginImageContextWithOptions(layerView.bounds.size, true, 0.0)
        layerView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        
        let imgV = UIImageView.init(image: img)
        imgV.frame = layerView.bounds
        layerView.addSubview(imgV)
        
        let red = CGFloat(arc4random()) / CGFloat(Int32.max)
        let green = CGFloat(arc4random()) / CGFloat(Int32.max)
        let blue = CGFloat(arc4random()) / CGFloat(Int32.max)
        layerView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
        
        UIView.animate(withDuration: 1.0, animations: {
            var transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            transform = transform.rotated(by: CGFloat.pi / 4)
            imgV.transform = transform
            imgV.alpha = 0.0
        }) { (com) in
            imgV.removeFromSuperview()
        }
    }
    
    func drawMediaFunction() {
        for item in mediaTimeNames {
            var cP1: [Float] = [0.0, 0.0]
            var cP2: [Float] = [0.0, 0.0]
            let mediaTimingFunc = CAMediaTimingFunction.init(name: item)
            mediaTimingFunc.getControlPoint(at: 1, values: &cP1)
            mediaTimingFunc.getControlPoint(at: 2, values: &cP2)
            
            let path = UIBezierPath()
            path.move(to: CGPoint.zero)
            let point1 = CGPoint(x: CGFloat(cP1[0]), y: CGFloat(cP1[1]))
            let point2 = CGPoint(x: CGFloat(cP2[0]), y: CGFloat(cP2[1]))
            path.addCurve(to: CGPoint(x: 1, y: 1), controlPoint1: point1, controlPoint2: point2)
            
            path.apply(CGAffineTransform.init(scaleX: 250, y: 250))
            
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = path.cgPath
            shapeLayer.strokeColor = UIColor.red.cgColor
            shapeLayer.lineWidth = 3.0
            shapeLayer.fillColor = UIColor.clear.cgColor
            
            layerView.layer.addSublayer(shapeLayer)
            layerView.layer.isGeometryFlipped = true
        }
    }
    
    func ballJumps() {
        ballImgView.center = CGPoint(x: 150, y: 32)
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position"
        animation.duration = 2.0
        animation.delegate = self
        animation.values = [CGPoint(x: 150, y: 32),
                            CGPoint(x: 150, y: 268),
                            CGPoint(x: 150, y: 140),
                            CGPoint(x: 150, y: 268),
                            CGPoint(x: 150, y: 220),
                            CGPoint(x: 150, y: 268),
                            CGPoint(x: 150, y: 250),
                            CGPoint(x: 150, y: 268)]
        animation.timingFunctions = [CAMediaTimingFunction.init(name: .easeIn),
                                     CAMediaTimingFunction.init(name: .easeOut),
                                     CAMediaTimingFunction.init(name: .easeIn),
                                     CAMediaTimingFunction.init(name: .easeOut),
                                     CAMediaTimingFunction.init(name: .easeIn),
                                     CAMediaTimingFunction.init(name: .easeOut),
                                     CAMediaTimingFunction.init(name: .easeIn)]
        
        animation.keyTimes = [NSNumber(value: 0.0),
                              NSNumber(value: 0.3),
                              NSNumber(value: 0.5),
                              NSNumber(value: 0.7),
                              NSNumber(value: 0.8),
                              NSNumber(value: 0.9),
                              NSNumber(value: 0.95),
                              NSNumber(value: 1.0)]
        self.ballImgView.layer.position = CGPoint(x: 150, y: 268)
        self.ballImgView.layer.add(animation, forKey: nil)
    }
    
}

extension AnimationsViewController: CAAnimationDelegate {
    
    // 委托传入的动画参数是原始值的一个深拷贝，从而不是同一个值
    func animationDidStart(_ anim: CAAnimation) {
        print("animationDidStart")
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        //        CATransaction.begin()
        //        CATransaction.setDisableActions(true)
        //        colorLayer.backgroundColor = ((anim as! CABasicAnimation).toValue as! CGColor)
        //        CATransaction.commit()
        print("finised: \(false)")
    }
}
