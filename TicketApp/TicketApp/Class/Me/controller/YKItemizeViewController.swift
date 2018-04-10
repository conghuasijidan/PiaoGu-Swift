//
//  YKItemizeViewController.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2018/4/10.
//  Copyright © 2018年 hangzhouzhulongkeji. All rights reserved.
//

import UIKit

class YKItemizeViewController: YKBaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    private let ITEMIZECELLID = "itemizeCellID"
    private var tableView:UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "明细"
        self.view.backgroundColor = UIColor.white
        setupUI()
        
    }
    
    fileprivate func setupUI(){
        let height = result ? viewHeight:(viewHeight+49)
        let tableView = UITableView(frame: CGRect(x:0,y:0,width:kScreenWidth,height:height), style: .plain)
        tableView.register(YKItemizeTableViewCell.self, forCellReuseIdentifier: ITEMIZECELLID)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 66*kHeightScale
        tableView.separatorStyle = .none
        self.view.addSubview(tableView)
        self.tableView = tableView
        
        
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:YKItemizeTableViewCell = tableView.dequeueReusableCell(withIdentifier: ITEMIZECELLID, for: indexPath) as! YKItemizeTableViewCell
        cell.selectionStyle = .none
        
        return cell
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  

}
