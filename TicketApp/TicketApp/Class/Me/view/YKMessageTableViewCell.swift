//
//  YKMessageTableViewCell.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2018/4/2.
//  Copyright © 2018年 hangzhouzhulongkeji. All rights reserved.
//

import UIKit

class YKMessageTableViewCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI(){
        self.contentView.addSubview(self.iconImageView)
        self.contentView.addSubview(self.typeLable)
        self.contentView.addSubview(self.lineView)
        self.contentView.addSubview(self.nameLable)
        self.contentView.addSubview(self.timeLable)
        self.contentView.addSubview(self.commentLable)
        self.iconImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.contentView)
            make.left.equalTo(self.contentView).offset(10*kWidthScale)
        }
        self.typeLable.snp.makeConstraints { (make) in
            make.left.equalTo(self.iconImageView.snp.right).offset(10*kWidthScale)
            make.centerY.equalTo(self.iconImageView)
        }
        self.nameLable.snp.makeConstraints { (make) in
            make.left.equalTo(self.typeLable)
            make.bottom.equalTo(self.typeLable.snp.top).offset(-4*kHeightScale)
        }
        self.timeLable.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.nameLable)
            make.left.equalTo(self.nameLable.snp.right).offset(10*kWidthScale)
        }
        self.commentLable.snp.makeConstraints { (make) in
            make.left.equalTo(self.typeLable)
            make.top.equalTo(self.typeLable.snp.bottom).offset(4*kHeightScale)
        }
        self.lineView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self.contentView)
            make.height.equalTo(1*kHeightScale)
        }
        
    }

    private lazy var iconImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"home_message_icon_placehoder")
        return imageView
    }()
    private lazy var nameLable:UILabel = {
        let label = UILabel()
        label.text = "上善若水"
        label.textColor = UIColor.yk_colorWithHex(hex: 0x333333)
        label.font = UIFont.systemFont(ofSize: 14*kHeightScale)
        return label
    }()
    private lazy var timeLable:UILabel = {
        let label = UILabel()
        label.text = "一天前"
        label.textColor = UIColor.yk_colorWithHex(hex: 0x999999)
        label.font = UIFont.systemFont(ofSize: 10*kHeightScale)
        return label
    }()
    private lazy var typeLable:UILabel = {
        let label = UILabel()
        label.text = "有人给你评论留言了"
        label.textColor = UIColor.yk_colorWithHex(hex: 0x666666)
        label.font = UIFont.systemFont(ofSize: 12*kHeightScale)
        return label
    }()
    private lazy var commentLable:UILabel = {
        let label = UILabel()
        label.text = "接下来是研发新品菜系还是店铺装修？"
        label.textColor = UIColor.yk_colorWithHex(hex: 0x666666)
        label.font = UIFont.systemFont(ofSize: 12*kHeightScale)
        return label
    }()

    private lazy var lineView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.yk_colorWithHex(hex: 0xf5f5f5)
        return view
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
