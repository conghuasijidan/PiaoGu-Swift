//
//  YKTopUpViewController.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2018/4/10.
//  Copyright © 2018年 hangzhouzhulongkeji. All rights reserved.
//

import UIKit
import SVProgressHUD
class YKTopUpViewController: YKBaseViewController,UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "余额充值"
        self.view.backgroundColor = UIColor.white
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func setupUI(){
        
        let tableView = UITableView(frame:CGRect(x: 0, y: 0, width: kScreenWidth, height: viewHeight) , style: .plain)
        
        self.view.addSubview(tableView)
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: viewHeight))
        tableView.tableHeaderView = headerView
        
        headerView.addSubview(self.bgImageView)
        headerView.addSubview(self.totalLabel)
        headerView.addSubview(self.cashTextField)
        headerView.addSubview(self.titleLable)
        headerView.addSubview(self.wxpayButton)
        headerView.addSubview(self.alipayButton)
        headerView.addSubview(self.wxpayLabel)
        headerView.addSubview(self.alipayLabel)
        self.view.addSubview(self.nextButton)
        
        self.bgImageView.snp.makeConstraints { (make) in
            make.top.equalTo(headerView).offset(10*kHeightScale)
            make.centerX.equalTo(headerView)
//            make.height.equalTo(80*kWidthScale)
        }
        self.totalLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.bgImageView).offset(10*kWidthScale)
            make.centerY.equalTo(self.bgImageView)
            make.width.equalTo(118*kWidthScale)
        }
        self.cashTextField.snp.makeConstraints { (make) in
            make.left.equalTo(self.totalLabel.snp.right)
            make.centerY.equalTo(self.totalLabel)
            make.right.equalTo(self.bgImageView).offset(-10*kWidthScale)
        }
        self.titleLable.snp.makeConstraints { (make) in
            make.centerX.equalTo(headerView)
            make.top.equalTo(self.bgImageView.snp.bottom).offset(20*kHeightScale)
        }
        self.wxpayButton.snp.makeConstraints { (make) in
            make.right.equalTo(headerView.snp.centerX).offset(-20*kWidthScale)
            make.top.equalTo(self.titleLable.snp.bottom).offset(20*kHeightScale)
            make.size.equalTo(CGSize(width: 75*kHeightScale, height: 75*kHeightScale))
        }
        self.alipayButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.wxpayButton)
            make.left.equalTo(headerView.snp.centerX).offset(20*kWidthScale)
            make.size.equalTo(CGSize(width: 75*kHeightScale, height: 75*kHeightScale))
        }
        self.wxpayLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.wxpayButton.snp.bottom).offset(10*kHeightScale)
            make.centerX.equalTo(self.wxpayButton)
        }
        self.alipayLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.alipayButton.snp.bottom).offset(10*kHeightScale)
            make.centerX.equalTo(self.alipayButton)
        }
        
        let offset = result ? -34:0
        self.nextButton.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.bottom.equalTo(self.view).offset(offset)
            make.height.equalTo(49)
        }
//       添加手势
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(recognizerTapAction))
        
        self.view.addGestureRecognizer(recognizer)
        
    }
    
    //    MARK:textField 代理和响应事件
     @objc private func textFieldEditChangeAction() {
//        限定输入长度
        //        限定最大提现金额
        //        是否为空
        guard let str = self.cashTextField.text else {
            return
        }
        if str.count == 0 {
            return
        }
        
        //        是否包含小数点
        if str.contains(".") {
            let range = (str as NSString).range(of: ".")
            //        首位不能为.号
            if range.location == 0 && str == "." {
                self.cashTextField.text = ""
            }else{
                //                小数点 后两位
                if str.count - range.location > 2{
                    self.cashTextField.text = (str as NSString).substring(to:range.location+3)
                }
                
            }
            
        }
        
        
//        guard let num = Int(str) else{
//            return
//        }
//        if num > 100000 {
//            SVProgressHUD.showInfo(withStatus: "超出最大提现金额")
//            self.cashTextField.text = (str as NSString).substring(to: 5)
//        }
        
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.cashTextField.resignFirstResponder()
        
        return true
    }
    //    文本变化
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else {
            return true
        }
        //        去掉多个小数点
        if text.contains(".") && string == "."{
            return false
        }
        //        判断是否小于等于0
        let allrange = (text as NSString).range(of: "0")
        if allrange.location == 0 && string == "0" && range.location == 1 {
            return false
        }
        
        
        return true
        
    }
    
