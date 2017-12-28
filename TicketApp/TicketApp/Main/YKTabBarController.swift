//
//  YKTabBarController.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/12/27.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

import UIKit

class YKTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white;
        
        self.setChildViewController()
        
       
        
        
        
    }

    func setChildViewController() -> () {
    
//        let nameSpace = self.getAPPName()
        
//        print(nameSpace)
        let arr = [["className":"TicketApp.YKHomeViewController","title":"首页","imageName":"home_tabBar_normal","imageName_selected":"home_tabBar_selected"],
                   ["className":"TicketApp.YKMarketViewController","title":"市场","imageName":"market_tabBar_normal","imageName_selected":"home_tabBar_selected"],
                   ["className":"TicketApp.YKMeViewController","title":"我的","imageName":"me_tabBar_normal","imageName_selected":"me_tabBar_selected"]
        ];
        var arrM = [UIViewController]()
        
        for item in arr{
            
            let vc = self.createViewControllerWithDict(dict:item)
            
            arrM.append(vc)
        }
//      print(arrM)
      self.viewControllers = arrM
        
    }
    
    func createViewControllerWithDict(dict:[String:String]) -> UIViewController{
        
    
        let className:AnyClass = NSClassFromString(dict["className"]!)!
        
        let viewController = className as! UIViewController.Type
        
        let vc = viewController.init()
        
        vc.title = dict["title"]
        
        vc.tabBarItem.image = UIImage(named:dict["imageName"]!)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        vc.tabBarItem.selectedImage = UIImage(named:dict["imageName_selected"]!)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal);
        
        let navVC =  YKNavigationViewController(rootViewController:vc)
        
        return navVC
    }
    
    func getAPPName() -> String{
        let nameKey = "CFBundleName"
        let appName = Bundle.main.object(forInfoDictionaryKey: nameKey) as? String   //这里也是坑，请不要翻译oc的代码，而是去NSBundle类里面看它的api
        return appName!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
