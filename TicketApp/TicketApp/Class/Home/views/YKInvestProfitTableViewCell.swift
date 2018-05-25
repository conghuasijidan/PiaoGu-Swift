//
//  YKInvestProfitTableViewCell.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2018/4/4.
//  Copyright © 2018年 hangzhouzhulongkeji. All rights reserved.
//

import UIKit

class YKInvestProfitTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI(){
        self.contentView.addSubview(self.ImgView)
        self.contentView.addSubview(self.lineView)
        self.contentView.addSubview(self.nameLabel)
        self.contentView.addSubview(self.timeLabel)
        self.contentView.addSubview(self.profitLabel)
        self.contentView.addSubview(self.moreButton)
        
        self.ImgView.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(10*kWidthScale)
            make.centerY.equalTo(self.contentView)
        }
        self.lineView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self.contentView)
            make.height.equalTo(1*kHeightScale)
        }
        self.nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.ImgView.snp.right).offset(10*kWidthScale)
            make.top.equalTo(self.ImgView)
        }
        self.timeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.nameLabel)
            make.top.equalTo(self.nameLabel.snp.bottom).offset(5*kHeightScale)
        }
        self.profitLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.timeLabel)
            make.top.equalTo(self.timeLabel.snp.bottom).offset(5*kHeightScale)
        }
        self.moreButton.snp.makeConstraints { (make) in
            make.right.equalTo(self.contentView).offset(-15*kWidthScale)
            make.bottom.equalTo(self.ImgView)
        }
//        栅格化
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
        
    }
    private lazy var ImgView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"investcell_img_placehoder")
        return imageView
    }()
    private lazy var nameLabel:UILabel = {
        let label:UILabel = UILabel.yk_createLabel(text: "新白鹿餐厅", textColor: 0x000000, fontSize: 14*kHeightScale)
        return label
    }()
    private lazy var timeLabel:UILabel = {
        let label:UILabel = UILabel.yk_createLabel(text: "购入日期：2017年4月14日", textColor: 0x999999, fontSize: 12*kHeightScale)
        return label
    }()
    private lazy var profitLabel:UILabel = {
        let label:UILabel = UILabel.yk_createLabel(text: "+178元", textColor: 0xEA173F, fontSize: 20*kHeightScale)
        return label
    }()
    private lazy var moreButton:UIButton = {
        let button:UIButton = UIButton()
        button.setTitle("查看详情", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12*kWidthScale)
        let image:UIImage = UIImage(named:"invest_detal_rightArrow")!
        button.setImage(image, for: .normal)
        button.titleLabel?.backgroundColor = button.backgroundColor
        let labelWidth = 52*kWidthScale //增大图片与文字的间距
        button.imageEdgeInsets = UIEdgeInsetsMake(0,labelWidth, 0, -labelWidth)
        button.titleEdgeInsets = UIEdgeInsetsMake(0, -image.size.width, 0, image.size.width)
        return button
    }()
    private lazy var lineView:UIView = {
        let view:UIView = UIView()
        view.backgroundColor = UIColor.yk_colorWithHex(hex: 0xf5f5f5)
        return view
    }()


}
