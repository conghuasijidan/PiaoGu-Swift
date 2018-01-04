//
//  YKMarketViewController.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/12/28.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class YKMarketViewController: UIViewController,SDCycleScrollViewDelegate {

    private var tableView:UITableView? = nil
    private var cycleView:SDCycleScrollView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "市场"
        
        loadData()
        setupUI()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    fileprivate func loadData(){
             
        let url = "https://piaogood.com/1.0/promotion"
        
        Alamofire.request(url, method: .get).responseJSON { (response) in
            
            if let json = response.result.value {
                
                
                //                try catch 一下
                guard let promotions:Array = JSON(json)["promotions"].rawValue as? Array<Any> else{
                    
                    YKLog(message: "promotions 为空")
                    
                    return
                }
                
                //                字典转模型
                
                var arrM = [String]()
                
                for dict in promotions {
                    
                    let model =  YKMarketModel(dict:dict as! [String : Any])
                    
                    let  imgurl = qiniu + model.photo!
                    
                    arrM.append(imgurl)
                    
                }
                
//                因为已经tabviewHeader 无法进行数据源刷新，请求下来数据直接重新赋值
                
                self.cycleView?.imageURLStringsGroup = arrM

                
            }
            
            
        }
        
        
        
        
        
        
    }
    
    fileprivate func setupUI(){
        
        let tableView = UITableView(frame: CGRect(x:0,y:0,width:kScreenWidth,height:kScreenHeight), style: .plain)
        
        self.view .addSubview(tableView)
        self.tableView = tableView
        
        let cycleBgView:UIView = UIView(frame:CGRect(x:0,y:0,width:kScreenWidth,height:200*kHeightScale))
        
        tableView.tableHeaderView = cycleBgView
        
        
        let cycleScrollView:SDCycleScrollView = SDCycleScrollView(frame:CGRect(x:0,y:0,width:kScreenWidth,height:200*kHeightScale))
        
        cycleScrollView.delegate = self
        cycleScrollView.placeholderImage = UIImage(named:"market_advertisement_placeholder")
        cycleScrollView.backgroundColor = UIColor.yk_colorWithHex(hex: 0xf5f5f5)
        cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter
        cycleScrollView.currentPageDotColor = UIColor(white:1.0,alpha:0.9)
        cycleScrollView.pageDotColor = UIColor(white:1.0,alpha:0.6)

        cycleBgView.addSubview(cycleScrollView)
        
        self.cycleView = cycleScrollView
    }

    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
        YKLog(message: "点击了第\(index)张图片")
    }

}
