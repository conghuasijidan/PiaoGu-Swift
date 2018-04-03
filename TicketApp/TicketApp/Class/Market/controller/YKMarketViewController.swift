//
//  YKMarketViewController.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/12/28.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

import UIKit
import MJRefresh
import SwiftyJSON

class YKMarketViewController: YKBaseViewController,UITableViewDelegate,UITableViewDataSource {
    private let marketCellID = "marketCellID"
    private var tableView:UITableView?
    private var headerView:YKMarketHeaderView?
    private var modelList:[YKMarketModel2]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "市场"
        
       
        setupUI()
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    fileprivate func loadData(){
        YKNetWorkData.shareInstance.getPromotion(success: { (resonse) in
            self.headerView?.imgUrl = resonse
            
            let arr =
                [["name":"新白鹿","desc":"杭州知名中餐连锁餐厅，成立于1998年，广受长三角人民喜爱和好评，我们都喜欢，大家好才是真的好。"],["name":"新白鹿","desc":"杭州知名中餐连锁餐厅，成立于1998年，广受长三角人民喜爱和好评"],["name":"新白鹿","desc":"杭州知名中餐连锁餐厅，成立于1998年"],["name":"新白鹿","desc":"杭州知名中餐连锁餐厅，成立于1998年，广受长三角人民喜爱和好评，我们都喜欢，大家好才是真的好。"],["name":"新白鹿","desc":"杭州知名中餐连锁餐厅，成立于1998年，广受长三角人民喜爱和好评，我们都喜欢，大家好才是真的好。"],]
            var arrM = [YKMarketModel2]()
            for value in arr{
                let model:YKMarketModel2 = YKMarketModel2(dict:value)
                arrM.append(model)
            }
            self.modelList = arrM
            self.tableView?.reloadData()
        })
        
        
        
        
    }
    
    fileprivate func setupUI(){
        
        let tableView = UITableView(frame: CGRect(x:0,y:0,width:kScreenWidth,height:viewHeight), style: .plain)
        self.view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(YKMarketTableViewCell.self, forCellReuseIdentifier: marketCellID)
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 300
        tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView = tableView
        let headerView:YKMarketHeaderView = YKMarketHeaderView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 320*kHeightScale))
        tableView.tableHeaderView = headerView
        self.headerView = headerView
        
        let header = MJRefreshNormalHeader()
        let fooder = MJRefreshBackNormalFooter()
        header.setRefreshingTarget(self, refreshingAction: #selector(YKMarketViewController.refreshData))
        fooder.setRefreshingTarget(self, refreshingAction: #selector(YKMarketViewController.loadMore))
        tableView.mj_header = header
        tableView.mj_footer = fooder
    }

    //   MARK:tableview 协议
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.modelList?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:YKMarketTableViewCell = tableView.dequeueReusableCell(withIdentifier:marketCellID, for: indexPath) as! YKMarketTableViewCell
        cell.selectionStyle = .none
        cell.model = self.modelList?[indexPath.row]
        return cell
    }
    //    MARK:刷新
   @objc private func refreshData(){
        YKLog(message: "下拉刷新")
        Thread.sleep(forTimeInterval: 2.0)
        self.tableView?.mj_header.endRefreshing()
    }
   @objc private func loadMore(){
       YKLog(message:"上拉加载")
    Thread.sleep(forTimeInterval: 2.0)
    self.tableView?.mj_footer.endRefreshing()
    }

}
