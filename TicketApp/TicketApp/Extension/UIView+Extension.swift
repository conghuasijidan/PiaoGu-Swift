//
//  UIView+extension.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/12/29.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    public var x:CGFloat{
        get{
            return self.frame.origin.x
        }
        set{
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
        
    }
    public var y:CGFloat{
        get{
            return self.frame.origin.y
        }
        set{
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
        
    }
    public var width:CGFloat{
        get{
            return self.frame.size.width
        }
        set{
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
        
    }
    public var height:CGFloat{
        get{
            return self.frame.size.height
        }
        set{
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
        
    }
    
    
}
