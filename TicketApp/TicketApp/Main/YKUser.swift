//
//  YKUser.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2018/4/17.
//  Copyright © 2018年 hangzhouzhulongkeji. All rights reserved.
//

import UIKit

class YKUser: NSObject,NSCoding {

   @objc var accessToken:String?
   @objc var userID:String?
   @objc var userName:String?
   @objc var avatarImage:UIImage?
    
//    设置单例
//    let  shareUser = YKUser(dict:nil)
    
     init(dict:[String:AnyObject]?) {
        super.init()
        if dict == nil{
            return
        }
        setValuesForKeys(dict!)
    }
//    字典转模型
    override func setValue(_ value: Any?, forKey key: String) {
        super.setValue(value, forKey: key)
        
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
//    归档存储
//    对象属性归档
    func encode(with aCoder: NSCoder) {
        aCoder.encode(accessToken, forKey: "accessToken")
        aCoder.encode(userID, forKey: "userID")
        aCoder.encode(userName, forKey: "userName")
        aCoder.encode(avatarImage, forKey: "avatarImage")
        
    }
//    对象属性解档
    required init?(coder aDecoder: NSCoder) {
        super.init()
        accessToken = aDecoder.decodeObject(forKey: "accessToken") as? String
        userID = aDecoder.decodeObject(forKey:"userID") as? String
        userName = aDecoder.decodeObject(forKey:"userName") as? String
        avatarImage = aDecoder.decodeObject(forKey: "avatarImage") as? UIImage
        
    }
    
//    保存用户数据
    func saveUserInfo(user:YKUser) {
        
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last
//        拼接存储路径
        let filePath = (path! as NSString).appendingPathComponent("user.plist")
//        存储
        NSKeyedArchiver.archiveRootObject(user, toFile: filePath )
        
        
    }
    
    
    
//    获取用户数据
    func getUserInfo() -> YKUser? {
        
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last
        //        拼接存储路径
         let filePath = (path! as NSString).appendingPathComponent("user.plist")
        
        let user = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? YKUser
        
        return user
        
    }
   
    //    判断是否登录
    func islogin() -> Bool {
        
        return self.getUserInfo() != nil
        
      
    }
    
    
}

