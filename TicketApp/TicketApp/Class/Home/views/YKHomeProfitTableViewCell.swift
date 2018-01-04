//
//  YKHomeProfitTableViewCell.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2018/1/2.
//  Copyright © 2018年 hangzhouzhulongkeji. All rights reserved.
//

import UIKit

class YKHomeProfitTableViewCell: UITableViewCell {
    
    var bgImage: UIImage?{
        
        didSet{
            bgImageView.image = bgImage
        }
    }
    

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
        
        bgImageView.snp.makeConstraints { (make) in
            make.center.size.equalTo(self.contentView)
        }

        
    }

    private lazy var bgImageView = UIImageView()
    private lazy var titleLabel = UILabel.yk_createLabel(text: "投资宝收益", textColor: 0xffffff, fontSize: 24*kWidthScale)
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
