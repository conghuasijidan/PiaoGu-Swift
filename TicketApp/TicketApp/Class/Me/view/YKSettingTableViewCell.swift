//
//  YKSettingTableViewCell.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2018/4/3.
//  Copyright © 2018年 hangzhouzhulongkeji. All rights reserved.
//

import UIKit

class YKSettingTableViewCell: UITableViewCell {

    var name:String?{
        didSet{
            guard let nameStr = name else {
                return
            }
            self.nameLable.text = nameStr
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
        
        self.contentView.addSubview(self.nameLable)
        self.contentView.addSubview(self.arrowImageView)
        self.contentView.addSubview(self.lineView)
        
        self.nameLable.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(10*kWidthScale)
            make.centerY.equalTo(self.contentView)
        }
        self.arrowImageView.snp.makeConstraints { (make) in
            make.right.equalTo(self.contentView).offset(-10*kWidthScale)
            make.centerY.equalTo(self.contentView)
        }
        self.lineView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalTo(self.contentView)
            make.height.equalTo(1*kHeightScale)
        }
        
        
    }
    
    private lazy var nameLable:UILabel = {
        let label = UILabel()
        label.text = "消息设置"
        label.textColor = UIColor.yk_colorWithHex(hex: 0x333333)
        label.font = UIFont.systemFont(ofSize: 14*kHeightScale)
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
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
