//
//  UIColor+Additionals.swift
//  CirclesAnimation
//
//  Created by MacBook on 16.08.2018.
//  Copyright © 2018 MacBook. All rights reserved.
//

import UIKit

extension UIColor {
    
    fileprivate static func hsba(_ hue: CGFloat, _ saturation: CGFloat, _ brightness: CGFloat, _ alpha: CGFloat) -> UIColor {
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
    }
    
    public func random() -> UIColor {
        return .hsba(CGFloat(arc4random() % 256) / 256, CGFloat(arc4random() % 128) / 256 + 0.5, CGFloat(arc4random() % 128) / 256 + 0.5, 1)
    }
}
