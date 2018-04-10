//
//  YKHomeUserTableViewCell.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2018/1/2.
//  Copyright © 2018年 hangzhouzhulongkeji. All rights reserved.
//

import UIKit

class YKHomeUserTableViewCell: UITableViewCell {

    var messageCallBack:CallBack?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    fileprivate func setupUI(){
        
        self.contentView.addSubview(bgImageView)
        self.contentView.addSubview(avatarImageView)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(messageButton)
        self.contentView.addSubview(lineView)
        
        bgImageView.snp.makeConstraints { (make) in
            make.center.equalTo(self.contentView)
            make.size.equalTo(self.contentView)
        }
        avatarImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.contentView)
            make.left.equalTo(self.contentView).offset(20*kWidthScale)
        }
        nameLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.contentView)
            make.left.equalTo(avatarImageView.snp.right).offset(8*kWidthScale)
        }
        messageButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.contentView)
            make.right.equalTo(self.contentView).offset(-20*kWidthScale)
        }
        lineView.snp.makeConstraints { (make) in
            make.bottom.left.right.equalTo(self.contentView)
            make.height.equalTo(1)
            
        }
        
        
        
    }

    private lazy var bgImageView = UIImageView(image:UIImage(named:"home_user_bg"))
    private lazy var avatarImageView = UIImageView(image:UIImage(named:"home_user_icon_placehoder"))
    private lazy var nameLabel = UILabel.yk_createLabel(text: "葱花思鸡蛋", textColor: 0xffffff, fontSize: 14*kHeightScale)
    
    private lazy var messageButton:UIButton = {
        
        let button = UIButton()
        
        button.setImage(UIImage(named:"home_message_normal"), for: .normal)
        button.setImage(UIImage(named:"home_message_selected"), for: .selected)
        button.addTarget(self, action: #selector(navMessageAction), for: .touchUpInside)
        
        return button
        
    }()
    private lazy var lineView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.yk_colorWithHex(hex: 0xf5f5f5)
        view.alpha = 0.15
        return view
    }()

   @objc private func navMessageAction() {
        
    if messageCallBack != nil {
        messageCallBack!()
    }
        
    }
    
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
