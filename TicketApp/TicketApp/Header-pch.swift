//
//  Header-pch.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/12/29.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

import Foundation
import SnapKit


//MARK:适配屏幕
var result: Bool = kScreenHeight == 812.0
let kScreenHeight = UIScreen.main.bounds.size.height
let kScreenWidth = UIScreen.main.bounds.size.width
let kStatusHeight = UIApplication.shared.statusBarFrame.size.height
let viewHeight = result ?(kScreenHeight-kStatusHeight-44-49):(kScreenHeight - kStatusHeight - 44)
let kHeightScale = result ? ((kScreenHeight - 171)/554.0):((kScreenHeight - 113)/554.0)
let yHeightScale = result ? (kScreenHeight/667.0):(kScreenHeight/667.0)
let kWidthScale = kScreenWidth/375.0

let qiniu = "http://ovc3poav6.bkt.clouddn.com/"

typealias CallBack = ()->Void
typealias StringCallBack = (_ paramater:String)->Void

//MARK:全局颜色




//MARK: 配置全局打印文件
func YKLog<M>(message: M, fileName: String = #file, methodName: String = #function, lineNumber:Int = #line)
{
//    不需要进行额外设置
    #if DEBUG
        print("\((fileName as NSString).pathComponents.last!).\(methodName)[第\(lineNumber)行]:\(message)")
    #endif
}
//MARK: 获取命名空间
func getAPPName() -> String{
    let nameKey = "CFBundleName"
    let appName = Bundle.main.object(forInfoDictionaryKey: nameKey) as? String
    return appName!
}

//当前系统版本
let kVersion = (UIDevice.current.systemVersion as NSString).floatValue

//是否: IOS 10以上
func is_IOS10() -> Bool { return (UIDevice.current.systemVersion as NSString).doubleValue >= 10.0 }

//是否: IOS 11以上
func is_IOS11() -> Bool { return (UIDevice.current.systemVersion as NSString).doubleValue >= 11.0 }

//是否: IOS 9以上
func is_IOS9() -> Bool { return (UIDevice.current.systemVersion as NSString).doubleValue >= 9.0 }

