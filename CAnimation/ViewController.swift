//
//  ViewController.swift
//  CAnimation
//
//  Created by yrion on 2020/4/1.
//  Copyright © 2020 yrion. All rights reserved.
//

//import SwiftUI
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var layerView:UIView!
    
    @IBOutlet weak var layerView2:UIView!
    
    @IBOutlet weak var layerView3: UIView!
    
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension ViewController {
    func layerViewContents() {
        let image = UIImage(named: "snowman")
        layerView.layer.contents = image?.cgImage
        layerView.layer.contentsGravity = CALayerContentsGravity.resizeAspect
    }
    
    func layerViewSubLayer() {
        let blueLayer = CALayer()
        blueLayer.frame = CGRect(x: 50.0, y: 50.0, width: 100.0, height: 100.0)
        blueLayer.backgroundColor = UIColor.blue.cgColor
        blueLayer.delegate = self
        layerView2.layer.addSublayer(blueLayer)
        
        blueLayer.display()
        
        let orangeLayer = CALayer();
        orangeLayer.frame = CGRect(x: 50.0, y: 50.0, width: 100.0, height: 100.0)
        orangeLayer.backgroundColor =  UIColor.orange.cgColor
        orangeLayer.backgroundColor = UIColor.orange.cgColor;
        layerView2.layer.addSublayer(orangeLayer)
        
        blueLayer.anchorPoint = CGPoint(x: 0, y: 0);
    }
    
    func layerViewLayer() {
        layerView.layer.cornerRadius = 10.0
        layerView2.layer.cornerRadius = 10.0
        
        layerView.layer.borderColor = UIColor.purple.cgColor
        layerView2.layer.borderColor = UIColor.purple.cgColor
        layerView.layer.borderWidth = 5
        layerView2.layer.borderWidth = 5
        
        layerView.layer.masksToBounds = true
        
        layerView.layer.shadowOpacity = 0.5
        layerView.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        layerView.layer.shadowRadius = 5.0
        
        layerView2.layer.shadowOpacity = 0.5
        layerView2.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        layerView2.layer.shadowRadius = 5.0
    }
    
    func layerViewShadowPath() {
        layerView.layer.shadowOpacity = 0.5
        let squarepath = CGPath(ellipseIn: layerView.bounds, transform: nil)
        layerView.layer.shadowPath = squarepath
    }
    
    func layerViewMask() {
        let maskLayer = CALayer()
        maskLayer.frame = imageView.bounds
        let image = UIImage(named: "flower")
        maskLayer.contents = image?.cgImage
        
        imageView.layer.mask = maskLayer
    }
}

extension ViewController: CALayerDelegate {
    func draw(_ layer: CALayer, in ctx: CGContext) {
        ctx.setLineWidth(10.0)
        ctx.setStrokeColor(UIColor.red.cgColor)
        ctx.strokeEllipse(in: layer.bounds)
    }
}

//struct UIVCPresenter: UIViewControllerRepresentable {
//
//    ///UIViewControllerRepresentable  协议中必须实现的方法 -  当 SwiftUI 准备好显示 view 时，它会调用此方法一次
//    ///作用： 将需要Preview显示VC 返回出来。
//    func makeUIViewController(context: UIViewControllerRepresentableContext<UIVCPresenter>) -> ViewController {
//        return ViewController()
//    }
//    ///UIViewControllerRepresentable  协议中必须实现的方法
//    ///    更新UIViewController时候会调用这个方法  可以做一系列l业务实现，
//    func updateUIViewController(_ uiViewController: ViewController, context: UIViewControllerRepresentableContext<UIVCPresenter>) {
//    }
//}
//
//struct swiftUIView: View {
//    var body: some View {
//        UIVCPresenter()
//    }
//}
//
//struct UIKitVCPreView : PreviewProvider {
//    static var previews: some View {
//        swiftUIView()
//    }
//}

