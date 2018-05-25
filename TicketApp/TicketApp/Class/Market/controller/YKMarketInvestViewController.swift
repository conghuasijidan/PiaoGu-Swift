//
//  YKMarketInvestViewController.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2018/4/8.
//  Copyright © 2018年 hangzhouzhulongkeji. All rights reserved.
//

import UIKit

class YKMarketInvestViewController: YKBaseViewController,UITableViewDataSource,UITableViewDelegate {
    private let INVESTCELLID = "investCellID"
    
    private var tableView:UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "投资宝"
        self.view.backgroundColor = UIColor.white
        setupUI()
    }
    
    fileprivate func setupUI(){
//        let height = result ? (viewHeight - 34):viewHeight;
        let tableView:UITableView = UITableView(frame: CGRect(x:0,y:0,width:kScreenWidth,height:viewHeight), style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(YKMarketInvestTableViewCell.self, forCellReuseIdentifier: INVESTCELLID)
        tableView.separatorStyle = .none
        tableView.rowHeight = 135*kHeightScale
        self.view.addSubview(tableView)
        self.tableView = tableView
        let headerView = UIView(frame: CGRect(x:0,y:0,width:kWidthScale,height:70*kHeightScale))
        headerView.backgroundColor = UIColor.yk_colorWithHex(hex: 0xf5f5f5)
        headerView.addSubview(self.titleLabel)
        headerView.addSubview(self.descLabel)
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(headerView).offset(10*kWidthScale)
            make.top.equalTo(headerView).offset(10*kHeightScale)
        }
        self.descLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.titleLabel)
            make.right.equalTo(headerView).offset(-10*kWidthScale)
            make.top.equalTo(self.titleLabel.snp.bottom).offset(5*kHeightScale)
        }
        
        tableView.tableHeaderView = headerView
        
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:YKMarketInvestTableViewCell = tableView.dequeueReusableCell(withIdentifier: INVESTCELLID, for: indexPath) as! YKMarketInvestTableViewCell
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
        let vc = YKMarketDetailViewController()
        
        self.navigationController?.pushViewController(vc, animated: true)
    }

    private lazy var titleLabel:UILabel = {
        let label = UILabel.yk_createLabel(text: "产品介绍", textColor: 0x666666, fontSize: 12*kHeightScale)
        return  label
    }()
    private lazy var descLabel:UILabel = {
        let label = UILabel.yk_createLabel(text: "商家以一定定额年息，获取粉丝投资资金，以不同时间段为单位发行不同的产品。投资散户可以选择以现金+代金券的形式保证年化收益保本息。", textColor: 0x999999, fontSize: 10*kHeightScale)
            label.numberOfLines = 0
        return label
    }()

   

}
