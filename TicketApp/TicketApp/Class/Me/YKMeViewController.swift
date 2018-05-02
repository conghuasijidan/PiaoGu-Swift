//
//  YKMeViewController.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2017/12/28.
//  Copyright © 2017年 hangzhouzhulongkeji. All rights reserved.
//

import UIKit
import MWPhotoBrowser
import SVProgressHUD
class YKMeViewController: YKBaseViewController,UITableViewDelegate,UITableViewDataSource,MWPhotoBrowserDelegate,SDPhotoBrowserDelegate {

    private var tableView:UITableView?
    private let sectionOneCell = "scetionOneCell"
    private let sectionTwoCell = "scetionTwoCell"
    private var photoList = [UIImage]()
    private var userModel:YKUser?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "我的"
       
        setupUI()
//        mw 图片浏览器
//        let photo = MWPhoto(image: UIImage(named:"me_name_placehoder"))!
//        photoList.append(photo)
//        sd 图片浏览器
        let photo = UIImage(named:"me_name_placehoder")
        photoList.append(photo!)
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         loadData()
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
    
    //    MARK: 图片浏览器代理
    func numberOfPhotos(in photoBrowser: MWPhotoBrowser!) -> UInt {
        return UInt(photoList.count)
    }
    func photoBrowser(_ photoBrowser: MWPhotoBrowser!, photoAt index: UInt) -> MWPhotoProtocol! {
        if photoList.count != 0 {
            let idx = Int(index)
            return photoList[idx] as! MWPhotoProtocol
        }
        
        return nil
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
            cell.avatarCallBack =  {[weak self] in
                
                
                //        MW添加图片浏览器
//                let MWBrowser = MWPhotoBrowser(delegate: self)
//                MWBrowser?.setCurrentPhotoIndex(0)
//                self.navigationController?.pushViewController(MWBrowser!, animated: true)
                //       SD图片浏览器  可以直接放在view视图中
                let photoBrower =  SDPhotoBrowser()
                photoBrower.delegate = self
                photoBrower.currentImageIndex = 0
                photoBrower.imageCount = self!.photoList.count
                photoBrower.sourceImagesContainerView = self?.view
                photoBrower.show()
                

            }
            cell.model = userModel
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
                    cell.iconImage = UIImage(named:"home_balance_cash_icon")
                    cell.descText = "余额"
                    break;
                case 2:
                    cell.iconImage = UIImage(named:"home_balance_topup_icon")
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
    
    //MARK: 实现photoBrower 的代理方法
    
//    如果有高质量图片的话实现此方法
    
//    func photoBrowser(_ browser: SDPhotoBrowser!, highQualityImageURLFor index: Int) -> URL!
//    {
////        替换高质量图片地址
//        let urlStr = photoList[index]
//
//        return
//
//    }
    
    
    func photoBrowser(_ browser: SDPhotoBrowser!, placeholderImageFor index: Int) -> UIImage! {
        
        
        return photoList[index]
        
    }
    
    @objc var userID:String?
    @objc var userName:String?
    @objc var avatarImage:UIImage?
    //    MARK:加载数据
    fileprivate func loadData(){
        
        var dict:[String:AnyObject] = [String:AnyObject]()
        dict["accessToken"] = nil
        dict["userName"] = "葱花思鸡蛋" as AnyObject
        dict["userID"] = "账号：19920807" as AnyObject
        dict["avatarImage"] = UIImage(named:"me_name_placehoder")
        SVProgressHUD.show()
        
       
        
//        存储本地
         weak var weakSelf = self
        
//        没有本地数据的话，请求网络数据
        if YKUser(dict:nil).islogin() {
            userModel = YKUser(dict:nil).getUserInfo()
            self.tableView?.reloadData()
            SVProgressHUD.dismiss()
            
        }else{
            delay(1) {
            weakSelf!.userModel = YKUser(dict: dict)
            weakSelf!.userModel?.saveUserInfo(user:weakSelf!.userModel!)
            weakSelf!.tableView?.reloadData()
            SVProgressHUD.dismiss()
        }
        
      }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
   

}
