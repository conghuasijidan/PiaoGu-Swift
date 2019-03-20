//
//  YKMarketDetailTwoTableViewCell.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2018/4/8.
//  Copyright © 2018年 hangzhouzhulongkeji. All rights reserved.
//

import UIKit

class YKMarketDetailTwoTableViewCell: UITableViewCell {

    var model:YKCommentModel?{
        didSet{
            infoLabel.text = model?.content
        }
    }
    
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
        self.contentView.addSubview(self.nameLabel)
        self.contentView.addSubview(self.infoLabel)
        self.contentView.addSubview(self.timeLabel)
        self.contentView.addSubview(self.lineView)
        self.contentView.addSubview(self.praiseButton)
        self.contentView.addSubview(self.replyButton)
        self.contentView.addSubview(self.countLabel)
        
        self.avatarImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(10*kWidthScale)
            make.top.equalTo(self.contentView).offset(20*kHeightScale)
            make.size.equalTo(CGSize(width: 30*kHeightScale, height: 30*kHeightScale))
        }
        self.nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.avatarImageView.snp.right).offset(10*kWidthScale)
            make.top.equalTo(self.avatarImageView)
        }
        self.timeLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.nameLabel)
            make.left.equalTo(self.nameLabel.snp.right).offset(10*kWidthScale)
        }
        self.infoLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.nameLabel)
            make.top.equalTo(self.nameLabel.snp.bottom).offset(10*kHeightScale)
            make.right.equalTo(self.contentView).offset(-10*kWidthScale)
        }
        self.replyButton.snp.makeConstraints { (make) in
            make.right.equalTo(self.contentView).offset(-10*kWidthScale)
            make.top.equalTo(self.infoLabel.snp.bottom).offset(10*kHeightScale)
        }
        self.praiseButton.snp.makeConstraints { (make) in
            make.right.equalTo(self.replyButton.snp.left).offset(-23*kWidthScale)
            make.centerY.equalTo(self.replyButton)
        }
        self.lineView.snp.makeConstraints { (make) in
            make.top.equalTo(self.replyButton.snp.bottom).offset(10*kHeightScale)
            make.left.right.equalTo(self.contentView)
            make.height.equalTo(1*kHeightScale)
//            设置动态行高约束
            make.bottom.equalTo(self.contentView)
        }
        self.countLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.praiseButton.snp.right).offset(2*kWidthScale)
            make.centerY.equalTo(self.praiseButton)
        }
        
       
        
    }
    @objc private func praiseButtonAction(){
        YKLog(message: "点赞")
        
    }
    @objc private func replyButtonAction(){
         YKLog(message: "回复")
        
    }

    private lazy var avatarImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"market_detail_comment_icon_placeholder")
        return imageView
    }()
    private lazy var nameLabel:UILabel = {
        let label = UILabel.yk_createLabel(text: "闪电侠", textColor: 0x666666, fontSize: 12*kHeightScale)
        return label
    }()
    private lazy var timeLabel:UILabel = {
        let label = UILabel.yk_createLabel(text: "一天前", textColor: 0x999999, fontSize: 10*kHeightScale)
        return label
        
    }()
    private lazy var infoLabel:UILabel = {
        let label = UILabel.yk_createLabel(text: "那就这样吧，再爱都曲终人散了。那就分手吧，再爱都无需挣扎", textColor: 0x333333, fontSize: 12*kHeightScale)
        label.numberOfLines = 0
        return label
        
    }()
    private lazy var lineView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.yk_colorWithHex(hex: 0xfafafa)
        return view
    }()
    private lazy var praiseButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named:"market_detail_comment_praise_normal"), for: .normal)
        button.setImage(UIImage(named:"market_detail_comment_praise_selected"), for: .selected)
        button.addTarget(self, action: #selector(praiseButtonAction), for: .touchUpInside)
        return button
    }()
    private lazy var replyButton:UIButton = {
        let button = UIButton()
        button.setTitle("回复", for: .normal)
        button.setTitleColor(UIColor.yk_colorWithHex(hex: 0x999999), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12*kHeightScale)
        button.addTarget(self, action: #selector(replyButtonAction), for: .touchUpInside)
        return button
    }()
    private lazy var countLabel:UILabel = {
        let label = UILabel.yk_createLabel(text: "3", textColor: 0x999999, fontSize: 12*kHeightScale)
        return label
    }()

    
    
    
    
}




