//
//  YKBaseViewController.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2018/4/2.
//  Copyright © 2018年 hangzhouzhulongkeji. All rights reserved.
//


import UIKit

class YKBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       fpsTest()
    }
    
    // 检测FPS
    func fpsTest(){
       let fpsLabel:YYFPSLabel = YYFPSLabel()
        fpsLabel.frame = CGRect(x: self.view.center.x-25, y: self.view.center.y, width: 50, height: 30)
        fpsLabel.sizeToFit()
        let window = UIApplication.shared.keyWindow
        window?.addSubview(fpsLabel)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //   MARK:隐藏tabbar 如果每个二级界面都要隐藏tabbar 的话，抽取基类会比较方便
    override func viewWillAppear(_ animated: Bool) {
        
        if self.navigationController?.viewControllers.count ?? 0 > 1 {
            self.tabBarController?.tabBar.isHidden = true
        }else{
            self.tabBarController?.tabBar.isHidden = false
        }
    }
    //    相当于OC的dealloc 方法
    deinit{
        YKLog(message: "我被销毁了")
    }

}
