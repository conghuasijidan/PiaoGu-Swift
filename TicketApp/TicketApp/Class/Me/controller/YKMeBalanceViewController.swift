//
//  YKMeBalanceViewController.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2018/3/30.
//  Copyright © 2018年 hangzhouzhulongkeji. All rights reserved.
//

import UIKit

class YKMeBalanceViewController: YKBaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    private var tableView:UITableView?
    private let balanceCellID = "balanceCellID"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "余额"
        setRightButtonItem()
        
        setupUI()
    }

    fileprivate func loadData(){
        
        
    }
    fileprivate func setRightButtonItem (){
        let button:UIButton = UIButton()
        button.setTitle("明细", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14*kHeightScale)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(rightItemAction), for: .touchUpInside)
        let rightButtonItem:UIBarButtonItem = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = rightButtonItem
    }
    
    fileprivate func setupUI(){
        
        let tableView = UITableView(frame: CGRect(x:0,y:0,width:kScreenWidth,height:self.view.bounds.height), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(YKBalanceTableViewCell.self, forCellReuseIdentifier: balanceCellID)
        tableView.rowHeight = 50*kHeightScale
        tableView.separatorStyle = .none
        self.view.addSubview(tableView)
        self.tableView = tableView
        headerView()
    }
    func headerView() {
        let headerView:UIView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 120*kHeightScale))
        headerView.backgroundColor = UIColor.init(patternImage: UIImage(named:"home_balance_bg")!)
        headerView.addSubview(self.descLabel)
        headerView.addSubview(self.accountLable)
        headerView.addSubview(self.lineView)
        self.descLabel.snp.makeConstraints { (make) in
            make.left.equalTo(headerView).offset(20*kWidthScale)
            make.top.equalTo(headerView).offset(20*kHeightScale)
        }
        self.accountLable.snp.makeConstraints { (make) in
            make.left.equalTo(self.descLabel)
            make.top.equalTo(self.descLabel.snp.bottom).offset(10*kHeightScale)
        }
        self.lineView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(headerView)
            make.height.equalTo(10*kHeightScale)
        }
        
        self.tableView?.tableHeaderView = headerView
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:YKBalanceTableViewCell = tableView.dequeueReusableCell(withIdentifier: balanceCellID, for: indexPath) as! YKBalanceTableViewCell
        switch indexPath.row {
        case 0:
            cell.iconImage = UIImage(named:"home_balance_topup_icon")
            cell.descText = "充值"
            break
        default:
            cell.iconImage = UIImage(named:"home_balance_cash_icon")
            cell.descText = "提现"
            break
        }
        
        return cell
        
    }
    @objc private func rightItemAction(){
        YKLog(message: "跳转明细")
        let vc = YKItemizeViewController()
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    private lazy var descLabel:UILabel = {
        let label:UILabel = UILabel.yk_createLabel(text: "账户余额（元）", textColor: 0xfcd9d5, fontSize: 12*kHeightScale)
        return label
    }()
    private lazy var accountLable:UILabel = {
        let label:UILabel = UILabel.yk_createLabel(text: "99999.99", textColor: 0xffffff, fontSize: 36*kHeightScale)
        return label
    }()
    private lazy var lineView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.yk_colorWithHex(hex: 0xf5f5f5)
        return view
    }()




}