//    微信
    @objc private func wxButtonAction() {
        self.cashTextField.resignFirstResponder()
        self.wxpayButton.isSelected = true
        self.alipayButton.isSelected = false
    }
    
//    支付宝
    @objc private func alipayButtonAction() {
        self.cashTextField.resignFirstResponder()
        self.wxpayButton.isSelected = false
        self.alipayButton.isSelected = true
        
    }
//    下一步
    @objc private func nextButtonAction() {
        
    }
//    点按手势
    @objc private func recognizerTapAction() {
        self.cashTextField.resignFirstResponder()
    }
    
    private lazy var bgImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"home_balance_topup_bg")
        return imageView
    }()
    private lazy var totalLabel:UILabel = {
        let label = UILabel.yk_createLabel(text: "总需金额（元）", textColor: 0x666666, fontSize: 14*kHeightScale)
        return label
    }()
    private lazy var titleLable:UILabel = {
        let label = UILabel.yk_createLabel(text: "一 充值方式 一", textColor: 0x999999, fontSize: 14*kHeightScale)
        return label
    }()
    private lazy var cashTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "请输入充值金额"
        textField.font = UIFont.systemFont(ofSize: 36*kHeightScale)
        textField.textColor = UIColor.yk_colorWithHex(hex: 0x333333)
//        设置placeholder 的字体颜色和大小
        textField.setValue(UIColor.yk_colorWithHex(hex: 0x999999), forKeyPath: "_placeholderLabel.textColor")
        textField.setValue(UIFont.systemFont(ofSize: 12*kHeightScale), forKeyPath: "_placeholderLabel.font")
        
        //设置placeholder 居中 iOS 11 自动居中 ，其他版本需要适配
        if !is_IOS11(){
            
            let paraph = NSMutableParagraphStyle()
            paraph.minimumLineHeight = textField.font!.lineHeight - (textField.font!.lineHeight - UIFont.systemFont(ofSize: 12*kHeightScale).lineHeight)/2.0
            
            textField.attributedPlaceholder = NSAttributedString(string: "请输入提现金额", attributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 12*kHeightScale),NSAttributedStringKey.paragraphStyle:paraph])
        }
        //        设置文字居中
        textField.contentVerticalAlignment = UIControlContentVerticalAlignment.center
//        设置键盘属性
        textField.keyboardType = UIKeyboardType.numberPad
//        设置清除按钮
        textField.clearButtonMode = UITextFieldViewMode.whileEditing
//        设置代理，添加响应事件
        textField.delegate = self
        textField.addTarget(self, action: #selector(textFieldEditChangeAction), for: UIControlEvents.editingChanged)
        
        return textField
    }()
    
    private lazy var wxpayButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named:"balance_weixin_normal"), for: .normal)
        button.setImage(UIImage(named:"balance_weixin_selected"), for: .selected)
        button.addTarget(self, action: #selector(wxButtonAction), for: .touchUpInside)
        return button
    }()
    private lazy var alipayButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named:"balance_alipay_normal"), for: .normal)
        button.setImage(UIImage(named:"balance_alipay_selected"), for: .selected)
        button.addTarget(self, action: #selector(alipayButtonAction), for: .touchUpInside)
        return button
    }()
    private lazy var wxpayLabel:UILabel = {
        let label = UILabel.yk_createLabel(text: "微信", textColor: 0x999999, fontSize: 12*kHeightScale)
        return label
    }()
    private lazy var alipayLabel:UILabel = {
        let label = UILabel.yk_createLabel(text: "支付宝", textColor: 0x999999, fontSize: 12*kHeightScale)
        return label
    }()
    private lazy var nextButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named:"balance_topup_next"), for: .normal)
        button.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
        return button
    }()

    


}
