//
//  ShakeAnimationVC.swift
//  LottieAnimation
//
//  Created by Nacho MAC on 31/10/2017.
//  Copyright © 2017 Brian Advent. All rights reserved.
//

import UIKit

class ShakeAnimationVC: UIViewController {

    
    @IBOutlet weak var cubeView: UIView!
    
    
    func shakeView(vw: UIView) {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [0, 10, -10, 10, -5, 5, -5, 0 ]
        animation.keyTimes = [0, 0.125, 0.25, 0.375, 0.5, 0.625, 0.75, 0.875, 1]
        animation.duration = 0.4
        animation.isAdditive = true
        
        vw.layer.add(animation, forKey: "shake")
    }
    
    
    @IBAction func pulse4ShakeBtn(_ sender: Any) {
        self.shakeView(vw: cubeView)
    }
    
    
    @IBAction func backBtn(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }

}
