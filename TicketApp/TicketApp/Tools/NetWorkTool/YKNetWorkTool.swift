//
//  YKNetWorkTool.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2018/1/5.
//  Copyright © 2018年 hangzhouzhulongkeji. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
class YKNetWorkTool: NSObject {

     static let shareInstance = YKNetWorkTool()
     private override init() {}
    
    @available(iOS 9.0,*)
    func getRequest(urlStr:String,parameters:[String:Any]?,success:@escaping (_ response:[String:Any])->(),failture:@escaping (_ error:Error)->())  {
    
        Alamofire.request(urlStr, method: .get, parameters: parameters).responseJSON { (response) in

            switch response.result {

            case .success(let value):
                //当响应成功是，使用临时变量value接受服务器返回的信息并判断是否为[String: AnyObject]类型 如果是那么将其传给其定义方法中的success

                success(value as! [String : Any])

                let json = JSON(value)

                YKLog(message: json)

            case .failure(let error):

                failture(error)

                YKLog(message: "请求失败，error:\(error)")
            }

        }
   
    }
    @available(iOS 9.0,*)
    func postRequest(urlStr:String,parameters:[String:Any]?,success:@escaping(_ response:[String:Any])->(),failture:@escaping(_ error:Error)->()) {
        
        Alamofire.request(urlStr, method: .post, parameters: parameters).responseJSON { (response) in

            switch response.result {

            case .success(let value):
                //当响应成功是，使用临时变量value接受服务器返回的信息并判断是否为[String: AnyObject]类型 如果是那么将其传给其定义方法中的success

                success(value as! [String : Any])

                let json = JSON(value)

                YKLog(message: json)

            case .failure(let error):

                failture(error)

                YKLog(message: "请求失败，error:\(error)")
            }

        }

    }
    
    
    
    
}
