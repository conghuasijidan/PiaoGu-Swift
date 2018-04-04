//
//  YKInvestProfitHeaderView.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2018/4/3.
//  Copyright © 2018年 hangzhouzhulongkeji. All rights reserved.
//

import UIKit

class YKInvestProfitHeaderView: UIView {

    var bgImage:UIImage?{
        didSet{
            self.headerBgImageView.image = bgImage
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //   MARK:搭建界面
    fileprivate func setupUI(){
        self.addSubview(self.headerBgImageView)
        self.addSubview(self.descLabel)
        self.addSubview(self.moneyLabel)
        self.addSubview(self.profitLabel)
        self.addSubview(self.lineView)
        self.addSubview(self.totalProfitLabel)
        
        self.headerBgImageView.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(self)
            make.bottom.equalTo(self).offset(-37*kHeightScale)
        }
        self.descLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(self).offset(30*kHeightScale)
        }
        self.moneyLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(self.descLabel.snp.bottom).offset(10*kHeightScale)
        }
        self.profitLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(self.moneyLabel.snp.bottom).offset(10*kHeightScale)
        }
        self.lineView.snp.makeConstraints { (make) in
            make.top.equalTo(self.headerBgImageView.snp.bottom).offset(-50*kHeightScale)
            make.left.right.equalTo(self)
            make.height.equalTo(1*kHeightScale)
        }
        self.totalProfitLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(self.lineView).offset(18*kHeightScale)
        }
        let bottomView:UIView = UIView()
        bottomView.backgroundColor = UIColor.white
        self.addSubview(bottomView)
        bottomView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self)
            make.top.equalTo(self.headerBgImageView.snp.bottom)
        }
        bottomView.addSubview(self.listLabel)
        bottomView.addSubview(self.leftLineView)
        bottomView.addSubview(self.rightLineView)
        self.listLabel.snp.makeConstraints { (make) in
            make.center.equalTo(bottomView)
        }
        self.leftLineView.snp.makeConstraints { (make) in
            make.right.equalTo(self.listLabel.snp.left).offset(-5*kWidthScale)
            make.centerY.equalTo(self.listLabel)
            make.size.equalTo(CGSize(width:15*kWidthScale,height:1*kHeightScale))
        }
        self.rightLineView.snp.makeConstraints { (make) in
            make.left.equalTo(self.listLabel.snp.right).offset(5*kWidthScale)
            make.centerY.equalTo(self.listLabel)
            make.size.equalTo(CGSize(width:15*kWidthScale,height:1*kHeightScale))
        }
        
    }
    private lazy var headerBgImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"home_invest_header_bg")
        return imageView
    }()
    private lazy var descLabel:UILabel = {
        let label = UILabel.yk_createLabel(text: "总金额（元）", textColor: 0xffffff, fontSize: 14*kHeightScale)
        return label
    }()
    private lazy var moneyLabel:UILabel = {
        let label = UILabel.yk_createLabel(text: "66666", textColor: 0xffffff, fontSize: 30*kHeightScale)
        return label
    }()
    private lazy var profitLabel:UILabel = {
        let label = UILabel.yk_createLabel(text: "昨天：+170元", textColor: 0xffffff, fontSize: 14*kHeightScale)
        return label
    }()
    private lazy var totalProfitLabel:UILabel = {
        let label = UILabel.yk_createLabel(text: "累计收益(元)：788", textColor: 0xffffff, fontSize: 14*kHeightScale)
        return label
    }()
    private lazy var lineView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.yk_colorWithRGBA(red: 245, green: 245, blue: 245, a: 0.15)
        return view
    }()
    private lazy var listLabel:UILabel = {
        let label = UILabel.yk_createLabel(text: "产品列表", textColor: 0x999999, fontSize: 14*kHeightScale)
        return label
    }()
    private lazy var leftLineView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.yk_colorWithRGBA(red: 151, green: 151, blue: 151, a: 0.5)
        return view
    }()
    private lazy var rightLineView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.yk_colorWithRGBA(red: 151, green: 151, blue: 151, a: 0.5)
        return view
    }()



    

}
