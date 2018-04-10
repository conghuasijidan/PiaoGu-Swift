//
//  YKHomeViewController.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/12/28.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

import UIKit
import MJRefresh
import SVProgressHUD

class YKHomeViewController: YKBaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    private let userCellID = "homeUserCellID"
    private let accountCellID = "homeAccountCellID"
    private let profitCellID = "homeProfitCellID"
    
    private var tableView:UITableView? = nil
    
    override func viewSafeAreaInsetsDidChange() {
        //        YKLog(message: "安全区域")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        self.loadData()
        self.setupUI()
        
    }
    
    
    
    fileprivate  func setupUI(){
        
        let tableView = UITableView(frame: CGRect(x:0,y:0,width:kScreenWidth,height:viewHeight), style: .plain)
        
        tableView.delegate = self
        
        tableView.dataSource = self
        
        tableView.separatorStyle = .none
        
        tableView.register(YKHomeUserTableViewCell.self, forCellReuseIdentifier: userCellID)
        
        tableView.register(YKHomeAccountTableViewCell.self, forCellReuseIdentifier: accountCellID)
        
        tableView.register(YKHomeProfitTableViewCell.self, forCellReuseIdentifier: profitCellID)
        
        tableView.rowHeight = UITableViewAutomaticDimension
        //    关闭self-sizing 默认开启估算行高，通过设置下面三种高度估算为0，关闭self-sizing
        
        tableView.estimatedRowHeight = 0
        tableView.estimatedSectionHeaderHeight = 0;
        tableView.estimatedSectionFooterHeight = 0;
        
        self.view .addSubview(tableView)
        self.tableView = tableView
        let header = MJRefreshNormalHeader()
//        下拉刷新后复位
/*       MJRefreshBackNormalFooter() 和MJRefreshNormalFooter() 区别：
         MJRefreshBackNormalFooter() 刷新后不会恢复原位
         MJRefreshNormalFooter() 会恢复原位
 */
//        let fooder = MJRefreshBackNormalFooter()
        let footer = MJRefreshBackNormalFooter()
        header.setRefreshingTarget(self, refreshingAction: #selector(YKHomeViewController.refreshData))
        footer.setRefreshingTarget(self, refreshingAction: #selector(YKHomeViewController.loadMore))
        tableView.mj_header = header
        tableView.mj_footer = footer
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        if indexPath.row == 0 {
            
            let cell:YKHomeUserTableViewCell = tableView.dequeueReusableCell(withIdentifier: userCellID, for: indexPath) as! YKHomeUserTableViewCell
            
            cell.messageCallBack = {
                
                let vc = YKMeMessageViewController()
                
                self.navigationController?.pushViewController(vc, animated: true)
                
            }
            
            cell.selectionStyle = .none
            
            return cell
            
        }else if indexPath.row == 1 {
            let cell:YKHomeAccountTableViewCell = tableView.dequeueReusableCell(withIdentifier: accountCellID, for: indexPath) as! YKHomeAccountTableViewCell
            
            //            cell.backgroundColor = UIColor.yk_randomColor()
            cell.showDetailCallBack = {
                
                let vc = YKMeBalanceViewController()
                
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
            cell.selectionStyle = .none
            
            return cell
        }else
        {
            let cell:YKHomeProfitTableViewCell = tableView.dequeueReusableCell(withIdentifier: profitCellID, for: indexPath) as! YKHomeProfitTableViewCell
            
            //            cell.backgroundColor = UIColor.yk_randomColor()
            
            cell.selectionStyle = .none
            
            if indexPath.row == 2 {
                cell.bgImage = UIImage(named:"home_invest_bg")
            }else
            {
                cell.bgImage = UIImage(named:"home_income_bg")
                
            }
            
            return cell
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var rowHeight:CGFloat = 0.0
        
        if indexPath.row == 0 {
            //            print(kViewScale)
            rowHeight = 60.0*kHeightScale
        }else if indexPath.row == 1{
            rowHeight = 274.0*kHeightScale
        }else {
            rowHeight = 110.0*kHeightScale
        }
        
        return rowHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0 {
            
            let vc = YKMeInfoViewController()
            
            self.navigationController?.pushViewController(vc, animated: true)
            
        }else if indexPath.row == 2{
            let vc = YKInvestProfitViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 3{
            let vc = YKIncomeProfitViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    fileprivate func loadData(){
        YKLog(message: "请求数据")
        
    }
    @objc fileprivate func loadMore(){
        
        YKLog(message: "上拉加载更多")
        Thread.sleep(forTimeInterval: 2.0)
        self.tableView?.reloadData()
        self.tableView?.mj_footer.endRefreshing()
        
    }
    @objc fileprivate func refreshData(){
        YKLog(message: "下拉刷新")
        Thread.sleep(forTimeInterval: 2.0)
         self.tableView?.reloadData()
        self.tableView?.mj_header.endRefreshing()
       
    }
    
    
}
