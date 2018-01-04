//
//  UILabel+extension.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/12/29.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

import Foundation
import UIKit

extension UILabel{
    
    class func yk_createLabel(text:String,textColor:UInt,fontSize:CGFloat) ->  UILabel{
        
        let label = UILabel()
        label.text = text
        label.textColor = UIColor.yk_colorWithHex(hex: textColor)
        label.font = UIFont.systemFont(ofSize: fontSize)
        return label
    }
    
    
    
    
}
