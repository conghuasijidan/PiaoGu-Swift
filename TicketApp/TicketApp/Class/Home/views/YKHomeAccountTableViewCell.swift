//
//  YKHomeAccountTableViewCell.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2018/1/2.
//  Copyright © 2018年 hangzhouzhulongkeji. All rights reserved.
//

import UIKit

class YKHomeAccountTableViewCell: UITableViewCell {
    
    var showDetailCallBack:CallBack?
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    fileprivate func setupUI(){
        self.contentView.addSubview(bgImageView)
        self.contentView.addSubview(balanceLabel)
        self.contentView.addSubview(balanceBgView)
       
        balanceBgView.addSubview(balanceBgImageView)
        balanceBgView.addSubview(lastProfitLabel)
        balanceBgView.addSubview(accountLabel)
        balanceBgView.addSubview(showDetailLabel)
        
        bgImageView.snp.makeConstraints { (make) in
            make.center.equalTo(self.contentView)
            make.size.equalTo(self.contentView)
        }
        balanceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentView).offset(10*kHeightScale)
            make.left.equalTo(self.contentView).offset(20*kWidthScale)
        }
        balanceBgView.snp.makeConstraints { (make) in
            make.center.equalTo(self.contentView)
            make.size.equalTo(CGSize(width:191*kHeightScale,height:192*kHeightScale))
            
        }
        balanceBgImageView.snp.makeConstraints { (make) in
            make.center.equalTo(balanceBgView)
            make.size.equalTo(balanceBgView)
        }
        accountLabel.snp.makeConstraints { (make) in
            make.center.equalTo(balanceBgView)
        }
        lastProfitLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(balanceBgView)
            make.bottom.equalTo(accountLabel.snp.top).offset(-10*kHeightScale)
        }
        showDetailLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(balanceBgView)
            make.top.equalTo(accountLabel.snp.bottom).offset(10*kHeightScale)
        }
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(showDetailAction))
        
        balanceBgView.addGestureRecognizer(tapRecognizer)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   @objc private func showDetailAction() {
    
    
    if showDetailCallBack != nil{
        
        showDetailCallBack!()
    }
        
    }
    
    
    private lazy var balanceLabel = UILabel.yk_createLabel(text: "账户余额（元）", textColor: 0xffffff, fontSize: 14*kHeightScale)
    private lazy var bgImageView = UIImageView(image:UIImage(named:"home_account_bg"))
    
    private lazy var balanceBgView:UIView = UIView()
    private lazy var balanceBgImageView = UIImageView(image:UIImage(named:"home_account_circle_bg"))

    private lazy var lastProfitLabel = UILabel.yk_createLabel(text: "昨日:+350", textColor: 0xffffff, fontSize: 12*kHeightScale)
    private lazy var accountLabel = UILabel.yk_createLabel(text: "6666.66", textColor: 0xffffff, fontSize: 30*kHeightScale)
    private lazy var showDetailLabel = UILabel.yk_createLabel(text: "查看详情", textColor: 0xffffff, fontSize: 12*kHeightScale)
    

    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
