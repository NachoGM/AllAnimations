//
//  CoreTextAnimationVC.swift
//  LottieAnimation
//
//  Created by Nacho MAC on 31/10/2017.
//  Copyright © 2017 Brian Advent. All rights reserved.
//

import UIKit

class CoreTextAnimationVC: UIViewController {

    
    @IBOutlet weak var textDrawingView: TextDrawingView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textDrawingView.text = "Charlie"
        textDrawingView.startColor = .green
        textDrawingView.endColor = .blue
        textDrawingView.lineWidth = 2
    }

    
    //MARKS: DISPLAY BUTTON ACTION
    @IBAction func animateBtn(_ sender: Any) {
        
        textDrawingView.startAnimation()
    }
    
    
    @IBAction func backBtn(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
}


// Create view 4 animation
class TextDrawingView: UIView {
    
    // MARKS: Declare public var
    public var startColor: UIColor = .black {
        didSet { applyColors(first: startColor, second: endColor) }
    }
    
    public var endColor: UIColor = .black {
        didSet { applyColors(first: startColor, second: endColor) }
    }
    
    public var lineWidth: CGFloat = 1 {
        didSet { shapeLayers.forEach {$0.lineWidth = lineWidth } }
    }
    
    public var text: String = "" {
        didSet {  createLayers(from: text)  }
    }
    
    public func startAnimation() {
        animateLayers()
    }
    
    
    // MARKS: Declare private var
    private var shapeLayers = [CAShapeLayer]()
    
    private func createLayers(from text: String) {
        
        let spacing: CGFloat = 10
        
        let mesurementPath = UIBezierPath()
        
        for (index, character) in text.characters.enumerated() {
           
            let path = bezierPath(from: character)
            let translation = mesurementPath.cgPath.boundingBox.width + spacing * min(CGFloat(index), 1)
            let transform = CGAffineTransform(translationX: translation, y: 0)
            path.apply(transform)
            mesurementPath.append(path)
            
            let layer = CAShapeLayer()
            layer.path = path.cgPath
            layer.lineWidth = self.lineWidth
            layer.strokeEnd = 0
            layer.strokeColor = self.startColor.cgColor
            layer.fillColor = UIColor.clear.cgColor
            layer.isGeometryFlipped = true
            layer.frame = bounds
        
            self.layer.addSublayer(layer)
            shapeLayers.append(layer)
        }
    }
    
    
    // MARKS: Apply color to Animation
    private func applyColors(first: UIColor, second: UIColor) {
        
        var firstRed: CGFloat = 0; var secondRed: CGFloat = 0
        var firstGreen: CGFloat = 0; var secondGreen: CGFloat = 0
        var firstBlue: CGFloat = 0; var secondBlue: CGFloat = 0
        var firstAlpha: CGFloat = 0; var secondAlpha: CGFloat = 0
        first.getRed(&firstRed, green: &firstGreen, blue: &firstBlue, alpha: &firstAlpha)
        
        second.getRed(&secondRed, green: &secondGreen, blue: &secondBlue, alpha: &secondAlpha)
        
        for (index, layer) in shapeLayers.enumerated() {

            let ratio = CGFloat(index) / CGFloat(shapeLayers.count)
            let newRed = secondRed * ratio + firstRed * (1 - ratio)
            let newGreen = secondGreen * ratio + firstGreen * (1 - ratio)
            let newBlue = secondBlue * ratio + firstBlue * (1 - ratio)
            let newAlpha = secondAlpha * ratio + firstAlpha * (1 - ratio)

            let color = UIColor(red: newRed, green: newGreen, blue: newBlue, alpha: newAlpha)
            layer.strokeColor = color.cgColor
        }
    }
    
    
    // MARKS: Declare font & Bezier
    private func bezierPath(from character: Character) -> UIBezierPath {

        /*GET ORIGINAL FONT
        let font = UIFont.systemFont(ofSize: 50)
        */
        let font = UIFont(name: "Pacifico", size: 50)!
        var unichars = [UniChar]("\(character)".utf16)
        var glyphs = [CGGlyph](repeating: 0, count: unichars.count)
        
        let gotGlyphs = CTFontGetGlyphsForCharacters(font, &unichars, &glyphs, unichars.count)
        
        if gotGlyphs, let path = CTFontCreatePathForGlyph(font, glyphs[0], nil) {
                
                return UIBezierPath(cgPath: path)
        } else {
            
            return UIBezierPath()
        }
    }
    
    
    // MARKS: Declare animation
     private func animateLayers() {
        
        for (index, layer) in shapeLayers.enumerated() {
            
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.beginTime = CACurrentMediaTime() + CFTimeInterval(index) * 0.5
            animation.toValue = 1
            animation.duration = 1
            animation.fillMode = kCAFillModeForwards
            animation.isRemovedOnCompletion = false
            layer.add(animation, forKey: "animation")
        }
    }
    
    
}
