//
//  YKMarketModel2.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2018/3/29.
//  Copyright © 2018年 hangzhouzhulongkeji. All rights reserved.
//

import UIKit

class YKMarketModel2: NSObject {
    @objc var name:String?
    @objc var desc:String?
    
    //     kvc 转模型
    init(dict : [String : Any]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        super.setValue(value, forKey: key)
    }
    
    //    防止找不到对应的key崩盘
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
