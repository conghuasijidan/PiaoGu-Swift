//
//  YKMeMessageViewController.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2018/3/30.
//  Copyright © 2018年 hangzhouzhulongkeji. All rights reserved.
//

import UIKit

class YKMeMessageViewController: YKBaseViewController,UITableViewDelegate,UITableViewDataSource {
    private let messageCellID = "messageCellID"
    private var tableView:UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "消息"
        setupUI()
    }
    fileprivate func loadData(){
        
        
    }
    
    fileprivate func setupUI(){
        
        let tableView = UITableView(frame: CGRect(x:0,y:0,width:kScreenWidth,height:viewHeight), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(YKMessageTableViewCell.self, forCellReuseIdentifier: messageCellID)
        tableView.rowHeight = 80*kHeightScale
        tableView.separatorStyle = .none
        self.view.addSubview(tableView)
        self.tableView = tableView
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:YKMessageTableViewCell = tableView.dequeueReusableCell(withIdentifier: messageCellID, for: indexPath) as! YKMessageTableViewCell
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
