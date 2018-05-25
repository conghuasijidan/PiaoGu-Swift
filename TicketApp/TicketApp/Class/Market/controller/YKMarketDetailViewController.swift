//
//  YKMarkerDetailViewController.swift
//  TicketApp
//
//  Created by 葱花思鸡蛋 on 2018/4/8.
//  Copyright © 2018年 hangzhouzhulongkeji. All rights reserved.
//

import UIKit

class YKMarketDetailViewController: YKBaseViewController,UITableViewDelegate,UITableViewDataSource {
    private let ONECELLID  = "sectionOneID"
    private let TWOWCELLID = "sectionTwoID"
    private var tableView:UITableView?
    private var modelList:[YKCommentModel]? = [YKCommentModel]()
    private var cellHeightCache:[String:NSNumber] = [String:NSNumber]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "产品详情"
        self.view.backgroundColor = UIColor.white
//        modelList = [nil]
        loadData()
        setupUI()
        
    }
    func loadData() {
        let dictArr = [["content":"扛住了 柴米油盐的麻烦 扛住了 朋友聚会的调侃","id":"0"],["content":"扛住了 世俗生活的刁难 却扛不住 对你的喜欢 亦步亦趋随你至深不可测 患得患失唯恐你杳不可得 却只面不改色","id":"1"],["content":"为你我认了 一朝一夕使我已固不可彻 若即若离本应是罪不可赦 怎不忍心怪你 对我太独特 无时无刻","id":"2"],["content":"像是一首无法停止单曲循环的无名歌 扛住了 柴米油盐的麻烦 扛住了 朋友聚会的调侃 扛住了 世俗生活的刁难 却扛不住 对你的喜欢","id":"3"],["content":"躲过了 世界末日的灾难 明白了 生命是千金不换 躲过了 大悲狂喜的极端 却躲不过 对你的喜欢 亦步亦趋随你至深不可测 患得患失唯恐你杳不可得","id":"4"],["content":"扛住了 柴米油盐的麻烦 扛住了 朋友聚会的调侃","id":"5"],["content":"扛住了 世俗生活的刁难 却扛不住 对你的喜欢 亦步亦趋随你至深不可测 患得患失唯恐你杳不可得 却只面不改色","id":"6"],["content":"为你我认了 一朝一夕使我已固不可彻 若即若离本应是罪不可赦 怎不忍心怪你 对我太独特 无时无刻","id":"7"],["content":"像是一首无法停止单曲循环的无名歌 扛住了 柴米油盐的麻烦 扛住了 朋友聚会的调侃 扛住了 世俗生活的刁难 却扛不住 对你的喜欢","id":"8"],["content":"躲过了 世界末日的灾难 明白了 生命是千金不换 躲过了 大悲狂喜的极端 却躲不过 对你的喜欢 亦步亦趋随你至深不可测 患得患失唯恐你杳不可得","id":"9"],["content":"扛住了 柴米油盐的麻烦 扛住了 朋友聚会的调侃","id":"10"],["content":"扛住了 世俗生活的刁难 却扛不住 对你的喜欢 亦步亦趋随你至深不可测 患得患失唯恐你杳不可得 却只面不改色","id":"11"],["content":"为你我认了 一朝一夕使我已固不可彻 若即若离本应是罪不可赦 怎不忍心怪你 对我太独特 无时无刻","id":"12"],["content":"像是一首无法停止单曲循环的无名歌 扛住了 柴米油盐的麻烦 扛住了 朋友聚会的调侃 扛住了 世俗生活的刁难 却扛不住 对你的喜欢","id":"13"],["content":"躲过了 世界末日的灾难 明白了 生命是千金不换 躲过了 大悲狂喜的极端 却躲不过 对你的喜欢 亦步亦趋随你至深不可测 患得患失唯恐你杳不可得","id":"14"],["content":"扛住了 柴米油盐的麻烦 扛住了 朋友聚会的调侃","id":"15"],["content":"扛住了 世俗生活的刁难 却扛不住 对你的喜欢 亦步亦趋随你至深不可测 患得患失唯恐你杳不可得 却只面不改色","id":"16"],["content":"为你我认了 一朝一夕使我已固不可彻 若即若离本应是罪不可赦 怎不忍心怪你 对我太独特 无时无刻","id":"17"],["content":"像是一首无法停止单曲循环的无名歌 扛住了 柴米油盐的麻烦 扛住了 朋友聚会的调侃 扛住了 世俗生活的刁难 却扛不住 对你的喜欢","id":"18"],["content":"躲过了 世界末日的灾难 明白了 生命是千金不换 躲过了 大悲狂喜的极端 却躲不过 对你的喜欢 亦步亦趋随你至深不可测 患得患失唯恐你杳不可得","id":"19"]]
        for dict in dictArr {
            let model = YKCommentModel(dict: dict)
            modelList?.append(model)
        }
    }
    
    fileprivate func setupUI(){
        
        let height = result ? (viewHeight - 34):viewHeight
        let tableView = UITableView(frame: CGRect(x:0,y:0,width:kScreenWidth,height:height), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(YKMarketDetailOneTableViewCell.self, forCellReuseIdentifier: ONECELLID)
        tableView.register(YKMarketDetailTwoTableViewCell.self, forCellReuseIdentifier: TWOWCELLID)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 130
        tableView.separatorStyle = .none
        self.view.addSubview(tableView)
        self.tableView = tableView
        
        let headerView = UIView(frame:CGRect(x: 0, y: 0, width: kScreenWidth, height: 216*kHeightScale))
        headerView.backgroundColor = UIColor.white
        headerView.addSubview(self.headerImageView)
//        headerView.addSubview(self.levelLabel)
        self.headerImageView.snp.makeConstraints { (make) in
            make.left.equalTo(headerView).offset(10*kWidthScale)
            make.right.equalTo(headerView).offset(-10*kWidthScale)
            make.top.equalTo(headerView).offset(20*kHeightScale)
            make.height.equalTo(196*kHeightScale)
        }
        //        MARK:需要自己绘制风险评估时
//        self.levelLabel.snp.makeConstraints { (make) in
//            make.left.right.bottom.equalTo(self.headerImageView)
//            make.height.equalTo(30*kHeightScale)
//        }
        
        tableView.tableHeaderView = headerView
        setupBottomView()
        
        
    }
    func setupBottomView(){
        
        let bottomView = UIView()
        bottomView.backgroundColor = UIColor.white
//        bottomView.layer.borderWidth = 1
//        bottomView.layer.borderColor = UIColor.yk_colorWithHex(hex:0xfafafa).cgColor
        self.view.addSubview(bottomView)
        
        bottomView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.bottom.equalTo(self.view).offset(-34)
            make.height.equalTo(49)
        }
        if result == false {
            bottomView.snp.updateConstraints({ (make) in
                make.bottom.equalTo(self.view)
            })
        }
        bottomView.addSubview(self.commentButton)
        bottomView.addSubview(self.investButton)
        
        self.commentButton.snp.makeConstraints { (make) in
            make.left.top.bottom.equalTo(bottomView)
            make.right.equalTo(bottomView).multipliedBy(0.34)
        }
        self.investButton.snp.makeConstraints { (make) in
            make.right.top.bottom.equalTo(bottomView)
            make.left.equalTo(self.commentButton.snp.right)
        }
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return modelList?.count ?? 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell:YKMarketDetailOneTableViewCell =
                tableView.dequeueReusableCell(withIdentifier: ONECELLID, for: indexPath) as! YKMarketDetailOneTableViewCell
            cell.selectionStyle = .none
            return cell
        }else{
            let cell:YKMarketDetailTwoTableViewCell =
                tableView.dequeueReusableCell(withIdentifier: TWOWCELLID, for: indexPath) as! YKMarketDetailTwoTableViewCell
             cell.selectionStyle = .none
            if let list = modelList {
                cell.model = list[indexPath.row]
            }
            return cell
        }
    }
    //    MARK: 行高缓存 除非缓存到本地，不然没效果
    
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
////     判断行高是否缓存  从缓存中取出行高
//        if indexPath.section == 0 {
//            return 489
//        }
//
//        if let list = modelList {
//            let model:YKCommentModel = list[indexPath.row]
//            guard let id = model.id else{
//                return 130
//            }
//            let cellHeight = cellHeightCache[id]
////            没有缓存的高度
//            guard let height = cellHeight else{
//                return 130
//            }
////            缓存的高度
//            return CGFloat(height.floatValue)
//        }
//
//       return 130
//    }
//
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        if indexPath.section == 0 {
//            return
//        }
//        let height = Float(cell.frame.size.height)
//        let cellheight = NSNumber(value: height)
//        YKLog(message: height)
//        if let list = modelList {
//            let model:YKCommentModel = list[indexPath.row]
//            //        高度缓存
//            cellHeightCache.updateValue(cellheight, forKey: model.id!)
//        }
//
//    }
    
    
    //   MARK: 评论点击事件
   @objc private func commentButtonAction(){
        YKLog(message: "评论点击事件")
    }
    @objc private func investButtonAction(){
        YKLog(message: "投资点击事件")
    }
    
    private lazy var headerImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "detail_adverimage_placehoder")
//        let imgPath = Bundle.main.path(forResource: "home_account_bg.png", ofType: nil)
//        imageView.image = UIImage(contentsOfFile: imgPath!)
        return imageView
    }()

    private lazy var levelLabel:UILabel = {
        let label = UILabel.yk_createLabel(text: "风险评级：A+", textColor: 0xffffff, fontSize: 14*kHeightScale)
        label.textAlignment = NSTextAlignment.left
        label.backgroundColor = UIColor.black.withAlphaComponent(0.4)
//        label.alpha = 0.4
        return label
    }()
    private lazy var commentButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named:"market_comment_btn_normal"), for: .normal)
        button.addTarget(self, action: #selector(commentButtonAction), for: .touchUpInside)
        return button
    }()
    private lazy var investButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named:"market_detail_invest_btn"), for: .normal)
        button.addTarget(self, action: #selector(investButtonAction), for: .touchUpInside)
        return button
    }()
   

}
