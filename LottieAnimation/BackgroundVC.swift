//
//  BackgroundVC.swift
//  LottieAnimation
//
//  Created by Nacho MAC on 31/10/2017.
//  Copyright © 2017 Brian Advent. All rights reserved.
//

import UIKit

class BackgroundVC: UIViewController {

    
    @IBOutlet weak var backBtn: UIButton!
    //@IBOutlet weak var myBackgroundImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    override func viewWillAppear(_ animated: Bool) {
        
        let firstImageView = UIImageView(image: UIImage(named: "bg01.png"))
        firstImageView.frame = view.frame
        view.addSubview(firstImageView)
        
        imageFadeIn(imageView: firstImageView)
        
    }
    
    func imageFadeIn(imageView: UIImageView) {
        
        let secondImageView = UIImageView(image: UIImage(named: "bg02.png"))

        secondImageView.frame = view.frame
        secondImageView.alpha = 0.0
        let button = UIButton()
        let bounds = CGRect(x: 0, y: 0, width: 120, height: 120)
        button.titleLabel?.text = "BACK"
        //button.tintColor = UIColor.white.cgColor
        button.frame = bounds
       view.insertSubview(secondImageView, aboveSubview: button)
        //self.secondImageView.addSubview(button)
        
        view.insertSubview(secondImageView, aboveSubview: imageView)
        
        UIView.animate(withDuration: 2.0, delay: 2.0, options: .curveEaseOut, animations: {
            secondImageView.alpha = 1.0
        }, completion: {_ in
            imageView.image = secondImageView.image
            secondImageView.removeFromSuperview()
        })

        //button.bounds =
        //        self.bounds = CGRect(x: 0, y: 0, width: radius * 2, height: radius * 2)

    }

    
    
    @IBAction func backBtn(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }


}
