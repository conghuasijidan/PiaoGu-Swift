//
//  YKMarketHeaderView.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2018/3/27.
//  Copyright © 2018年 hangzhouzhulongkeji. All rights reserved.
//

import UIKit

class YKMarketHeaderView: UIView,SDCycleScrollViewDelegate {

    private var cycleView:SDCycleScrollView?
    var imgUrl:[String]?{
        didSet{
            self.cycleView?.imageURLStringsGroup = imgUrl
        }
    }
    private lazy var investBtn:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named:"market_investBtn_normal"), for: .normal)
        button.addTarget(self, action: #selector(YKMarketHeaderView.investBtnAction), for: .touchUpInside)
        return button
    }()
    private lazy var incomeBtn:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named:"market_incomeBtn_normal"), for: .normal)
        button.addTarget(self, action: #selector(YKMarketHeaderView.incomeBtnAction), for: .touchUpInside)
        return button
    }()
    private lazy var leftLineView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.yk_colorWithHex(hex: 0x979797)
        view.alpha = 0.3
        return view
    }()
    private lazy var rightLineView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.yk_colorWithHex(hex: 0x979797)
        view.alpha = 0.3
        return view
    }()
    private lazy var titleLabel:UILabel = {
        var label = UILabel()
        label.text = "推荐产品"
        label.font = UIFont.systemFont(ofSize: 14*kHeightScale)
        label.textColor = UIColor.yk_colorWithHex(hex: 0x979779)
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    
    fileprivate func setupUI(){
        
        let cycleBgView:UIView = UIView(frame:CGRect(x:0,y:0,width:kScreenWidth,height:200*kHeightScale))
        
        let cycleScrollView:SDCycleScrollView = SDCycleScrollView(frame:CGRect(x:0,y:0,width:kScreenWidth,height:cycleBgView.bounds.size.height))
        
        cycleScrollView.delegate = self
        cycleScrollView.placeholderImage = UIImage(named:"market_advertisement_placeholder")
        cycleScrollView.backgroundColor = UIColor.yk_colorWithHex(hex: 0xf5f5f5)
        cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter
        cycleScrollView.currentPageDotColor = UIColor(white:1.0,alpha:0.9)
        cycleScrollView.pageDotColor = UIColor(white:1.0,alpha:0.6)
        
        cycleBgView.addSubview(cycleScrollView)
        self.cycleView = cycleScrollView
        addSubview(cycleBgView)
       
        let bottomBgView:UIView = UIView()
        bottomBgView.backgroundColor = UIColor.white
        addSubview(bottomBgView)
        
        bottomBgView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self)
            make.top.equalTo(cycleBgView.snp.bottom)
        }
        bottomBgView.addSubview(investBtn)
        bottomBgView.addSubview(incomeBtn)
        investBtn.snp.makeConstraints { (make) in
            make.left.top.equalTo(bottomBgView).offset(10*kWidthScale)
            make.right.equalTo(bottomBgView.snp.centerX).offset(-5*kWidthScale);
            make.height.equalTo(64*kHeightScale)
        }
        incomeBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(investBtn)
            make.left.equalTo(bottomBgView.snp.centerX).offset(5*kWidthScale)
            make.right.equalTo(bottomBgView).offset(-10*kWidthScale)
            make.height.equalTo(64*kHeightScale)
        }
        let sepBgView = UIView()
        sepBgView.backgroundColor = UIColor.white
        bottomBgView.addSubview(sepBgView)
        sepBgView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(bottomBgView)
            make.top.equalTo(investBtn.snp.bottom)
        }
        sepBgView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.center.equalTo(sepBgView)
        }
        sepBgView.addSubview(leftLineView)
        leftLineView.snp.makeConstraints { (make) in
            make.right.equalTo(titleLabel.snp.left).offset(-5*kWidthScale)
            make.centerY.equalTo(titleLabel)
            make.size.equalTo(CGSize(width: 20*kWidthScale, height: 1*kHeightScale))
        }
        sepBgView.addSubview(rightLineView)
        rightLineView.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel.snp.right).offset(5*kWidthScale)
            make.centerY.equalTo(titleLabel)
            make.size.equalTo(CGSize(width: 20*kWidthScale, height: 1*kHeightScale))
        }
        
        
    }
   
   
    // MARK:投资宝和收益票点击事件
   @objc fileprivate func investBtnAction(){
        YKLog(message: "投资宝点击事件")
    }
  @objc fileprivate func incomeBtnAction(){
        YKLog(message: "收益票点击事件")
    }
    //   MARK:轮播图点击
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
        YKLog(message: "点击了第\(index)张图片")
    }
}
