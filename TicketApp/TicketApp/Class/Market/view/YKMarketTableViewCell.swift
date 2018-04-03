//
//  YKMarketTableViewCell.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2018/3/29.
//  Copyright © 2018年 hangzhouzhulongkeji. All rights reserved.
//

import UIKit

class YKMarketTableViewCell: UITableViewCell {

    var model:YKMarketModel2?{
        didSet{
            nameLabel.text = model?.name
            contentLabel.text = model?.desc
        }
    }
    private lazy var restaurantImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "market_cell_placehoder")
        
        return imageView
    }()
    private lazy var nameLabel:UILabel = {
        let label = UILabel()
        label.text = "新白鹿餐厅"
        label.font = UIFont.systemFont(ofSize: 14*kHeightScale)
        label.textColor = UIColor.yk_colorWithHex(hex: 0x000)
//        label.
        return label
    }()
    private lazy var contentLabel:UILabel = {
        let label = UILabel()
        label.text = "杭州知名中餐连锁餐厅，成立于1998年，广受长三角人民喜爱和好评，我们都喜欢，大家好才是真的好。"
        label.font = UIFont.systemFont(ofSize: 14*kHeightScale)
        label.textColor = UIColor.yk_colorWithHex(hex: 0x999999)
        label.numberOfLines = 0
//        label.attributedText = self.getAttributeStringWithString(label.text, lineSpace: 5)
        return label
        
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    fileprivate func setupUI(){
        self.contentView.addSubview(restaurantImageView)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(contentLabel)
        restaurantImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(10*kWidthScale)
            make.top.equalTo(self.contentView)
            
        }
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(restaurantImageView)
            make.top.equalTo(restaurantImageView.snp.bottom).offset(10*kHeightScale)
        }
        contentLabel.snp.makeConstraints { (make) in
            make.left.equalTo(restaurantImageView)
            make.top.equalTo(nameLabel.snp.bottom).offset(8*kHeightScale)
            make.right.equalTo(self.contentView).offset(-10*kWidthScale)
            make.bottom.equalTo(self.contentView).offset(-20*kHeightScale)
        }
        
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
//    fileprivate func getAttributeStringWithString(_ string: String?,lineSpace:CGFloat
//        ) -> NSAttributedString{
//        let attributedString = NSMutableAttributedString(string: string!)
//        let paragraphStye = NSMutableParagraphStyle()
//
//        //调整行间距
//        paragraphStye.lineSpacing = lineSpace
//        let range = NSMakeRange(0, CFStringGetLength(string as CFString!))
//        attributedString.addAttribute(？？, value: paragraphStye, range: range)
//        return attributedString
//
//    }

}
