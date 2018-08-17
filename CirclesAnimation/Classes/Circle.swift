//
//  Circle.swift
//  CirclesAnimation
//
//  Created by MacBook on 15.08.2018.
//  Copyright © 2018 MacBook. All rights reserved.
//

import Foundation

struct Circle {
    
    let size: CGFloat!
    let position: CGPoint!
    let strokeColor: UIColor?
    let fillColor: UIColor?
    let lineWidth: CGFloat?
    
    init(size: CGFloat!, position: CGPoint!, strokeColor: UIColor?, fillColor: UIColor?, lineWidth: CGFloat?) {
        
        self.size = size
        self.position = position
        self.strokeColor = strokeColor
        self.fillColor = fillColor
        self.lineWidth = lineWidth
    }
}
