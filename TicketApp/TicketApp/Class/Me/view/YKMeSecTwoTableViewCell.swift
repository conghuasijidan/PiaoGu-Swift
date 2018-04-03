//
//  YKMeSecTwoTableViewCell.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2018/3/30.
//  Copyright © 2018年 hangzhouzhulongkeji. All rights reserved.
//

import UIKit

class YKMeSecTwoTableViewCell: UITableViewCell {
    
    var iconImage:UIImage?{
        didSet{
            self.iconImageView.image = iconImage
        }
    }
    var descText:String?{
        didSet{
            self.descLabel.text = descText
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
        self.contentView.addSubview(self.iconImageView)
        self.contentView.addSubview(self.descLabel)
        self.contentView.addSubview(self.arrowImageView)
        self.contentView.addSubview(self.lineView)
        
        self.iconImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(10*kWidthScale)
            make.centerY.equalTo(self.contentView)
        }
        self.descLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.iconImageView)
            make.left.equalTo(self.iconImageView.snp.right).offset(10*kWidthScale)
        }
        self.arrowImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.iconImageView)
            make.right.equalTo(self.contentView).offset(-10*kWidthScale)
        }
        self.lineView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self.contentView)
            make.height.equalTo(1*kHeightScale)
        }
        
        
    }    

    private lazy var iconImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"me_message")
        return imageView
    }()
    private lazy var descLabel:UILabel = {
        let label = UILabel()
        label.text = "个人信息"
        label.font = UIFont.systemFont(ofSize: 14*kHeightScale)
        label.textColor = UIColor.yk_colorWithHex(hex: 0x333333)
        return label
    }()
    private lazy var arrowImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"me_rightArrow")
        return imageView
    }()
    private lazy var lineView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.yk_colorWithHex(hex: 0xf5f5f5)
        return view
    }()

}
