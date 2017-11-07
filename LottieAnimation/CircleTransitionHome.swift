//
//  CircleTransitionHome.swift
//  LottieAnimation
//
//  Created by Nacho MAC on 31/10/2017.
//  Copyright © 2017 Brian Advent. All rights reserved.
//

import UIKit

class CircleTransitionHome: UIViewController, UIViewControllerTransitioningDelegate {

    @IBOutlet weak var menuBtn: UIButton!
    
    let transition = CircularTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()

         menuBtn.layer.cornerRadius = menuBtn.frame.size.width / 2
    }


    // MARK: Prepare 4 segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let circleDetailed = segue.destination as! CircleTransitionDetailed
        
        circleDetailed.transitioningDelegate = self
        circleDetailed.modalPresentationStyle = .custom
    }
    
    // MARK: Add Delegate Methods
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        transition.transitionMode = .present
        transition.startingPoint = menuBtn.center
        transition.circleColor = menuBtn.backgroundColor!
        
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        transition.transitionMode = .dismiss
        transition.startingPoint = menuBtn.center
        transition.circleColor = menuBtn.backgroundColor!
        
        return transition
    }
    

    
    // MARK: - DISPLAY BUTTON ACTION
    @IBAction func backBtn(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
}
