//
//  ViewController.swift
//  LottieAnimation
//
//  Created by Brian Advent on 06/02/2017.
//  Copyright © 2017 Brian Advent. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    
    var menuOn = false
    var hamburgerMenuButton:LOTAnimationView?
    let hamburgerMenuFrame = CGRect(x: 0, y: 20, width: 75, height: 75)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addHamburgerMenuButton(on: menuOn)
    }

    
    func addHamburgerMenuButton (on:Bool) {
        
        if hamburgerMenuButton != nil {
            hamburgerMenuButton?.removeFromSuperview()
            hamburgerMenuButton = nil
        }
        
        let animation = on ? "buttonOff" : "buttonOn"
        
        hamburgerMenuButton = LOTAnimationView(name: animation)
        hamburgerMenuButton?.isUserInteractionEnabled = true
        hamburgerMenuButton?.frame = hamburgerMenuFrame
        hamburgerMenuButton?.contentMode = .scaleAspectFill
        
        addMenuToggleRecognizer()
        
        self.view.addSubview(hamburgerMenuButton!)
    }
    
    
    func addMenuToggleRecognizer (){
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.toggleMenu(recognizer:)))
        
        tapRecognizer.numberOfTapsRequired = 1
        
        hamburgerMenuButton?.addGestureRecognizer(tapRecognizer)
        
    }
    
    
    @objc func toggleMenu (recognizer:UITapGestureRecognizer) {
    
        if !menuOn {
            hamburgerMenuButton?.play(completion: { (success:Bool) in
                self.menuOn = true
                self.addHamburgerMenuButton(on: self.menuOn)
            })
            
        }else{
            hamburgerMenuButton?.play(completion: { (success:Bool) in
                self.menuOn = false
                self.addHamburgerMenuButton(on: self.menuOn)
                
                // turn back, you can delete this line
                self.dismiss(animated: true, completion: nil)
            })
        }
    }
    
    
    @IBAction func showAnimation(_ sender: UIButton) {
        
        let animationView = LOTAnimationView(name: "PinJump")
        animationView.frame = CGRect(x: 0, y: 100, width: self.view.frame.size.width, height: 250)
        animationView.contentMode = .scaleAspectFill
        animationView.loopAnimation = true
        
        self.view.addSubview(animationView)
        
        animationView.play()
    }

}

