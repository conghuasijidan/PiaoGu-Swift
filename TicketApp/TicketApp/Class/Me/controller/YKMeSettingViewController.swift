//
//  YKMeSettingViewController.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2018/3/30.
//  Copyright © 2018年 hangzhouzhulongkeji. All rights reserved.
//

import UIKit

class YKMeSettingViewController: YKBaseViewController,UITableViewDelegate,UITableViewDataSource {
    private let settingCellID = "settingCellID"
    private var tableView:UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "设置"
        setupUI()
    }
    
    fileprivate func setupUI(){
        
        let tableView = UITableView(frame: CGRect(x:0,y:0,width:kScreenWidth,height:viewHeight), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(YKSettingTableViewCell.self, forCellReuseIdentifier: settingCellID)
        tableView.rowHeight = 50*kHeightScale
        tableView.separatorStyle = .none
        self.view.addSubview(tableView)
        self.tableView = tableView
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:YKSettingTableViewCell = tableView.dequeueReusableCell(withIdentifier: settingCellID, for: indexPath) as! YKSettingTableViewCell
        switch indexPath.row {
        case 0:
            cell.name = "消息设置"
            break
        case 1:
            cell.name = "行情刷新频率"
            break
        case 2:
            cell.name = "意见反馈"
            break
        default:
            cell.name = "关于"
        }
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
