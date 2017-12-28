//
//  YKNavigationViewController.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/12/27.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

import UIKit

class YKNavigationViewController: UINavigationController,UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
       self.delegate = self
        
        
        
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
//        设置通用导航栏背景图片
        navigationController.navigationBar.setBackgroundImage(UIImage(named:"navbar_background_image"), for: .default)
        
        navigationController.navigationBar.isTranslucent = false
        
        navigationController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white,NSFontAttributeName:UIFont.systemFont(ofSize: 17)]
        
//        设置通用返回按钮
        if self.viewControllers.count > 1 {
            
            let leftBarButtonItem = UIBarButtonItem(title:"", style: .plain, target: self, action: #selector(leftBarButtonItemAction))
            
            leftBarButtonItem.image = UIImage(named:"nav_back_leftArrow")?.withRenderingMode(.alwaysOriginal)
            
            viewController.navigationItem.leftBarButtonItem = leftBarButtonItem
        }
        
    }
    
   func leftBarButtonItemAction(){
        
        self.popViewController(animated: true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
