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
        
        if viewController.isKind(of: YKIncomeProfitViewController.self) {
            navigationController.navigationBar.setBackgroundImage(UIImage(named:"home_income_nav_bg"), for: .default)
        }else{
            //        设置通用导航栏背景图片
            navigationController.navigationBar.setBackgroundImage(UIImage(named:"navbar_background_image"), for: .default)
        }
        
        //        swift4
        navigationController.navigationBar.titleTextAttributes =  [NSAttributedStringKey.foregroundColor:UIColor.white,NSAttributedStringKey.font:UIFont.systemFont(ofSize: 17)]
        //   navigationController.navigationBar.titleTextAttributes = []
        //        设置通用返回按钮
        if self.viewControllers.count > 1 {
            
            let leftBarButtonItem = UIBarButtonItem(title:"", style: .plain, target: self, action: #selector(leftBarButtonItemAction))
            
            leftBarButtonItem.image = UIImage(named:"nav_back_leftArrow")?.withRenderingMode(.alwaysOriginal)
        
            viewController.navigationItem.leftBarButtonItem = leftBarButtonItem
        }
        
    }
    
    @objc private func leftBarButtonItemAction(){
        
        self.popViewController(animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
