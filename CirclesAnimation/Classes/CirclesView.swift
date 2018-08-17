//
//  CirclesView.swift
//  CirclesAnimation
//
//  Created by MacBook on 15.08.2018.
//  Copyright © 2018 MacBook. All rights reserved.
//

import UIKit

@IBDesignable final public class CirclesView: UIView {

    private var circle: Circle!
    private var animation: Animation!
    private var scaleAnimation: ScaleAnimation!
    private var opacityAnimation: OpacityAnimation?
    private var circleLayer = CAShapeLayer()
    private var timer: Timer!
    
    //MARK: Properties
    //MARK: - Drawing A Circle
    @IBInspectable public var size: CGFloat = 10 {
        didSet {
            redraw()
        }
    }

    @IBInspectable public var circleAddIntervale: CGFloat = 0.15 {
        didSet {
            timer.invalidate()
            checkNumberOfCircles()
        }
    }
    
    @IBInspectable public var muchCircles: Bool = true {
        didSet {
            checkNumberOfCircles()
        }
    }
    
    @IBInspectable public var fillColor: UIColor = .clear {
        didSet {
            redraw()
        }
    }
    
    @IBInspectable public var lineWidth: CGFloat = 3 {
        didSet {
            redraw()
        }
    }
    
    public var position: CGPoint? {
        didSet {
            redraw()
        }
    }
    
    
    public var strokeColor: UIColor? {
        didSet {
            redraw()
        }
    }
    
    //MARK: - Animations
    @IBInspectable public var animationWithDuration: Float = 10 {
        didSet {
            redraw()
        }
    }
    
    @IBInspectable public var animationSpeed: Float = 7 {
        didSet {
            redraw()
        }
    }
    
    @IBInspectable public var animationRepeatCount: Float = 0 {
        didSet {
            redraw()
        }
    }
    
    @IBInspectable public var isRemovedOnCompletion: Bool = true {
        didSet {
            redraw()
        }
    }
    
    //Properties for Scale Animation
    @IBInspectable public var scaleFromValue: CGFloat = 0.2 {
        didSet {
            redraw()
        }
    }
    
    @IBInspectable public var scaleToValue: CGFloat = 1 {
        didSet {
            redraw()
        }
    }
    
    //Properties for Opacity Animation
    @IBInspectable public var opacityFromValue: CGFloat = 0.4 {
        didSet {
            redraw()
        }
    }
    
    @IBInspectable public var opacityToValue: CGFloat = 0.9 {
        didSet {
            redraw()
        }
    }

    //MARK: - Initial Methods
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        checkNumberOfCircles()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        checkNumberOfCircles()
    }
    
    //MARK: - Private Methods
    //MARK: - Create Circle Layer
    
    /**
    Filling all values for a circle
    */
    private func createCircleLayer(withPath path: UIBezierPath) {
        
        circleLayer = CAShapeLayer()
        circleLayer.frame = CGRect(x: 0, y: 0, width: circle.size*2, height: circle.size*2)
        circleLayer.path = path.cgPath
        circleLayer.position = circle.position
        circleLayer.strokeColor = circle.strokeColor?.cgColor
        circleLayer.fillColor = circle.fillColor?.cgColor
        circleLayer.lineWidth = circle.lineWidth!
        circleLayer.position = circle.position
        circleLayer.cornerRadius = circleLayer.frame.size.width/2
        circleLayer.masksToBounds = true
        layer.addSublayer(circleLayer)
    }
    
    /**
    If the "muchCircles" is true, then the position of the circles is random, otherwise the position of the circle will be in the center of the view
    */
    private func generatePosition() -> CGPoint {
        let circlePosition = muchCircles ? CGPoint().random() : CGPoint(x: bounds.size.width/2, y: bounds.size.height/2)
        return circlePosition
    }
   
    /**
     If the "circles" is true, then the timer of the tears by the interval adds circles, otherwise one circle will be displayed
     */
    private func checkNumberOfCircles() {
        if muchCircles {
            timer = Timer.scheduledTimer(timeInterval: TimeInterval(circleAddIntervale), target: self, selector: #selector(setup), userInfo: nil, repeats: true)
        } else {
            if timer.isValid {
                timer.invalidate()
            }
            redraw()
        }
    }
    
    /**
     If you change any of the values for the circle - redraw it
     */
    private func redraw() {
        circleLayer.removeFromSuperlayer()
        setup()
    }
    
    @objc private func setup() {
        
        circle = Circle(size: size, position: position ?? generatePosition(), strokeColor: strokeColor ?? UIColor().random(), fillColor: fillColor, lineWidth: lineWidth)
        
        let center = CGPoint(x: circle.size, y: circle.size)
        let path = UIBezierPath(arcCenter: center, radius: CGFloat(circle.size), startAngle: 0, endAngle: CGFloat(circle.size) * .pi, clockwise: true)
        
        createCircleLayer(withPath: path)
        loadAnimation()
    }
    
    //Create Animations

    private func createAnimationModel() {
        scaleAnimation = ScaleAnimation(fromValue: scaleFromValue, toValue: scaleToValue)
        opacityAnimation = OpacityAnimation(fromValue: opacityFromValue, toValue: opacityToValue)
        animation = Animation(scale: scaleAnimation, opacity: opacityAnimation, duration: animationWithDuration, speed: animationSpeed, isRemovedOnCompletion: isRemovedOnCompletion, repeatCount: animationRepeatCount)
    }
    
    private func createAnimationGroup() {
        
        let scale = CABasicAnimation().loadScaleAnimation(fromValue: scaleAnimation.fromValue, toValue: scaleAnimation.toValue)
        let opacity = CABasicAnimation().loadOpacityAnimation(fromValue: opacityAnimation?.fromValue, toValue: opacityAnimation?.toValue)
        let animations = CAAnimationGroup().loadAnimationGroup(layer: circleLayer, scale: scale, opacity: opacity, duration: animation.duration, speed: animation.speed, repeatCount: animation.repeatCount, isRemovedOnCompletion: animation.isRemovedOnCompletion!)
        animations.delegate = self
        circleLayer.add(animations, forKey: "animations")
    }
    
    private func loadAnimation() {
        createAnimationModel()
        createAnimationGroup()
    }
}

//MARK:  - Animation Delegate
extension CirclesView: CAAnimationDelegate {
    
    /**
     If the "isRemovedOnCompletion" is true, then this method will be called
     */
    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if let waveLayer = anim.value(forKey: "waveLayer") as? CAShapeLayer {
            waveLayer.removeFromSuperlayer()
        }
    }
}
