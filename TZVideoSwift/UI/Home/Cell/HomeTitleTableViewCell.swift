//
//  HomeTitleTableViewCell.swift
//  TZVideoSwift
//
//  Created by 陈学明 on 2018/10/22.
//

import UIKit

class HomeTitleTableViewCell: TZTableViewCell {

    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.imageView?.backgroundColor = UIColor(hex: 0xFCCA07)
        self.titleLabel.sakura.textColor()("App.TableViewCellTitleTextColor")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func configWithData(data: AnyObject) {
        if data is HomeTemplateItem {
            let item = (data as! HomeTemplateItem).templateData.first
            self.titleLabel.text = item?.title
//            let request = URLRequest(url: URL(item.img)!)
            
            self.iconView.setImageWith(URL(string:(item?.img)!)!)
        }
    }
    
}
