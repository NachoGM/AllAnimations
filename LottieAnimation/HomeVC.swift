//
//  HomeVC.swift
//  LottieAnimation
//
//  Created by Nacho MAC on 31/10/2017.
//  Copyright © 2017 Brian Advent. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    
    // MARKS: Display LayoutConstraint
    @IBOutlet weak var button1Constraint: NSLayoutConstraint!
    @IBOutlet weak var button2Constraint: NSLayoutConstraint!
    @IBOutlet weak var button3Constraint: NSLayoutConstraint!
    @IBOutlet weak var button4Constraint: NSLayoutConstraint!
    @IBOutlet weak var button5Constraint: NSLayoutConstraint!
    @IBOutlet weak var button6Constraint: NSLayoutConstraint!
    @IBOutlet weak var button7Constraint: NSLayoutConstraint!
    @IBOutlet weak var button8Constraint: NSLayoutConstraint!
    @IBOutlet weak var button9Constraint: NSLayoutConstraint!
    @IBOutlet weak var button10Constraint: NSLayoutConstraint!
    
    @IBOutlet weak var whiteView1Constraint: NSLayoutConstraint!
    @IBOutlet weak var whiteView2Constraint: NSLayoutConstraint!
    @IBOutlet weak var whiteView3Constraint: NSLayoutConstraint!
    @IBOutlet weak var whiteView4Constraint: NSLayoutConstraint!
    
    
    // MARKS: Display view and button 4 customice it
    @IBOutlet weak var whiteSimpleView: UIView!
    @IBOutlet weak var whiteTransitionsView: UIView!
    @IBOutlet weak var whiteCoreView: UIView!
    @IBOutlet weak var whiteView: UIView!
    @IBOutlet weak var lottie1Btn: UIButton!
    @IBOutlet weak var lottie2Btn: UIButton!
    @IBOutlet weak var coreAnimation1Btn: UIButton!
    @IBOutlet weak var coreAnimation2Btn: UIButton!
    @IBOutlet weak var viewControllersAnimation1Btn: UIButton!
    @IBOutlet weak var viewControllersAnimation2Btn: UIButton!
    @IBOutlet weak var viewControllersAnimation3Btn: UIButton!
    @IBOutlet weak var simpleAnimation1Btn: UIButton!
    @IBOutlet weak var simpleAnimation2Btn: UIButton!
    @IBOutlet weak var simpleAnimation3Btn: UIButton!
    
    
    // MARKS: Declare var
    var animationPerformedOnce = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Charge func 4 custom buttons & constants
        customVC()
        
        constantsVC()

    }
    
    // MARKS: Modify Status Bar Color
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return .lightContent
    }
    
    // MARKS: Display constants 4 whiteView & buttons
    func constantsVC() {
        
        button1Constraint.constant -= view.bounds.width
        button2Constraint.constant -= view.bounds.width
        button3Constraint.constant -= view.bounds.width
        button4Constraint.constant -= view.bounds.width
        button5Constraint.constant -= view.bounds.width
        button6Constraint.constant -= view.bounds.width
        button7Constraint.constant -= view.bounds.width
        button8Constraint.constant -= view.bounds.width
        button9Constraint.constant -= view.bounds.width
        button10Constraint.constant -= view.bounds.width
        
        whiteView1Constraint.constant -= view.bounds.width
        whiteView2Constraint.constant -= view.bounds.width
        whiteView3Constraint.constant -= view.bounds.width
        whiteView4Constraint.constant -= view.bounds.width
    }
    
    
    // MARKS: Display custom white view & buttons
    func customVC() {
        
        // Make corners rounded
        whiteView.layer.cornerRadius = 10
        whiteCoreView.layer.cornerRadius = 10
        whiteSimpleView.layer.cornerRadius = 10
        whiteTransitionsView.layer.cornerRadius = 10
        
        lottie1Btn.layer.cornerRadius = lottie1Btn.frame.size.width / 2
        lottie2Btn.layer.cornerRadius = lottie2Btn.frame.size.width / 2
        
        coreAnimation1Btn.layer.cornerRadius = coreAnimation1Btn.frame.size.width / 2
        coreAnimation2Btn.layer.cornerRadius = coreAnimation2Btn.frame.size.width / 2
        
        viewControllersAnimation1Btn.layer.cornerRadius = viewControllersAnimation1Btn.frame.size.width / 2
        viewControllersAnimation2Btn.layer.cornerRadius = viewControllersAnimation2Btn.frame.size.width / 2
        viewControllersAnimation3Btn.layer.cornerRadius = viewControllersAnimation3Btn.frame.size.width / 2
        
        simpleAnimation1Btn.layer.cornerRadius = simpleAnimation1Btn.frame.size.width / 2
        simpleAnimation2Btn.layer.cornerRadius = simpleAnimation2Btn.frame.size.width / 2
        simpleAnimation3Btn.layer.cornerRadius = simpleAnimation3Btn.frame.size.width / 2

        // Display shadow
        // 1.- White Views
        whiteView.layer.shadowOpacity = 0.6
        whiteView.layer.shadowColor = UIColor.gray.cgColor
        whiteView.layer.shadowRadius = 5
        whiteView.layer.shadowOffset = CGSize(width: 5, height: 0)

        whiteCoreView.layer.shadowOpacity = 0.6
        whiteCoreView.layer.shadowColor = UIColor.gray.cgColor
        whiteCoreView.layer.shadowRadius = 5
        whiteCoreView.layer.shadowOffset = CGSize(width: 5, height: 0)
        
        whiteSimpleView.layer.shadowOpacity = 0.6
        whiteSimpleView.layer.shadowColor = UIColor.gray.cgColor
        whiteSimpleView.layer.shadowRadius = 5
        whiteSimpleView.layer.shadowOffset = CGSize(width: 5, height: 0)
        
        whiteTransitionsView.layer.shadowOpacity = 0.6
        whiteTransitionsView.layer.shadowColor = UIColor.gray.cgColor
        whiteTransitionsView.layer.shadowRadius = 5
        whiteTransitionsView.layer.shadowOffset = CGSize(width: 5, height: 0)
        
        // 2.- Buttons
        lottie1Btn.layer.shadowOpacity = 0.6
        lottie1Btn.layer.shadowColor = UIColor.gray.cgColor
        lottie1Btn.layer.shadowRadius = 2.5
        lottie1Btn.layer.shadowOffset = CGSize(width: 5, height: 5)

        lottie2Btn.layer.shadowOpacity = 0.6
        lottie2Btn.layer.shadowColor = UIColor.gray.cgColor
        lottie2Btn.layer.shadowRadius = 2.5
        lottie2Btn.layer.shadowOffset = CGSize(width: 5, height: 5)

        coreAnimation1Btn.layer.shadowOpacity = 0.6
        coreAnimation1Btn.layer.shadowColor = UIColor.gray.cgColor
        coreAnimation1Btn.layer.shadowRadius = 2.5
        coreAnimation1Btn.layer.shadowOffset = CGSize(width: 5, height: 5)

        coreAnimation2Btn.layer.shadowOpacity = 0.6
        coreAnimation2Btn.layer.shadowColor = UIColor.gray.cgColor
        coreAnimation2Btn.layer.shadowRadius = 2.5
        coreAnimation2Btn.layer.shadowOffset = CGSize(width: 5, height: 5)

        viewControllersAnimation1Btn.layer.shadowOpacity = 0.6
        viewControllersAnimation1Btn.layer.shadowColor = UIColor.gray.cgColor
        viewControllersAnimation1Btn.layer.shadowRadius = 2.5
        viewControllersAnimation1Btn.layer.shadowOffset = CGSize(width: 5, height: 5)

        viewControllersAnimation2Btn.layer.shadowOpacity = 0.6
        viewControllersAnimation2Btn.layer.shadowColor = UIColor.gray.cgColor
        viewControllersAnimation2Btn.layer.shadowRadius = 2.5
        viewControllersAnimation2Btn.layer.shadowOffset = CGSize(width: 5, height: 5)

        viewControllersAnimation3Btn.layer.shadowOpacity = 0.6
        viewControllersAnimation3Btn.layer.shadowColor = UIColor.gray.cgColor
        viewControllersAnimation3Btn.layer.shadowRadius = 2.5
        viewControllersAnimation3Btn.layer.shadowOffset = CGSize(width: 5, height: 5)

        simpleAnimation1Btn.layer.shadowOpacity = 0.6
        simpleAnimation1Btn.layer.shadowColor = UIColor.gray.cgColor
        simpleAnimation1Btn.layer.shadowRadius = 2.5
        simpleAnimation1Btn.layer.shadowOffset = CGSize(width: 5, height: 5)

        simpleAnimation2Btn.layer.shadowOpacity = 0.6
        simpleAnimation2Btn.layer.shadowColor = UIColor.gray.cgColor
        simpleAnimation2Btn.layer.shadowRadius = 2.5
        simpleAnimation2Btn.layer.shadowOffset = CGSize(width: 5, height: 5)
        
        simpleAnimation3Btn.layer.shadowOpacity = 0.6
        simpleAnimation3Btn.layer.shadowColor = UIColor.gray.cgColor
        simpleAnimation3Btn.layer.shadowRadius = 2.5
        simpleAnimation3Btn.layer.shadowOffset = CGSize(width: 5, height: 5)
    }

    
    // MARKS: Display Animation
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        
        if !animationPerformedOnce {
            
            // WhiteView1
            UIView.animate(withDuration: 0.5, delay: 1.2, options: .curveEaseOut, animations: {
                self.whiteView1Constraint.constant += self.view.bounds.width
                self.view.layoutIfNeeded()
            }, completion: nil)
            
            // Button
            UIView.animate(withDuration: 0.5, delay: 1.5, options: .curveEaseOut, animations: {
                self.button1Constraint.constant += self.view.bounds.width
                self.view.layoutIfNeeded()
            }, completion: nil)
            
            UIView.animate(withDuration: 0.5, delay: 1.8, options: .curveEaseOut, animations: {
                self.button2Constraint.constant += self.view.bounds.width
                self.view.layoutIfNeeded()
            }, completion: nil)
            
            // WhiteView2
            UIView.animate(withDuration: 0.5, delay: 2.1, options: .curveEaseOut, animations: {
                self.whiteView2Constraint.constant += self.view.bounds.width
                self.view.layoutIfNeeded()
            }, completion: nil)
            
            // Buttons
            UIView.animate(withDuration: 0.5, delay: 2.4, options: .curveEaseOut, animations: {
                self.button3Constraint.constant += self.view.bounds.width
                self.view.layoutIfNeeded()
            }, completion: nil)
            
            UIView.animate(withDuration: 0.5, delay: 2.7, options: .curveEaseOut, animations: {
                self.button4Constraint.constant += self.view.bounds.width
                self.view.layoutIfNeeded()
            }, completion: nil)
            
            UIView.animate(withDuration: 0.5, delay: 3.0, options: .curveEaseOut, animations: {
                self.button5Constraint.constant += self.view.bounds.width
                self.view.layoutIfNeeded()
            }, completion: nil)
            
            // WhiteView3
            UIView.animate(withDuration: 0.5, delay: 3.3, options: .curveEaseOut, animations: {
                self.whiteView3Constraint.constant += self.view.bounds.width
                self.view.layoutIfNeeded()
            }, completion: nil)
            
            // Buttons
            UIView.animate(withDuration: 0.5, delay: 3.6, options: .curveEaseOut, animations: {
                self.button6Constraint.constant += self.view.bounds.width
                self.view.layoutIfNeeded()
            }, completion: nil)

            UIView.animate(withDuration: 0.5, delay: 3.9, options: .curveEaseOut, animations: {
                self.button7Constraint.constant += self.view.bounds.width
                self.view.layoutIfNeeded()
            }, completion: nil)

            UIView.animate(withDuration: 0.5, delay: 4.2, options: .curveEaseOut, animations: {
                self.button8Constraint.constant += self.view.bounds.width
                self.view.layoutIfNeeded()
            }, completion: nil)
            
            // WhiteView4
            UIView.animate(withDuration: 0.5, delay: 4.5, options: .curveEaseOut, animations: {
                self.whiteView4Constraint.constant += self.view.bounds.width
                self.view.layoutIfNeeded()
            }, completion: nil)
            
            // Buttons
            UIView.animate(withDuration: 0.5, delay: 4.8, options: .curveEaseOut, animations: {
                self.button9Constraint.constant += self.view.bounds.width
                self.view.layoutIfNeeded()
            }, completion: nil)
            
            UIView.animate(withDuration: 0.5, delay: 5.1, options: .curveEaseOut, animations: {
                self.button10Constraint.constant += self.view.bounds.width
                self.view.layoutIfNeeded()
            }, completion: nil)
            animationPerformedOnce = true
        }
    }
    
    //MARKS: DISPLAY BUTTON ACTIONS
    @IBAction func lottieBtn(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func coreAnimationBtn(_ sender: Any) {

        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CoreAnimationsVC") as! CoreAnimationsVC
        present(vc, animated: true, completion: nil)
    }

    @IBAction func simpleAnimationTVBtn(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SimpleAnimation1VC") as! SimpleAnimation1VC
        present(vc, animated: true, completion: nil)
    }

    @IBAction func tableViewAnimation(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TableViewAnimationVC") as! TableViewAnimationVC
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func backgroundBtn(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "BackgroundVC") as! BackgroundVC
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func lottieSwipeBtn(_ sender: Any) {
        
         let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllerSwipeTransitions") as! ViewControllerSwipeTransitions
         present(vc, animated: true, completion: nil)
    }
    
    @IBAction func circularTransitionBtn(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CircleTransitionHome") as! CircleTransitionHome
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func coreTextBtn(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CoreTextAnimationVC") as! CoreTextAnimationVC
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func shakeAnimationBtn(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ShakeAnimationVC") as! ShakeAnimationVC
        present(vc, animated: true, completion: nil)
    }
   
    @IBAction func dancerBtn(_ sender: Any) {
        //SimpleAnimationDancerVC
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SimpleAnimationDancerVC") as! SimpleAnimationDancerVC
        present(vc, animated: true, completion: nil)
    }
    
}
