//
//  UCHorizontalScrollCell.swift
//  TZVideoSwift
//
//  Created by 陈学明 on 2018/11/4.
//

import UIKit
import Masonry
class UCHorizontalCell: UICollectionViewCell {
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
            maker?.edges.equalTo()(self)
        }
        
        label = UILabel()
        label.backgroundColor = UIColor.init(white: 0, alpha: 0.3)
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 10)
        label.numberOfLines = 2
        label.lineBreakMode = NSLineBreakMode.byTruncatingTail
        self.addSubview(label)
        label.mas_makeConstraints { (maker:MASConstraintMaker?) in
            maker?.leading.trailing()?.equalTo()(self)
            maker?.bottom.equalTo()(image.mas_bottom)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class UCHorizontalScrollCell: TZTableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        titleLabel.sakura.textColor()("UserCenter.SettingCellTitleTextColor");
        collectionView.sakura.backgroundColor()("UserCenter.BackgroundColor");

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
