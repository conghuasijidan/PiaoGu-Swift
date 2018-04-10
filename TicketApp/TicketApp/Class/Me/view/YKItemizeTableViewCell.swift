//
//  YKItemizeTableViewCell.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2018/4/10.
//  Copyright © 2018年 hangzhouzhulongkeji. All rights reserved.
//

import UIKit

class YKItemizeTableViewCell: UITableViewCell {

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
        self.contentView.addSubview(self.avatarImageView)
        self.contentView.addSubview(self.profitLabel)
        self.contentView.addSubview(self.balanceLabel)
        self.contentView.addSubview(self.timeLabel)
        self.contentView.addSubview(self.fromLabel)
        self.contentView.addSubview(self.typeLabel)
        self.contentView.addSubview(self.lineView)
        
        self.avatarImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.contentView)
            make.left.equalTo(self.contentView).offset(10*kWidthScale)
            make.size.equalTo(CGSize(width:30*kHeightScale,height:30*kHeightScale))
        }
        self.profitLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.avatarImageView)
            make.left.equalTo(self.avatarImageView.snp.right).offset(10*kWidthScale)
        }
        self.timeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.profitLabel)
            make.bottom.equalTo(self.avatarImageView)
        }
        self.balanceLabel.snp.makeConstraints { (make) in
            make.right.equalTo(self.contentView).offset(-10*kWidthScale)
            make.top.equalTo(self.avatarImageView)
        }
        self.typeLabel.snp.makeConstraints { (make) in
            make.right.equalTo(self.contentView).offset(-10*kWidthScale)
            make.top.equalTo(self.balanceLabel.snp.bottom).offset(5*kHeightScale)
        }
        self.fromLabel.snp.makeConstraints { (make) in
            make.right.equalTo(self.typeLabel.snp.left).offset(-5*kWidthScale)
            make.centerY.equalTo(self.typeLabel)
        }
        
        self.lineView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self.contentView)
            make.height.equalTo(1*kHeightScale)
        }
        
        
    }
    
    
    private lazy var avatarImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"balance_showdetail_icon")
        return imageView
    }()
    private lazy var profitLabel:UILabel = {
        let label = UILabel.yk_createLabel(text: "+666", textColor: 0x333333, fontSize: 14*kHeightScale)
        return label
    }()
    private lazy var timeLabel:UILabel = {
        let label = UILabel.yk_createLabel(text: "2018-3-8", textColor: 0x999999, fontSize: 10*kHeightScale)
        
        return label
    }()
    private lazy var balanceLabel:UILabel = {
        let label = UILabel.yk_createLabel(text: "余额：888", textColor: 0x666666, fontSize: 12*kHeightScale)
        return label
    }()
    private lazy var fromLabel:UILabel = {
        let label = UILabel.yk_createLabel(text: "外婆家（湖滨店）", textColor: 0x999999, fontSize: 10*kHeightScale)
        return label
    }()
    private lazy var typeLabel:UILabel = {
        let label = UILabel.yk_createLabel(text: "收益票收入", textColor: 0x999999, fontSize: 10*kHeightScale)
        return label
    }()
    private lazy var lineView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.yk_colorWithHex(hex: 0xfafafa)
        return view
    }()

    
    

}
