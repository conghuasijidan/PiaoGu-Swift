//
//  YKCommentModel.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2018/5/22.
//  Copyright © 2018年 hangzhouzhulongkeji. All rights reserved.
//

import UIKit

class YKCommentModel: NSObject {
    @objc var content:String?
    @objc var id:String?
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
