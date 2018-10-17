//
//  TZShare.swift
//  TZVideoSwift
//
//  Created by 陈学明 on 2018/10/17.
//

import UIKit
import Masonry
class TZShareCell: UICollectionViewCell {
    var icon:UIImageView!
    var label:UILabel!
    override init(frame: CGRect) {
        super.init(frame:frame)
        icon = UIImageView()
        self.contentView.addSubview(icon)
        icon.mas_makeConstraints {(make: MASConstraintMaker!) in
            make.width.height()?.equalTo()(50)
            make.centerX.equalTo()(self.contentView)
            make.centerY.equalTo()(self.contentView)?.offset()(-10)
        }
        label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .center
        self.contentView.addSubview(label)
        label.mas_makeConstraints { (make: MASConstraintMaker!) in
            make.centerX.width()?.equalTo()(self.contentView)
            make.top.equalTo()(icon.mas_bottom)?.offset()(5)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class TZShare: UIView, UICollectionViewDataSource, UICollectionViewDelegate {
    var configs:Array<Any>!;
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.size.width/5.0, height: 10)
        layout.minimumLineSpacing = 0.0
        layout.minimumInteritemSpacing = 0.0
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        let tempcollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height>=812 ? 120:100 ), collectionViewLayout: layout)
        tempcollectionView.dataSource = self
        tempcollectionView.delegate = self
        tempcollectionView.backgroundColor = .white
        tempcollectionView.register(TZShareCell.self, forCellWithReuseIdentifier:"TZShareCell")
        return tempcollectionView
        
    }()

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    class func showShareSheet() {
        let configs = [["朋友圈", "share_friendCirle"], ["微信", "share_wechat"], ["微博", "share_weibo"], ["QQ", "share_qqFriend"], ["QQ空间", "share_qqZone"]]
        let superview = UIApplication.shared.keyWindow
        let share = TZShare(cfArr: configs)
        share.alpha = 0
        superview?.addSubview(share)
        
        var frame = share.collectionView.frame
        frame.origin.x = share.bounds.size.height
        share.collectionView.frame = frame
        frame.origin.y = share.bounds.size.height - share.collectionView.bounds.size.height
        UIView.animate(withDuration: 0.2) {
            share.alpha = 1
            share.collectionView.frame = frame
        }
        
    }
    
    convenience init(cfArr:Array<Any>) {
        self.init()
        self.backgroundColor = UIColor(white: 0, alpha: 0.2)
        let button = UIButton(type:.custom)
        button.addTarget(self, action: #selector(dismissAction), for: UIControl.Event.touchUpInside)
        self.addSubview(button)
        self.addSubview(collectionView)
        configs = cfArr
        collectionView.reloadData()
    }
    
    @objc func dismissAction() {
        var frame = collectionView.frame
        frame.origin.y = self.bounds.size.height
        UIView.animate(withDuration: 0.2, animations: {
            self.alpha = 0
            self.collectionView.frame = frame
        }) { (finished:Bool) in
            self.removeFromSuperview()
        }
        
    }
    
    override init(frame:CGRect){
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return configs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"TZShareCell" , for: indexPath) as! TZShareCell//collectionView.dequeueReusableCell(withReuseIdentifier:"TZShareCell", for: indexPath) as! TZShareCell
        let config:Array<String> = configs![indexPath.item] as! Array;
        cell.label.text = config[0]
        cell.icon.image = UIImage(named: config[1])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.dismissAction();
    }
    
}
