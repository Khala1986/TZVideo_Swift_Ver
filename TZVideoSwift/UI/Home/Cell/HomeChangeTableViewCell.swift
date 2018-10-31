//
//  HomeChangeTableViewCell.swift
//  TZVideoSwift
//
//  Created by 陈学明 on 2018/10/22.
//

import UIKit

class HomeChangeTableViewCell: TZTableViewCell {
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.iconView.tintColor = UIColor(hex: 0xFCCA07)
        self.iconView.image = UIImage(named: "refresh_icon")?.withRenderingMode(.alwaysTemplate)
        self.titleLabel.textColor = UIColor(hex: 0xFCCA07)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func configWithData(data: AnyObject) {
        if data is HomeTemplateItem{
            let item = (data as! HomeTemplateItem).templateData.first
            self.titleLabel.text = item?.title
        }
    }
    
}
