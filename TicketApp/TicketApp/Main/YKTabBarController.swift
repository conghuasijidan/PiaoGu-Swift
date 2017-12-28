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
        
        //        改变字体颜色234,23,63 UIColor.init()
        //         设置选中时的颜色
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor(red: 234/255, green: 23/255, blue: 63/255, alpha: 1)], for: UIControlState.selected)
        //        设置未选中时的颜色
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName:UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1)], for: .normal)
        
        //        self.tabBar.itemPositioning = .centered
        //         self.tabBar.itemWidth =
        //         self.tabBar.itemSpacing =
        
        //         设置背景图片
        self.tabBar.barTintColor = UIColor.white
    }

    func setChildViewController() -> () {
    
        let arr = [["className":"YKHomeViewController","title":"首页","imageName":"home_tabBar_normal","imageName_selected":"home_tabBar_selected"],
                   ["className":"YKMarketViewController","title":"市场","imageName":"market_tabBar_normal","imageName_selected":"market_tabBar_selected"],
                   ["className":"YKMeViewController","title":"我的","imageName":"me_tabBar_normal","imageName_selected":"me_tabBar_selected"]
        ];
        var arrM = [UIViewController]()
        
        for item in arr{
            
            guard let vc = self.createViewControllerWithDict(dict:item) else {
                return
            }
            
            arrM.append(vc)
        }
        //      print(arrM)
        self.viewControllers = arrM
        
    }
    
    func createViewControllerWithDict(dict:[String:String]) -> UIViewController?{
        
        let nameSpaceStr = self.getAPPName()
        
        guard let className = dict["className"] else {
            
            print("className的值为空")
            
            return nil
        }
        
        let classNameNS = nameSpaceStr + "." + className
        
        let viewController = NSClassFromString(classNameNS)! as! UIViewController.Type
        
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
