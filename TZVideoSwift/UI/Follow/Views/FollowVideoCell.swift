//
//  FollowVideoCell.swift
//  TZVideoSwift
//
//  Created by 陈学明 on 2018/11/2.
//

import UIKit

class FollowVideoCell: FollowBaseCell {
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var coverImageHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        coverImageView.backgroundColor = UIColor.lightGray
        coverImageHeight.constant = (UIScreen.main.bounds.width - 20) * 9 / 16
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func configWithData(data: AnyObject) {
        super.configWithData(data: data)
        if data is FollowListItem {
            let item = data as! FollowListItem
            coverImageView.setImageWith(URL(string: item.video.cover)!)
            self.updateConstraints()
        }

    }
    
}
