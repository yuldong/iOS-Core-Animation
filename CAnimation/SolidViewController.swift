//
//  SolidViewController.swift
//  CAnimation
//
//  Created by yrion on 2020/4/3.
//  Copyright © 2020 yrion. All rights reserved.
//

import UIKit

class SolidViewController: UIViewController {
    
    @IBOutlet weak var container: UIView!
    
    @IBOutlet var faces: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var perspective = CATransform3DIdentity;
        perspective.m34 = -1.0 / 500.0
        perspective = CATransform3DRotate(perspective, -CGFloat(Double.pi / 4), 1, 0, 0)
        perspective = CATransform3DRotate(perspective, -CGFloat(Double.pi / 4), 0, 1, 0)
        container.layer.sublayerTransform = perspective
        
        var transform = CATransform3DMakeTranslation(0, 0, 50);
        add(faceAt: 0, with: transform)
        
        transform = CATransform3DMakeTranslation(50, 0, 0)
        transform = CATransform3DRotate(transform, CGFloat(Double.pi / 2), 0, 1, 0)
        add(faceAt: 1, with: transform)
        
        transform = CATransform3DMakeTranslation(0, -50, 0)
        transform = CATransform3DRotate(transform, CGFloat(Double.pi / 2), 1, 0, 0)
        add(faceAt: 2, with: transform)
        
        transform = CATransform3DMakeTranslation(0, 50, 0)
        transform = CATransform3DRotate(transform, -CGFloat(Double.pi / 2), 1, 0, 0)
        add(faceAt: 3, with: transform)
        
        transform = CATransform3DMakeTranslation(-50, 0, 0)
        transform = CATransform3DRotate(transform, -CGFloat(Double.pi / 2), 0, 1, 0)
        add(faceAt: 4, with: transform)
        
        transform = CATransform3DMakeTranslation(0, 0, -50)
        transform = CATransform3DRotate(transform, CGFloat(Double.pi), 0, 1, 0)
        add(faceAt: 5, with: transform)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            
    }
}

extension SolidViewController {
    func add(faceAt index: Int, with transform: CATransform3D) {
        let face = faces[index]
        face.layer.borderWidth = 0.5
        face.layer.borderColor = UIColor.red.cgColor
        
        container.addSubview(face)
        
        let size = container.bounds.size
        face.center = CGPoint(x: size.width / 2, y: size.height / 2)
        face.layer.transform = transform
    }
}
