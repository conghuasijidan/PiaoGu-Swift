//
//  YKHomeViewController.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/12/28.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

import UIKit

class YKHomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    private let userCellID = "homeUserCellID"
    private let accountCellID = "homeAccountCellID"
    private let profitCellID = "homeProfitCellID"
    
    var kViewHeitht:CGFloat = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        self.loadData()
        self.setupUI()
        
//        let navHeight:CGFloat = (self.navigationController?.navigationBar.frame.size.height)!
//        let tabBarHeight:CGFloat = (self.tabBarController?.tabBar.frame.size.height)!
//        print(navHeight)
//        print(tabBarHeight)
//        print(kStatusHeight)
//        kViewHeitht = kScreenHeight - kStatusHeight - navHeight - tabBarHeight
        
    }
    
   

  fileprivate  func setupUI(){
        
    let tableView = UITableView(frame: CGRect(x:0,y:0,width:kScreenWidth,height:kScreenHeight), style: .plain)
        
        tableView.delegate = self
    
        tableView.dataSource = self
    
        tableView.separatorStyle = .none
    
        tableView.register(YKHomeUserTableViewCell.self, forCellReuseIdentifier: userCellID)
    
        tableView.register(YKHomeAccountTableViewCell.self, forCellReuseIdentifier: accountCellID)
    
        tableView.register(YKHomeProfitTableViewCell.self, forCellReuseIdentifier: profitCellID)
    
        tableView.rowHeight = UITableViewAutomaticDimension
    
        tableView.estimatedRowHeight = 200
    
//        tableView.tableFooterView = UIView()
    
//        tableView.backgroundColor = UIColor.orange
    
        self.view .addSubview(tableView)
    
    
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       
        
        if indexPath.row == 0 {
            
            let cell:YKHomeUserTableViewCell = tableView.dequeueReusableCell(withIdentifier: userCellID, for: indexPath) as! YKHomeUserTableViewCell
            
            cell.backgroundColor = UIColor.yk_randomColor()
            
            cell.selectionStyle = .none
            
            return cell
            
        }else if indexPath.row == 1 {
            let cell:YKHomeAccountTableViewCell = tableView.dequeueReusableCell(withIdentifier: accountCellID, for: indexPath) as! YKHomeAccountTableViewCell
            
            cell.backgroundColor = UIColor.yk_randomColor()
            
            cell.selectionStyle = .none
            
            return cell
        }else
        {
            let cell:YKHomeProfitTableViewCell = tableView.dequeueReusableCell(withIdentifier: profitCellID, for: indexPath) as! YKHomeProfitTableViewCell
            
            cell.backgroundColor = UIColor.yk_randomColor()
            
            cell.selectionStyle = .none
            
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
        
        
        
    }
    
    
   fileprivate func loadData(){
        
        
        
        
    }

    

}
