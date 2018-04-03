//
//  YKInvestProfitViewController.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2018/4/3.
//  Copyright © 2018年 hangzhouzhulongkeji. All rights reserved.
//

import UIKit

class YKInvestProfitViewController: YKBaseViewController {

    private var tableView:UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    fileprivate func setupUI(){
        let tableView:UITableView = UITableView(frame: CGRect(x:0,y:0,width:kScreenWidth,height:viewHeight), style: .plain)
        tableView.separatorStyle = .none
        self.view.addSubview(tableView)
        self.tableView = tableView
        let headerView = YKInvestProfitHeaderView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 237*kHeightScale))
        tableView.tableHeaderView = headerView
    }

    fileprivate func loadData(){
        
        
    }

    


}
