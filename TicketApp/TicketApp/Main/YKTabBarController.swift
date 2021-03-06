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
        //       swift3.2  设置选中时的颜色
        //        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor(red: 234/255, green: 23/255, blue: 63/255, alpha: 1)], for: UIControlState.selected)
        //        设置未选中时的颜色
        //        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName:UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1)], for: .normal)
        
//        swift 4.0
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1)], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor(red: 234/255, green: 23/255, blue: 63/255, alpha: 1)], for: .selected)
        
        //        self.tabBar.itemPositioning = .centered
        //         self.tabBar.itemWidth =
        //         self.tabBar.itemSpacing =
        
        //         设置背景图片
        self.tabBar.barTintColor = UIColor.white
    }
    
    private func setChildViewController() -> () {
        
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
    
    private  func createViewControllerWithDict(dict:[String:String]) -> UIViewController?{
        
        let nameSpaceStr = getAPPName()
        
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
 
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
