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
    
    var colorLayer: CALayer!
    
    var shipLayer: CALayer!
    
    let imgs = [UIImage(named: "flower"), UIImage(named: "snowman"), UIImage(named: "ship")]

    override func viewDidLoad() {
        super.viewDidLoad()
//        setUp()
//        setUp2()
//        setUpBasicCA()
        shipLayer = CALayer()
        shipLayer.frame = CGRect(x: 0, y: 0, width: 64, height: 64)
        shipLayer.position = CGPoint(x: 0, y: 150)
        shipLayer.contents = UIImage(named: "ship")?.cgImage
        shipLayer.contentsGravity = CALayerContentsGravity.resizeAspect
        layerView.layer.addSublayer(shipLayer)
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
//        let animation = CAKeyframeAnimation()
//        animation.keyPath = "backgroundColor"
//        animation.duration = 4.0
//        // 需要开始和结束的关键帧来匹配当前属性的值
//        animation.values = [UIColor.blue.cgColor,
//                            UIColor.red.cgColor,
//                            UIColor.green.cgColor,
//                            UIColor.blue.cgColor]
//        colorLayer.add(animation, forKey: nil)
        let path = UIBezierPath.init()
        path.move(to: CGPoint(x: 0, y: 150))
        path.addCurve(to: CGPoint(x: 300, y: 150), controlPoint1: CGPoint(x: 75, y: 0), controlPoint2: CGPoint(x: 225, y: 300))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 3.0
        layerView.layer.addSublayer(shapeLayer)
        
        let shipLayer = CALayer()
        shipLayer.frame = CGRect(x: 0, y: 0, width: 64, height: 64)
        shipLayer.position = CGPoint(x: 0, y: 150)
        shipLayer.contents = UIImage(named: "ship")?.cgImage
        shipLayer.contentsGravity = CALayerContentsGravity.resizeAspect
        layerView.layer.addSublayer(shipLayer)
        
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position"
        animation.path = path.cgPath
        animation.duration = 4.0
        animation.rotationMode = CAAnimationRotationMode.rotateAuto
        shipLayer.add(animation, forKey: nil)
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
