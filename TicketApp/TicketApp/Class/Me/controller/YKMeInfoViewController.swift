//
//  YKMeInfoViewController.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2018/3/30.
//  Copyright © 2018年 hangzhouzhulongkeji. All rights reserved.
//

import UIKit

class YKMeInfoViewController: YKBaseViewController,UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    private var tableView:UITableView?
    private let infoCell = "infoCell"
    private var avatarImage = UIImage(named:"home_infor_placehoder")
    private var userModel:YKUser?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "个人信息"
        self.view.backgroundColor = UIColor.white
        loadData()
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func loadData(){
//        从本地内存中取出用户信息
        userModel = YKUser(dict:nil).getUserInfo()
        
        
    }
    
    fileprivate func setupUI(){
        
        let tableView = UITableView(frame: CGRect(x:0,y:0,width:kScreenWidth,height:self.view.bounds.size.height), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(YKInfoTableViewCell.self, forCellReuseIdentifier: infoCell)
        tableView.rowHeight = 50*kHeightScale
        tableView.separatorStyle = .none
//        关闭iOS11 下的self-sizing 
//        tableView.estimatedRowHeight = 0;
//        tableView.estimatedSectionHeaderHeight = 0;
//        tableView.estimatedSectionFooterHeight = 0;
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
            cell.avatarImage = userModel?.avatarImage
            cell.desc = nil
            break
        case 1:
            cell.name = "昵称"
            cell.avatarImage = nil
            cell.desc = userModel?.userName
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
        
        switch indexPath.row {
        case 0:
           
           let  alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            
            
            
            let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: { (action) in
                self.dismiss(animated: true, completion: nil)
            })
            let cameraAction = UIAlertAction(title: "拍照", style: .default, handler: {[weak self] (action) in
                self!.openCameraAction()
            })
            let pictureAction = UIAlertAction(title: "从手机相册中选择", style: .default, handler: {[weak self]  (action) in
                self!.openAlbumAction()
                
            })
            alertController.addAction(cancelAction)
            alertController.addAction(cameraAction)
            alertController.addAction(pictureAction)
            self.present(alertController, animated: true, completion: nil)
            
            break
        case 1:
            YKLog(message: "昵称")
            break
        case 2:
            YKLog(message: "签名")
            break
        default:
            YKLog(message: "账户")
            
        }
        
    }
    //    MARK:打开相机
    func openCameraAction() {
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = UIImagePickerControllerSourceType.camera
            picker.allowsEditing = true
            self.present(picker, animated: true, completion: {
                
            })
            
        }else{
            YKLog(message: "找不到相机")
        }
        
    }
    //    MARK:打开相册
    func openAlbumAction() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            self.present(picker, animated: true, completion: nil)
            
        }else{
            YKLog(message: "读取相册失败")
        }
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        YKLog(message: info)
//        取出info 中的UIImagePickerControllerOriginalImage 再转化为 UIimage
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
//        存储本地
//       修改本地头像
         userModel?.avatarImage = image
//        修改后头像保存在本地
         userModel?.saveUserInfo(user: userModel!)
//        修改后头像保存到服务器（待实现）
        
//        self.avatarImage = image
        self.tableView?.reloadData()
        self.dismiss(animated: true, completion: nil)
    }
   

}
