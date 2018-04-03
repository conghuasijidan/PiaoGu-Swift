//
//  YKMeInfoViewController.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2018/3/30.
//  Copyright © 2018年 hangzhouzhulongkeji. All rights reserved.
//

import UIKit

class YKMeInfoViewController: YKBaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    private var tableView:UITableView?
    private let infoCell = "infoCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "个人信息"
        self.view.backgroundColor = UIColor.white
        
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func loadData(){
        
        
    }
    
    fileprivate func setupUI(){
        
        let tableView = UITableView(frame: CGRect(x:0,y:0,width:kScreenWidth,height:self.view.bounds.size.height), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(YKInfoTableViewCell.self, forCellReuseIdentifier: infoCell)
        tableView.rowHeight = 50*kHeightScale
        tableView.separatorStyle = .none
        self.view.addSubview(tableView)
        self.tableView = tableView
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:YKInfoTableViewCell = tableView.dequeueReusableCell(withIdentifier: infoCell, for: indexPath) as! YKInfoTableViewCell
        switch indexPath.row {
        case 0:
            cell.name = "头像"
            cell.avatarImage = UIImage(named:"home_infor_placehoder")
            cell.desc = nil
            break
        case 1:
            cell.name = "昵称"
            cell.avatarImage = nil
            cell.desc = "未设置"
            break
        case 2:
            cell.name = "签名"
            cell.avatarImage = nil
            cell.desc = "一句话介绍自己"
            break
        default:
            cell.name = "账户"
            cell.avatarImage = nil
            cell.desc = nil
            
        }
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
   

}
