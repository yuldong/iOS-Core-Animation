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
    
    var colorLayer: CALayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp2()
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let point = touches.first!.location(in: view)
        if (colorLayer.presentation()?.hitTest(point)) != nil {
            let red = CGFloat(arc4random()) / CGFloat(Int32.max)
            let green = CGFloat(arc4random()) / CGFloat(Int32.max)
            let blue = CGFloat(arc4random()) / CGFloat(Int32.max)
            colorLayer.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1).cgColor
        } else {
            CATransaction.begin()
            CATransaction.setAnimationDuration(4.0)
            colorLayer.position = point
            CATransaction.commit()
        }
    }
    
    @IBAction func changerColor() {
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

}
