//
//  YKSlider.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2018/4/8.
//  Copyright © 2018年 hangzhouzhulongkeji. All rights reserved.
//

import UIKit

class YKSlider: UISlider {
    // 设置最大值
//    override func maximumValueImageRect(forBounds bounds: CGRect) -> CGRect {
//
//        return CGRect(x: 0, y: 0, width:self.frame.width/2,height:self.frame.height/2)
//
//    }
    //    设置最小值
//    override func minimumValueImageRect(forBounds bounds: CGRect) -> CGRect {
//        return CGRect(x: 0, y: 0, width:self.frame.width,height:self.frame.height)
//    }
   //    设置滑块的触摸范围
//    override func thumbRect(forBounds bounds: CGRect, trackRect rect: CGRect, value: Float) -> CGRect {
//
//        return
//    }
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: 0, y: 0, width: self.frame.width, height: 5*kHeightScale)
    }
    
}

