//
//  DiscoveryTableViewCell.swift
//  TZVideoSwift
//
//  Created by 陈学明 on 2018/10/31.
//

import UIKit

class DiscoveryTableViewCell: TZTableViewCell {
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var coverImageViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    
    fileprivate var cellData:DiscoveryListItem!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func configWithData(data: AnyObject) {
        if data is DiscoveryListItem{
            self.cellData = (data as! DiscoveryListItem)
            self.coverImageView.setImageWith(URL(string:cellData.cover)!)
            self.titleLabel.text = cellData.title
            self.durationLabel.text = cellData.duration
            self.nameLabel.text = cellData.publisher.name
            self.avatarImageView.setImageWith(URL(string: cellData.publisher.avatar)!)
        }
    }
}
