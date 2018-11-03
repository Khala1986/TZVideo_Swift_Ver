//
//  FollowBaseCell.swift
//  TZVideoSwift
//
//  Created by 陈学明 on 2018/11/1.
//

import UIKit

class FollowBaseCell: TZTableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var contentPlaceholderView: UIView!
    
    @IBOutlet weak var praiseButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        self.contentView.sakura.backgroundColor()("Follow.BackgroundColor");
        self.nameLabel.textColor = UIColor(hex: 0xFCCA07)
        self.timeLabel.textColor = UIColor.lightGray
        self.titleLabel.sakura.textColor()("App.TableViewCellTitleTextColor");
        self.contentLabel.sakura.textColor()("App.TableViewCellDescTextColor");
        
        self.avatarImageView.clipsToBounds = true;
        self.avatarImageView.layer.cornerRadius = 25;
        
        self.titleLabel.numberOfLines = 2;
        self.titleLabel.font = UIFont.systemFont(ofSize: 14);
        self.titleLabel.lineBreakMode = NSLineBreakMode.byTruncatingTail;
        
        self.contentLabel.numberOfLines = 2;
        self.contentLabel.font = UIFont.systemFont(ofSize: 13);
        self.contentLabel.lineBreakMode = NSLineBreakMode.byTruncatingTail;


    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func configWithData(data: AnyObject) {
        if data is FollowListItem {
            let item = data as! FollowListItem
            self.nameLabel.text = item.publisher.name;
            self.timeLabel.text = "刚刚";
            self.avatarImageView.setImageWith(URL(string: item.publisher.avatar)!)
            
            self.titleLabel.text = item.title;
            self.contentLabel.text = item.desc;
        }
    }
    
    
}
