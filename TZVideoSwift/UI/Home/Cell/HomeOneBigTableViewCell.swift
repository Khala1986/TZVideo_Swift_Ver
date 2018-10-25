//
//  HomeOneBigTableViewCell.swift
//  TZVideoSwift
//
//  Created by 陈学明 on 2018/10/22.
//

import UIKit

class HomeOneBigTableViewCell: TZTableViewCell {

    @IBOutlet weak var templateView: HomeBaseTemplateView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func configWithData(data: AnyObject) {
        if data is HomeTemplateItem {
            let item = data as! HomeTemplateItem
            let config = item.templateData.first
            templateView.setupWithTemplateData(data: config as Any)
        }
        
    }
    
}
