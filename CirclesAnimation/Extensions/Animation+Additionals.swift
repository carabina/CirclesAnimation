//
//  Animation+Additionals.swift
//  CirclesAnimation
//
//  Created by MacBook on 15.08.2018.
//  Copyright © 2018 MacBook. All rights reserved.
//

import Foundation

private enum Animations {
    static let scale = "transform.scale"
    static let opacity = "opacity"
}

extension CABasicAnimation {
    
    //MARK: - Private Methods
    private func loadAnimation(keyPath: String?, fromValue: CGFloat?, toValue: CGFloat?) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: keyPath)
        animation.fromValue = fromValue
        animation.toValue = toValue
        return animation
    }
    
    //MARK: - Public Methods
    public func loadScaleAnimation(fromValue: CGFloat?, toValue: CGFloat?) -> CABasicAnimation {
        return loadAnimation(keyPath: Animations.scale, fromValue: fromValue, toValue: toValue)
    }
    
    public func loadOpacityAnimation(fromValue: CGFloat?, toValue: CGFloat?) -> CABasicAnimation{
        return loadAnimation(keyPath: Animations.opacity, fromValue: fromValue, toValue: toValue)
    }
}

extension CAAnimationGroup {
    
    public func loadAnimationGroup(layer: CAShapeLayer, scale: CABasicAnimation, opacity: CABasicAnimation, duration: Float?, speed: Float?, repeatCount: Float?, isRemovedOnCompletion: Bool) -> CAAnimationGroup {
        
        let animGroup = CAAnimationGroup()
        animGroup.duration = CFTimeInterval(duration!)
        animGroup.speed = speed!
        animGroup.repeatCount = repeatCount!
        animGroup.animations = [scale, opacity]
        animGroup.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        animGroup.setValue(layer, forKey: "waveLayer")
        animGroup.isRemovedOnCompletion = isRemovedOnCompletion
        return animGroup
    }
}
