//
//  YKMarketDetailOneTableViewCell.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2018/4/8.
//  Copyright © 2018年 hangzhouzhulongkeji. All rights reserved.
//

import UIKit

class YKMarketDetailOneTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI(){
        self.contentView.addSubview(self.nameLable)
        self.contentView.addSubview(self.descLabel)
        self.contentView.addSubview(self.slider)
        self.contentView.addSubview(self.targetLabel)
        self.contentView.addSubview(self.presentLabel)
        self.contentView.addSubview(self.percentLabel)
        self.contentView.addSubview(self.targetDescLabel)
        self.contentView.addSubview(self.presentDescLabel)
        self.contentView.addSubview(self.percentDescLabel)
        self.contentView.addSubview(self.topLineView)
        self.contentView.addSubview(self.mediumLineView)
        self.contentView.addSubview(self.bottomLineView)
        self.contentView.addSubview(self.profitPercentLabel)
        self.contentView.addSubview(self.singlePriceLabel)
        self.contentView.addSubview(self.proDescLabel)
        self.contentView.addSubview(self.priceDescLabel)
        self.contentView.addSubview(self.sliderMaskView)
        self.contentView.addSubview(self.avatarImageView)
        self.contentView.addSubview(self.collecterNameLabel)
        self.contentView.addSubview(self.collecterDescLabel)
        self.contentView.addSubview(self.lineView)
        self.contentView.addSubview(self.iconImageView)
        self.contentView.addSubview(self.countLabel)
        
