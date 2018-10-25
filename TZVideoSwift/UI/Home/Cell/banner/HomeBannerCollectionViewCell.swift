//
//  HomeCollectionViewCell.swift
//  TZVideoSwift
//
//  Created by 陈学明 on 2018/10/22.
//

import UIKit

class HomeBannerCollectionViewCell: TZCollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func config(data:Any) {
        if data is HomeTemplateData{
            let item = data as! HomeTemplateData
            self.titleLabel.text = item.title
            self.subTitleLabel.text = item.subTitle
            imageView.setImageWith(URL(string: item.img)!)
        }
    }
}
