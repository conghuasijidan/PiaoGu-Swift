//
//  YKInvestProfitHeaderView.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2018/4/3.
//  Copyright © 2018年 hangzhouzhulongkeji. All rights reserved.
//

import UIKit

class YKInvestProfitHeaderView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //   MARK:搭建界面
    fileprivate func setupUI(){
//        let topBgView = UIView(frame:CGRect(x:0,y:0,width:kScreenWidth,height:))
        
        
        
    }
    private lazy var headerBgImageView:UIImageView = {
        let imageView = UIImageView()
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
        let label = UILabel.yk_createLabel(text: "累计收益（元）:788", textColor: 0xffffff, fontSize: 14*kHeightScale)
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
        view.backgroundColor = UIColor.yk_colorWithRGBA(red: 151, green: 151, blue: 151, a: 0.3)
        return view
    }()
    private lazy var rightLineView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.yk_colorWithRGBA(red: 151, green: 151, blue: 151, a: 0.3)
        return view
    }()



    

}
