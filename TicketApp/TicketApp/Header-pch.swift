//
//  Header-pch.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/12/29.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

import Foundation

import SnapKit




let kScreenHeight = UIScreen.main.bounds.size.height

let kScreenWidth = UIScreen.main.bounds.size.width

let kStatusHeight = UIApplication.shared.statusBarFrame.size.height

let kHeightScale = (kScreenHeight - 113)/554.0

let kWidthScale = kScreenWidth/375.0

let qiniu = "http://ovc3poav6.bkt.clouddn.com/"

typealias CallBack = ()->Void






// 配置全局打印文件
func YKLog<M>(message: M, fileName: String = #file, methodName: String = #function, lineNumber:Int = #line)
{
//    不需要进行额外设置
    #if DEBUG
        print("\((fileName as NSString).pathComponents.last!).\(methodName)[第\(lineNumber)行]:\(message)")
    #endif
}
// 获取命名空间
func getAPPName() -> String{
    let nameKey = "CFBundleName"
    let appName = Bundle.main.object(forInfoDictionaryKey: nameKey) as? String
    return appName!
}

//当前系统版本
let kVersion = (UIDevice.current.systemVersion as NSString).floatValue

//是否: IOS 8以上
func is_IOS8() -> Bool { return (UIDevice.current.systemVersion as NSString).doubleValue >= 8.0 }





