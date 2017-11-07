//
//  ViewControllerSwipeTransitions.swift
//  LottieAnimation
//
//  Created by Nacho MAC on 31/10/2017.
//  Copyright © 2017 Brian Advent. All rights reserved.
//

import UIKit
import Lottie

class ViewControllerSwipeTransitions: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    // Create animationView
    let animationView = LOTAnimationView(name: "tutorial")

    // Create stringArray with info
    let stringArray = ["Swipe to begin", "Welcome to bed", "Don't forget to clean", "With water", "Then eat a toast", "Go to work"]
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        animationView.frame = CGRect(x: 0, y: 50, width: self.view.frame.size.width, height: 300)
        animationView.contentMode = .scaleAspectFit
        animationView.loopAnimation = true
        self.view.addSubview(animationView)
        
        setupScrollView()
    }

    
    // MARKS: Setup ScrollView
    func setupScrollView() {
        
        scrollView.delegate = self
        
        scrollView.contentSize = CGSize(width: self.view.frame.size.width * 6, height: scrollView.frame.size.height)
        
        for i in 0 ... 5 {
            
            let label = UILabel(frame:CGRect(x: scrollView.center.x + CGFloat(i) * self.view.frame.size.width - 130, y: 50, width: 260, height: 30))
            label.font = UIFont.boldSystemFont(ofSize: 26)
            label.textAlignment = .center
            label.text = stringArray[i]
            
            scrollView.addSubview(label)
        }
    }
    
    
    // MARKS: ScrollView Method
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let progress = scrollView.contentOffset.x / scrollView.contentSize.width
        animationView.animationProgress = progress
    }

    
    // MARKS: BUTTON ACTIONS
    @IBAction func backBtn(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }

}
