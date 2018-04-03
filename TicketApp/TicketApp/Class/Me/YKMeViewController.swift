//
//  YKMeViewController.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/12/28.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

import UIKit

class YKMeViewController: YKBaseViewController,UITableViewDelegate,UITableViewDataSource {

    private var tableView:UITableView?
    private let sectionOneCell = "scetionOneCell"
    private let sectionTwoCell = "scetionTwoCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "我的"
        loadData()
        setupUI()
    
    }
    

    fileprivate func setupUI(){
        let tableView = UITableView(frame:CGRect(x:0,y:0,width:kScreenWidth,height:viewHeight), style: .plain)
        tableView.separatorStyle = .none
        tableView.register(YKMeSecOneTableViewCell.self, forCellReuseIdentifier: sectionOneCell)
        tableView.register(YKMeSecTwoTableViewCell.self, forCellReuseIdentifier: sectionTwoCell)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        self.tableView = tableView
        
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        case 1:
            return 5
        default:
            return 0
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell:YKMeSecOneTableViewCell = tableView.dequeueReusableCell(withIdentifier:sectionOneCell, for: indexPath) as! YKMeSecOneTableViewCell
            cell.selectionStyle = .none
            return cell
        default:
            let cell:YKMeSecTwoTableViewCell = tableView.dequeueReusableCell(withIdentifier:sectionTwoCell, for: indexPath) as! YKMeSecTwoTableViewCell
            cell.selectionStyle = .none
            switch indexPath.row {
                case 0:
                    cell.iconImage = UIImage(named:"me_message")
                    cell.descText = "个人信息"
                    break;
                case 1:
                    cell.iconImage = UIImage(named:"me_message")
                    cell.descText = "余额"
                    break;
                case 2:
                    cell.iconImage = UIImage(named:"me_message")
                    cell.descText = "消息"
                    break;
                case 3:
                    cell.iconImage = UIImage(named:"me_kefu")
                    cell.descText = "客服"
                    break;
                default:
                    cell.iconImage = UIImage(named:"me_setting")
                    cell.descText = "设置"
                break;
            }
            
            return cell
        }
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 110*kHeightScale
        default:
            return 50*kHeightScale
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            return
        }
        
        switch indexPath.row {
            case 0:
                let infoVC = YKMeInfoViewController()
                self.navigationController?.pushViewController(infoVC, animated: true)
                break
            case 1:
                let balanceVC = YKMeBalanceViewController()
                self.navigationController?.pushViewController(balanceVC, animated: true)
                break
            case 2:
                let messageVC = YKMeMessageViewController()
                self.navigationController?.pushViewController(messageVC, animated: true)
                break
            case 3:
                let kefuVC = YKMeKeFuViewController()
                self.navigationController?.pushViewController(kefuVC, animated: true)
                break
            default:
                let settingVC = YKMeSettingViewController()
                self.navigationController?.pushViewController(settingVC, animated: true)
        }
        
        
    }
    fileprivate func loadData(){
       
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
