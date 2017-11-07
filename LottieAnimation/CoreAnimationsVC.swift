//
//  CoreAnimationsVC.swift
//  LottieAnimation
//
//  Created by Nacho MAC on 31/10/2017.
//  Copyright © 2017 Brian Advent. All rights reserved.
//

import UIKit

class CoreAnimationsVC: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        avatarImageView.isUserInteractionEnabled = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CoreAnimationsVC.addPulse))
        
        tapGestureRecognizer.numberOfTapsRequired = 1
    avatarImageView.addGestureRecognizer(tapGestureRecognizer)
    }


    @objc func addPulse(){
        let pulse = Pulsing(numberOfPulses: 1, radius: 110, position: avatarImageView.center)
        pulse.animationDuration = 0.8
        pulse.backgroundColor = UIColor.blue.cgColor
        
        self.view.layer.insertSublayer(pulse, below: avatarImageView.layer)
    }


    @IBAction func backBtn(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }


}
