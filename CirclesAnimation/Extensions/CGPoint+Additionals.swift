//
//  CGPoint+Additionals.swift
//  CirclesAnimation
//
//  Created by MacBook on 16.08.2018.
//  Copyright © 2018 MacBook. All rights reserved.
//

import Foundation

extension CGPoint {
    
    fileprivate static func position(_ x: CGFloat, _ y: CGFloat) -> CGPoint {
        return CGPoint(x: x, y: y)
    }
    
    //MARK: - Public Method
    public func random() -> CGPoint {
        return .position(CGFloat(arc4random()%1000), CGFloat(arc4random()%1000))
    }
}
