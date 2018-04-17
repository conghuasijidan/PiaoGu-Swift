//
//  YKInvestProfitViewController.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2018/4/3.
//  Copyright © 2018年 hangzhouzhulongkeji. All rights reserved.
//

import UIKit

class YKInvestProfitViewController: YKBaseViewController,UITableViewDataSource,UITableViewDelegate {
    private let investCellID = "investCellID"
    private var tableView:UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "投资宝收益"
        let rightButton:UIButton = UIButton(frame:CGRect(x: 0, y: 0, width: 30*kHeightScale, height: 30*kHeightScale))
        rightButton.setTitle("记录", for: .normal)
        rightButton.titleLabel?.font = UIFont.systemFont(ofSize: 14*kHeightScale)
        rightButton.addTarget(self, action: #selector(rightItemAction), for: .touchUpInside)
        rightButton.setTitleColor(UIColor.white, for: .normal)
        let rightItem = UIBarButtonItem(customView: rightButton)
        self.navigationItem.rightBarButtonItem = rightItem
        
        setupUI()
    }
    
    fileprivate func setupUI(){
        let height = result ? viewHeight:(viewHeight+49)
        
        let tableView:UITableView = UITableView(frame: CGRect(x:0,y:0,width:kScreenWidth,height:height), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(YKInvestProfitTableViewCell.self, forCellReuseIdentifier: investCellID)
        tableView.rowHeight = 135*kHeightScale
        tableView.separatorStyle = .none
        self.view.addSubview(tableView)
        self.tableView = tableView
        let headerView = YKInvestProfitHeaderView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 237*kHeightScale))
         headerView.bgImage = UIImage(named:"home_invest_header_bg")
        tableView.tableHeaderView = headerView
       
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:YKInvestProfitTableViewCell = tableView.dequeueReusableCell(withIdentifier: investCellID, for: indexPath) as!YKInvestProfitTableViewCell
        cell.selectionStyle = .none
        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 跳转产品详情
        let vc = YKMarketDetailViewController()
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    //    MARK:记录点击事件
   @objc fileprivate func rightItemAction(){
        YKLog(message: "记录点击事件")
    
        let vc = YKRecordViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    
        
    }
    //    MARK:加载数据
    fileprivate func loadData(){
        
        
    }

    


}
