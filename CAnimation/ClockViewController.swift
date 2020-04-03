//
//  ClockViewController.swift
//  CAnimation
//
//  Created by yrion on 2020/4/2.
//  Copyright © 2020 yrion. All rights reserved.
//

import UIKit

class ClockViewController: UIViewController {
    
    @IBOutlet weak var clockImgV: UIImageView!
    @IBOutlet weak var hourImgV: UIImageView!
    @IBOutlet weak var mImgV: UIImageView!
    @IBOutlet weak var secondsImgV: UIImageView!
    
    var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
        
        hourImgV.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        mImgV.layer.anchorPoint = CGPoint(x: 0.5, y: 0.9)
        secondsImgV.layer.anchorPoint = CGPoint(x: 0.5, y: 0.9)
        
    }
    
    @objc func tick() {
        let calender = NSCalendar.init(identifier: .gregorian)
        let units = NSCalendar.Unit.hour.union(.minute).union(.second)
        let components = calender?.components(units, from: Date())
        let hoursAngle = (Double(components!.hour!) / 12.0) * Double.pi * 2.0;
        //calculate hour hand angle //calculate minute hand angle
        let minsAngle = (Double(components!.minute!) / 60.0) * Double.pi * 2.0;
        //calculate second hand angle
        let secsAngle = (Double(components!.second!) / 60.0) * Double.pi * 2.0;
        
        hourImgV.transform = CGAffineTransform.init(rotationAngle: CGFloat(hoursAngle))
        mImgV.transform = CGAffineTransform.init(rotationAngle: CGFloat(minsAngle))
        secondsImgV.transform = CGAffineTransform.init(rotationAngle: CGFloat(secsAngle))
    }
}
