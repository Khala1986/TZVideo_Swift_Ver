//
//  UCCollectionSettingsCell.swift
//  TZVideoSwift
//
//  Created by 陈学明 on 2018/11/4.
//

import UIKit
import Masonry
class UCSettingCell: UICollectionViewCell {
    
    var image:UIImageView!
    var label:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = 7
        self.contentView.layer.cornerRadius = 7
        self.contentView.layer.masksToBounds = true
        
        image = UIImageView()
        image.clipsToBounds = true
        image.backgroundColor = UIColor.lightGray
        image.contentMode = UIView.ContentMode.scaleAspectFill
        self.addSubview(image)
        image.mas_makeConstraints { (maker:MASConstraintMaker?) in
            maker?.centerX.equalTo()(self)
            maker?.centerY.equalTo()(self)?.offset()(-2)
            maker?.width.height().equalTo()(30)
        }
        
        label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.backgroundColor = UIColor.init(white: 0, alpha: 0.3)
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 2
        label.lineBreakMode = NSLineBreakMode.byTruncatingTail
        self.addSubview(label)
        label.mas_makeConstraints { (maker:MASConstraintMaker?) in
            maker?.leading.trailing()?.equalTo()(self)
            maker?.top.equalTo()(image.mas_bottom)?.offset()(10)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

class UCCollectionSettingsCell: TZTableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    var dataArray:[Array<String>]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        titleLabel.sakura.textColor()("UserCenter.SettingCellTitleTextColor");
        collectionView.sakura.backgroundColor()("UserCenter.BackgroundColor");
        collectionView.register(UCSettingCell.self, forCellWithReuseIdentifier: "UCSettingCell")
        dataArray = [["离线下载", "personal_icon_download"], ["更换主题", "personal_icon_theme"],["反馈建议", "personal_icon_feedback"], ["关于我们", "personal_icon_about"]]
        let cHeight = CGFloat((dataArray.count % 3 == 0 ? dataArray.count/3 : dataArray.count/3+1 )) * UIScreen.main.bounds.size.width/3.0
        collectionViewHeight.constant = cHeight
        collectionView.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = UIScreen.main.bounds.size.width/3.0
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UCSettingCell", for: indexPath) as! UCSettingCell
        let cellConfigs = dataArray[indexPath.item]
        cell.image.image = UIImage(named: cellConfigs[1])
        cell.label.text = cellConfigs[0]
        return cell
    }
    
}
