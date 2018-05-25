//
//  YKNetWorkData.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2018/3/26.
//  Copyright © 2018年 hangzhouzhulongkeji. All rights reserved.
//

import UIKit
import SwiftyJSON
import SVProgressHUD

class YKNetWorkData: NSObject {
    
    let getPromotionUrl = "https://piaogood.com/1.0/promotion"
    
    
    static let shareInstance = YKNetWorkData()
    private override init() {}
    
    func getPromotion(success:@escaping (_ response:[String])->(),failure:@escaping (_ response:[String]?)->()){
//       SVProgressHUD.setBackgroundColor(UIColor.clear)
        SVProgressHUD.setForegroundColor(UIColor.orange)
        SVProgressHUD.show()
        var arrM = [String]()
        YKNetWorkTool.shareInstance.getRequest(urlStr: getPromotionUrl, parameters: nil, success: { (response) in
            
            
            guard let promotions:Array = JSON(response)["promotions"].rawValue as? Array<Any> else{
                
                YKLog(message: "请求数据 为空")
                
                return
            }
            
            //  字典转模型
            
            for dict in promotions {
                
                let model:YKMarketModel =  YKMarketModel(dict:dict as! [String : AnyObject])
                
                let imgUrl = qiniu + model.photo!
                
                arrM.append(imgUrl)
                
            }
            success(arrM)
//            failure(nil)
            SVProgressHUD.dismiss()
        }) { (error) in
            YKLog(message: "请求失败")
            YKLog(message: error)
            failure(nil)
            SVProgressHUD.dismiss()
        }
        
    }
    
    
}
