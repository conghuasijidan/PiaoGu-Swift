//
//  YKBalanceTableViewCell.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2018/4/2.
//  Copyright © 2018年 hangzhouzhulongkeji. All rights reserved.
//

import UIKit

class YKBalanceTableViewCell: UITableViewCell {

    var iconImage:UIImage?{
        didSet{
            self.iconImageView.image = iconImage
        }
    }
    var descText:String?{
        didSet{
            self.descLable.text = descText
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
        self.backgroundColor = UIColor.white
        self.contentView.addSubview(self.iconImageView)
        self.contentView.addSubview(self.descLable)
        self.contentView.addSubview(self.rightArrow)
        self.contentView.addSubview(self.lineView)
       
        self.iconImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.contentView)
            make.left.equalTo(self.contentView).offset(10*kWidthScale)
        }
        self.rightArrow.snp.makeConstraints { (make) in
            make.right.equalTo(self.contentView).offset(-10*kWidthScale)
            make.centerY.equalTo(self.contentView)
        }
        
        self.descLable.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.contentView)
            make.left.equalTo(self.iconImageView.snp.right).offset(15*kWidthScale)
        }
        self.lineView.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.contentView)
            make.left.right.equalTo(self.contentView)
            make.height.equalTo(1*kHeightScale)
        }
        
    }
    private lazy var iconImageView:UIImageView = {
        let imageView = UIImageView()
    
        return imageView
    }()
    private lazy var descLable:UILabel = {
        let label = UILabel()
        label.text = "充值"
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
