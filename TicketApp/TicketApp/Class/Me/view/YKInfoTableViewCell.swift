//
//  YKInfoTableViewCell.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2018/4/2.
//  Copyright © 2018年 hangzhouzhulongkeji. All rights reserved.
//

import UIKit

class YKInfoTableViewCell: UITableViewCell {
    var avatarImage:UIImage?{
        didSet{
            
            if avatarImage == nil {
                self.avatarImageView.isHidden = true
            }else{
                 self.avatarImageView.isHidden = false
                self.avatarImageView.image = avatarImage
            }
        }
    }
    var name:String?{
        didSet{
            self.nameLabel.text = name
        }
    }
    var desc:String?{
        didSet{
            if desc == nil {
                self.descLable.isHidden = true
            }else{
                self.descLable.isHidden = false
                self.descLable.text = desc
            }
        }
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI(){
        self.contentView.addSubview(self.nameLabel)
        self.contentView.addSubview(self.rightArrow)
        self.contentView.addSubview(self.avatarImageView)
        self.contentView.addSubview(self.descLable)
        self.contentView.addSubview(self.lineView)
        self.nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(10*kWidthScale)
            make.centerY.equalTo(self.contentView)
        }
        self.rightArrow.snp.makeConstraints { (make) in
            make.right.equalTo(self.contentView).offset(-10*kWidthScale)
            make.centerY.equalTo(self.contentView)
        }
        self.avatarImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.contentView)
            make.right.equalTo(self.rightArrow).offset(-15*kWidthScale)
            make.size.equalTo(CGSize(width: 30*kHeightScale, height: 30*kHeightScale))
        }
        self.descLable.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.contentView)
            make.right.equalTo(self.rightArrow).offset(-15*kWidthScale)
        }
        self.lineView.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.contentView)
            make.left.right.equalTo(self.contentView)
            make.height.equalTo(1*kHeightScale)
        }
        
        
    }
    
    private lazy var avatarImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "home_infor_placehoder")
        imageView.isHidden = true
        imageView.layer.cornerRadius = 15*kHeightScale
        imageView.layer.masksToBounds = true
        return imageView
    }()
    private lazy var nameLabel:UILabel = {
        let label = UILabel()
        label.text = "头像"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 14*kHeightScale)
        return label
    }()
    private lazy var descLable:UILabel = {
        let label = UILabel()
        label.text = "描述"
        label.textColor = UIColor.yk_colorWithHex(hex: 0x666666)
        label.font = UIFont.systemFont(ofSize: 12*kHeightScale)
        return label
    }()
    private lazy var rightArrow:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "me_rightArrow")
        return imageView
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
