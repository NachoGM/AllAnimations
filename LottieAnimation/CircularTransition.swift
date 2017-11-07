//
//  CircularTransition.swift
//  LottieAnimation
//
//  Created by Nacho MAC on 31/10/2017.
//  Copyright © 2017 Brian Advent. All rights reserved.
//

import UIKit

class CircularTransition: NSObject {

    // Create circle properties
    var circle = UIView()
    
    // Create starting point
    var startingPoint = CGPoint.zero {
        didSet {
          circle.center = startingPoint
        }
    }
    
    // Create circle color
    var circleColor = UIColor.white
    
    // Create duration 4 animation
    var duration = 0.3
    
    // Create enumeration 4 transition mode
    enum CircularTransitionMode: Int {
        case present, dismiss, pop
    }
    
    // Create transition
    var transitionMode: CircularTransitionMode = .present
    
    
}

// MARKS: Extension 4 Circular transition class

extension CircularTransition: UIViewControllerAnimatedTransitioning {
    
    // Delegate Methods
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        // Create a containerView
        let containerView = transitionContext.containerView
        
        // Check in what kind of transition we're in
        if transitionMode == .present {
            //
            if let presentedView = transitionContext.view(forKey: UITransitionContextViewKey.to) {
                
                //Create constants 4 view
                let viewCenter = presentedView.center
                let viewSize = presentedView.frame.size
                circle = UIView()
                
                // Set the Circle's frame
                circle.frame = frameForCircle(withViewCenter: viewCenter, size: viewSize, startPoint: startingPoint)
                
                // Get circle rounded
                circle.layer.cornerRadius = circle.frame.size.width / 2
                circle.center = startingPoint
                circle.backgroundColor = circleColor
                circle.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                containerView.addSubview(circle)
                
                // Configure our presentedView
                presentedView.center = startingPoint
                presentedView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                presentedView.alpha = 0
                containerView.addSubview(presentedView)
                
                // Start animation
                UIView.animate(withDuration: duration, animations: {
                    self.circle.transform = CGAffineTransform.identity
                    presentedView.transform = CGAffineTransform.identity
                    presentedView.alpha = 1
                    presentedView.center = viewCenter
                    
                }, completion: { (success: Bool) in
                    transitionContext.completeTransition(success)
                })
            }
            
        } else {
            
            // Dismiss or pop animation
            let transitionModeKey = (transitionMode == .pop) ? UITransitionContextViewKey.to : UITransitionContextViewKey.from
            if let returningView = transitionContext.view(forKey: transitionModeKey) {
                let viewCenter = returningView.center
                let viewSize = returningView.frame.size
                
                circle.frame = frameForCircle(withViewCenter: viewCenter, size: viewSize, startPoint: startingPoint)
                circle.layer.cornerRadius = circle.frame.size.width / 2
                circle.center = startingPoint
                
                // Display animation
                UIView.animate(withDuration: duration, animations: {
                    self.circle.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                    returningView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                    returningView.center = self.startingPoint
                    returningView.alpha = 0
                    
                    if self.transitionMode == .pop {
                        containerView.insertSubview(returningView, belowSubview: returningView)
                        containerView.insertSubview(self.circle, belowSubview: returningView)
                    }
                    
                }, completion: { (success: Bool) in
                    returningView.center = viewCenter
                    returningView.removeFromSuperview()
                    
                    self.circle.removeFromSuperview()
                    transitionContext.completeTransition(success)
                })
                
            }
        }
        
        
    }
    
    
}


func frameForCircle (withViewCenter viewCenter: CGPoint, size viewSize: CGSize, startPoint: CGPoint) -> CGRect {
    
    // Declare constants for x & y
    let xLength = fmax(startPoint.x, viewSize.width - startPoint.x)
    let yLength = fmax(startPoint.y, viewSize.height - startPoint.y)
    
    // Calculate distance between 2points
    let offsetVector = sqrt(xLength * xLength + yLength * yLength) * 2
    let size = CGSize(width: offsetVector, height: offsetVector)

    return CGRect(origin: CGPoint.zero, size: size)
}
