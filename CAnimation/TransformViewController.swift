//
//  TransformViewController.swift
//  CAnimation
//
//  Created by yrion on 2020/4/3.
//  Copyright © 2020 yrion. All rights reserved.
//

import UIKit

class TransformViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var imageContainer: UIView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension TransformViewController {
    func layerViewAffineTransform() {
            let transform = CGAffineTransform.init(rotationAngle: CGFloat(Double.pi / 4.0))
            imageView.layer.setAffineTransform(transform)
        }
        
        func layerViewTransform3D() {
            var transform = CATransform3DIdentity
            transform.m34 = -1.0 / 500.0
            transform = CATransform3DRotate(transform, CGFloat(Double.pi / 4), 0, 1, 0)
            imageView.layer.transform = transform
            
        }
        
        func layerViewAffineTransform2() {
            var transform = CGAffineTransform.identity
            transform = transform.scaledBy(x: 0.5, y: 0.5)
            transform = transform.rotated(by: CGFloat(Double.pi / 180 * 30))
            transform = transform.translatedBy(x: 200, y: 0)
            imageView.layer.setAffineTransform(transform)
    //        imageView.layer.setAffineTransform(CGAffineTransform.identity)
        }
        
        func layerViewSublayerTransform() {
            var transform = CATransform3DIdentity
            transform.m34 = -1.0 / 500.0
            imageContainer.layer.sublayerTransform = transform
            
            let transform2 = CATransform3DMakeRotation(CGFloat(Double.pi), 0, 1, 0)
            imageView2.layer.transform = transform2
            
            let transform3 = CATransform3DMakeRotation(-CGFloat(Double.pi), 0, 1, 0)
            imageView3.layer.isDoubleSided = false
            imageView3.layer.transform = transform3
        }
        
        func layerViewReverseTransform() {
            var transform = CATransform3DIdentity
            transform.m34 = -1.0 / 500.0
            
            // 绕z轴旋转
    //        let transform2 = CATransform3DRotate(transform, CGFloat(Double.pi / 4) * -1, 0, 0, 1)
    //        imageContainer.layer.transform = transform2
    //
    //        let transform3 = CATransform3DRotate(transform, CGFloat(Double.pi / 4), 0, 0, 1)
    //        imageView3.layer.transform = transform3
            
            // 绕Y轴旋转
            let transform2 = CATransform3DRotate(transform, CGFloat(Double.pi / 4) * -1, 0, 1, 0)
            imageContainer.layer.transform = transform2
            
            let transform3 = CATransform3DRotate(transform, CGFloat(Double.pi / 4), 0, 1, 0)
            imageView3.layer.transform = transform3
        }
}



