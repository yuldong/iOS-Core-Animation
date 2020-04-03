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
        
        colorLayer = CALayer()
        colorLayer.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        colorLayer.backgroundColor = UIColor.blue.cgColor
        let transition = CATransition()
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        colorLayer.actions = ["backgroundColor": transition]
        
        layerView.layer.addSublayer(colorLayer)
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
