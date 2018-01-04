//
//  UIColor+Extension.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/12/29.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    class func yk_colorWithHex(hex:UInt) -> UIColor {
        
        let red:UInt8 = UInt8((hex & 0xFF0000) >> 16);
        let green:UInt8 = UInt8((hex & 0x00FF00) >> 8);
        let blue:UInt8  = UInt8(hex & 0x0000FF);
        
        return UIColor.yk_colorWithRGB(red: red, green: green, blue: blue)
    }
    
    class func yk_colorWithHexAndA(hex:UInt,a:CGFloat) -> UIColor {
        
        let red:UInt8 = UInt8((hex & 0xFF0000) >> 16);
        let green:UInt8 = UInt8((hex & 0x00FF00) >> 8);
        let blue:UInt8  = UInt8(hex & 0x0000FF);
        
        return UIColor.yk_colorWithRGBA(red: red, green: green, blue: blue, a: a)
    }
    
    class  func yk_colorWithRGB(red:UInt8,green:UInt8,blue:UInt8) -> UIColor {
        
        let color = UIColor(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: 1.0)
        
        
        return color
    }
    
    class func yk_colorWithRGBA(red:UInt8,green:UInt8,blue:UInt8,a:CGFloat) -> UIColor {
        
        let color = UIColor(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: a)
        
        
        return color
    }
    
    class func yk_randomColor() -> UIColor {
        
        let red:UInt8 = UInt8(arc4random_uniform(256))
        let green:UInt8 = UInt8(arc4random_uniform(256))
        let blue:UInt8 = UInt8(arc4random_uniform(256))
        
        return UIColor.yk_colorWithRGB(red: red, green: green, blue: blue)

    }
    
    
    
}
