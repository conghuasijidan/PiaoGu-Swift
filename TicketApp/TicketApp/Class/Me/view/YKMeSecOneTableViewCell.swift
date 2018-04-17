//
//  YKMeSecOneTableViewCell.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2018/3/30.
//  Copyright © 2018年 hangzhouzhulongkeji. All rights reserved.
//

import UIKit


class YKMeSecOneTableViewCell: UITableViewCell {

    var avatarCallBack:CallBack?
    
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
        self.contentView.addSubview(self.avatarImageView)
        self.contentView.addSubview(self.nameLabel)
        self.contentView.addSubview(self.idLabel)
        self.contentView.addSubview(self.lineView)
        
        self.avatarImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(10*kWidthScale)
            make.centerY.equalTo(self.contentView).offset(-6*kHeightScale)
//            make.top.equalTo(self.contentView).offset(20*kHeightScale)
        }
        self.nameLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.avatarImageView).offset(-8*kHeightScale)
            make.left.equalTo(self.avatarImageView.snp.right).offset(10*kWidthScale)
        }
        self.idLabel.snp.makeConstraints { (make) in
//            make.centerY.equalTo(self.avatarImageView)
            make.left.equalTo(self.nameLabel)
            make.top.equalTo(self.nameLabel.snp.bottom).offset(4*kHeightScale)
        }
        self.lineView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self.contentView)
            make.height.equalTo(10*kHeightScale)
        }
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(avatarTapAction))
        
        self.avatarImageView.addGestureRecognizer(recognizer)
        
    }
    @objc private func avatarTapAction() {
        
        if avatarCallBack != nil {
            avatarCallBack!()
        }
        
    }
    
    
    
    
    private lazy var avatarImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"me_name_placehoder")
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    private lazy var nameLabel:UILabel = {
        let label = UILabel()
        label.text = "葱花思鸡蛋"
        label.font = UIFont.systemFont(ofSize: 18*kHeightScale)
        label.textColor = UIColor.yk_colorWithHex(hex: 0x333333)
        return label
    }()
    private lazy var idLabel:UILabel = {
        let label = UILabel()
        label.text = "账号：19202938"
        label.font = UIFont.systemFont(ofSize: 12*kHeightScale)
        label.textColor = UIColor.yk_colorWithHex(hex: 0x333333)
        return label
    }()
    private lazy var lineView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.yk_colorWithHex(hex: 0xf5f5f5)
        return view
    }()
    

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
