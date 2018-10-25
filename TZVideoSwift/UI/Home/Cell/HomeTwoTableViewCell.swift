//
//  HomeTwoTableViewCell.swift
//  TZVideoSwift
//
//  Created by 陈学明 on 2018/10/22.
//

import UIKit

class HomeTwoTableViewCell: TZTableViewCell {


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func configWithData(data: AnyObject) {
        if data is HomeTemplateItem{
            let tempViews = self.contentView.subviews as! [HomeBaseTemplateView]
            let item = data as! HomeTemplateItem
            for view in tempViews{
                let index = tempViews.firstIndex(of: view)
                let config = item.templateData[index!]
                view.setupWithTemplateData(data: config as Any)
            }
            
        }
    }
}