        self.nameLable.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(10*kWidthScale)
            make.top.equalTo(self.contentView).offset(20*kHeightScale)
        }
        self.descLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.nameLable)
            make.right.equalTo(self.contentView).offset(-10*kWidthScale)
            make.top.equalTo(self.nameLable.snp.bottom).offset(10*kHeightScale)
            
        }
        self.slider.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(15*kWidthScale)
            make.right.equalTo(self.contentView).offset(-15*kWidthScale)
            make.top.equalTo(self.descLabel.snp.bottom).offset(20)
        }
        self.sliderMaskView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(self.slider)
        }
        self.targetLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.slider)
            make.top.equalTo(self.slider.snp.bottom).offset(20*kHeightScale)
        }
        self.presentLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.contentView)
            make.centerY.equalTo(self.targetLabel)
        }
        self.percentLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.targetLabel)
            make.right.equalTo(self.slider)
        }
        self.targetDescLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.targetLabel)
            make.top.equalTo(self.targetLabel.snp.bottom).offset(2*kHeightScale)
        }
        self.presentDescLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.presentLabel)
            make.top.equalTo(self.presentLabel.snp.bottom).offset(2*kHeightScale)
        }
        self.percentDescLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.percentLabel)
            make.top.equalTo(self.percentLabel.snp.bottom).offset(2*kHeightScale)
        }
        self.topLineView.snp.makeConstraints { (make) in
            make.top.equalTo(self.targetDescLabel.snp.bottom).offset(20*kHeightScale)
            make.left.right.equalTo(self.contentView)
            make.height.equalTo(1*kHeightScale)
        }
        
        self.profitPercentLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.contentView).multipliedBy(0.5)
            make.top.equalTo(self.topLineView.snp.bottom).offset(20*kHeightScale)
        }
        self.singlePriceLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.contentView).multipliedBy(1.5)
            make.top.equalTo(self.profitPercentLabel)
        }
        self.proDescLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.profitPercentLabel)
            make.top.equalTo(self.profitPercentLabel.snp.bottom).offset(2*kHeightScale)
        }
        self.priceDescLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.singlePriceLabel)
            make.top.equalTo(self.proDescLabel)
        }
        self.bottomLineView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.contentView)
            make.height.equalTo(1*kHeightScale)
            make.top.equalTo(self.proDescLabel.snp.bottom).offset(20*kHeightScale)

        }
        self.mediumLineView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.contentView)
            make.top.equalTo(self.topLineView.snp.bottom)
            make.bottom.equalTo(self.bottomLineView.snp.top)
            make.width.equalTo(1*kHeightScale)
        }
        self.avatarImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(10*kWidthScale)
            make.top.equalTo(self.bottomLineView.snp.bottom).offset(20*kHeightScale)
            make.size.equalTo(CGSize(width: 40*kHeightScale, height: 40*kHeightScale))
        }
        self.collecterNameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.avatarImageView.snp.right).offset(10*kWidthScale)
            make.top.equalTo(self.avatarImageView)
        }
        self.collecterDescLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.collecterNameLabel)
            make.right.equalTo(self.contentView).offset(-10*kWidthScale)
            make.top.equalTo(self.collecterNameLabel.snp.bottom).offset(3*kHeightScale)
        }
        self.lineView.snp.makeConstraints { (make) in
            make.top.equalTo(self.collecterDescLabel.snp.bottom).offset(20*kHeightScale)
            make.left.right.equalTo(self.contentView)
            make.height.equalTo(1*kHeightScale)
            
        }
        self.iconImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self.avatarImageView)
            make.top.equalTo(self.lineView.snp.bottom).offset(10*kWidthScale)
            //            设置动态行高约束
            make.bottom.equalTo(self.contentView)
        }
        self.countLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.iconImageView.snp.right).offset(5*kWidthScale)
            make.top.equalTo(self.iconImageView)
        }
        
    }

    private lazy var nameLable:UILabel = {
        let label = UILabel.yk_createLabel(text: "新白鹿餐厅", textColor: 0x666666, fontSize: 18*kHeightScale)
        
        return label
    }()
    private lazy var descLabel:UILabel = {
        let label = UILabel.yk_createLabel(text: "杭州知名中餐连锁餐厅，成立于1998年，广受长三角人民喜爱。总部位于杭州中山北路572号，员工总数超过1000人。", textColor: 0x999999, fontSize: 14*kHeightScale)
        label.numberOfLines = 0
        return label
    }()
    private lazy var slider:YKSlider = {
        let slider = YKSlider()
        slider.minimumValue = 0.0
        slider.maximumValue = 1.0
        slider.setThumbImage(UIImage(named:"market_detail_slider"), for: .normal)
        slider.maximumTrackTintColor = UIColor.yk_colorWithRGBA(red: 232, green: 232, blue: 232, a: 1)
        slider.minimumTrackTintColor = UIColor.yk_colorWithHex(hex: 0xf48d95)
        slider.value = 0.6
//        slider.isEnabled = false
        return slider
    }()
    private lazy var targetLabel:UILabel = {
        let label = UILabel.yk_createLabel(text: "200.00万", textColor: 0x666666, fontSize: 14*kHeightScale)
        return label
    }()
    private lazy var targetDescLabel:UILabel = {
        let label = UILabel.yk_createLabel(text: "筹集目标", textColor: 0x999999, fontSize: 12*kHeightScale)
        return label
    }()
    private lazy var presentLabel:UILabel = {
        let label = UILabel.yk_createLabel(text: "146.00万", textColor: 0x666666, fontSize: 14*kHeightScale)
        return label
    }()
    private lazy var presentDescLabel:UILabel = {
        let label = UILabel.yk_createLabel(text: "已筹金额", textColor: 0x999999, fontSize: 12*kHeightScale)
        return label
    }()
    private lazy var percentLabel:UILabel = {
        let label = UILabel.yk_createLabel(text: "73%", textColor: 0x666666, fontSize: 14*kHeightScale)
        return label
    }()
    private lazy var percentDescLabel:UILabel = {
        let label = UILabel.yk_createLabel(text: "完成率", textColor: 0x999999, fontSize: 12*kHeightScale)
        return label
    }()
    private lazy var topLineView:UIView = {
        let view:UIView = UIView()
        view.backgroundColor = UIColor.yk_colorWithHex(hex: 0xf5f5f5)
        return view
    }()
    private lazy var mediumLineView:UIView = {
        let view:UIView = UIView()
        view.backgroundColor = UIColor.yk_colorWithHex(hex: 0xf5f5f5)
        return view
    }()
    private lazy var bottomLineView:UIView = {
        let view:UIView = UIView()
        view.backgroundColor = UIColor.yk_colorWithHex(hex: 0xf5f5f5)
        return view
    }()
    
    private lazy var profitPercentLabel:UILabel = {
        let label = UILabel.yk_createLabel(text: "4.65%", textColor: 0xEA173F, fontSize: 36*kHeightScale)
        return label
    }()
    private lazy var proDescLabel:UILabel = {
        let label = UILabel.yk_createLabel(text: "收益率", textColor: 0x999999, fontSize: 14*kHeightScale)
        return label
    }()
    private lazy var singlePriceLabel:UILabel = {
        let label = UILabel.yk_createLabel(text: "100元", textColor: 0xEA173F, fontSize: 34*kHeightScale)
        return label
    }()
    private lazy var priceDescLabel:UILabel = {
        let label = UILabel.yk_createLabel(text: "每份金额", textColor: 0x999999, fontSize: 14*kHeightScale)
        return label
    }()
    private lazy var sliderMaskView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }()
    private lazy var avatarImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"market_detail_user")
        imageView.sizeToFit()
        return imageView
    }()
    private lazy var collecterNameLabel:UILabel = {
        let label = UILabel.yk_createLabel(text: "周仙人", textColor: 0x666666, fontSize: 14*kHeightScale)
        return label
    }()
    private lazy var collecterDescLabel:UILabel = {
        let label = UILabel.yk_createLabel(text: "丑八怪，咿呀咿呀。。。其实我不在意有很多机会，像巨人一样的无畏", textColor: 0x999999, fontSize: 12*kHeightScale)
        label.numberOfLines = 0
        return label
        
    }()
    private lazy var lineView:UIView = {
        let view:UIView = UIView()
        view.backgroundColor = UIColor.yk_colorWithHex(hex: 0xf5f5f5)
        return view
    }()
    private lazy var iconImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"market_detail_comment_icon")
        return imageView
    }()
    private lazy var countLabel:UILabel = {
        let label = UILabel.yk_createLabel(text: "评论（88条）", textColor: 0x999999, fontSize: 14*kHeightScale)
        return label
    }()

    
    
}
