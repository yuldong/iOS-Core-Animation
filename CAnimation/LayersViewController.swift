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
