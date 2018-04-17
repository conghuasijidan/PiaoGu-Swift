//
//  YKRecordViewController.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2018/4/10.
//  Copyright © 2018年 hangzhouzhulongkeji. All rights reserved.
//

import UIKit

class YKRecordViewController: YKBaseViewController,UITableViewDelegate,UITableViewDataSource{

    private var tableView:UITableView?
    private let RECORDCELLID = "recordCellID"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "记录"
        self.view.backgroundColor = UIColor.white
        setupUI()
    }
    
    fileprivate func setupUI(){
        let height = result ? viewHeight:(viewHeight+49)
        let tableView = UITableView(frame: CGRect(x:0,y:0,width:kScreenWidth,height:height), style: .plain)
        tableView.register(YKRecordTableViewCell.self, forCellReuseIdentifier: RECORDCELLID)
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
        
        let cell:YKRecordTableViewCell = tableView.dequeueReusableCell(withIdentifier: RECORDCELLID, for: indexPath) as! YKRecordTableViewCell
        cell.selectionStyle = .none
        
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
