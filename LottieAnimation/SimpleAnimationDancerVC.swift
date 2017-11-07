//
//  SimpleAnimationDancerVC.swift
//  LottieAnimation
//
//  Created by Nacho MAC on 03/11/2017.
//  Copyright © 2017 Brian Advent. All rights reserved.
//

import UIKit

class SimpleAnimationDancerVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        getDancer()
    }

    
    func getDancer() {
       var imageNames = ["win_1", "win_2", "win_3", "win_4", "win_5", "win_6", "win_7", "win_8", "win_9", "win_10", "win_11", "win_12", "win_13", "win_14", "win_15", "win_16",]
        
        var images = [UIImage]()
        
        for i in 0..<imageNames.count {
            images.append(UIImage(named: imageNames[i])!)
        }
        
        imageView.animationImages = images
        imageView.startAnimating()
    }

    
    // MARKS: Display Button Actions
    @IBAction func backBtn(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func startBtn(_ sender: Any) {
        
        imageView.startAnimating()
    }
    
    @IBAction func stopBtn(_ sender: Any) {
        
        imageView.stopAnimating()
    }
    

}
