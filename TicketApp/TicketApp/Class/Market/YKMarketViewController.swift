//
//  YKMarketViewController.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/12/28.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

import UIKit

class YKMarketViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
         self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        
        setupUI()
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    fileprivate   func loadData(){
        
        
    }
    
    fileprivate   func setupUI(){
        
        let view = UIView(frame:CGRect(x:0,y:0,width:375*kWidthScale,height:554*kWidthScale))
        view.backgroundColor = UIColor.orange
        self.view .addSubview(view)
        
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
