//
//  Animation.swift
//  CirclesAnimation
//
//  Created by MacBook on 15.08.2018.
//  Copyright © 2018 MacBook. All rights reserved.
//

import Foundation

struct Animation {
    
    let scale: ScaleAnimation!
    let opacity: OpacityAnimation?
    let duration: Float?
    var speed: Float?
    let isRemovedOnCompletion: Bool?
    let repeatCount: Float?
    
    init(scale: ScaleAnimation!, opacity: OpacityAnimation?, duration: Float?, speed: Float?, isRemovedOnCompletion: Bool?, repeatCount: Float?) {
        
        self.scale = scale
        self.opacity = opacity
        self.duration = duration
        self.speed = speed
        self.isRemovedOnCompletion = isRemovedOnCompletion
        self.repeatCount = repeatCount
    }
}

struct ScaleAnimation {
    
    let fromValue: CGFloat!
    let toValue: CGFloat!
    
    init(fromValue: CGFloat!, toValue: CGFloat!) {
        self.fromValue = fromValue
        self.toValue = toValue
    }
}

struct OpacityAnimation {
    
    let fromValue: CGFloat!
    let toValue: CGFloat!
    
    init(fromValue: CGFloat!, toValue: CGFloat!) {
        self.fromValue = fromValue
        self.toValue = toValue
    }
}
