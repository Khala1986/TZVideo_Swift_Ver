//
//  UserCenterTableViewProxy.swift
//  TZVideoSwift
//
//  Created by 陈学明 on 2018/11/4.
//

import UIKit

class UserCenterTableViewProxy: TZTableViewProxy {
    
    override init(identifier: String, configClosure: @escaping TZTVConfigClosures, actionClosure: @escaping TZTVActionClosures) {
        super.init(identifier: identifier, configClosure: configClosure, actionClosure: actionClosure)
        
        self.tableView.sakura.backgroundColor()("UserCenter.BackgroundColor");
        self.tableView.separatorStyle =  UITableViewCell.SeparatorStyle.none
        self.tableView.register(UINib.init(nibName:"UCUserInfoCell", bundle: nil), forCellReuseIdentifier: "UCUserInfoCell")
        self.tableView.register(UINib.init(nibName:"UCHorizontalScrollCell", bundle: nil), forCellReuseIdentifier: "UCHorizontalScrollCell")

        self.tableView.register(UINib.init(nibName:"UCCollectionSettingsCell", bundle: nil), forCellReuseIdentifier: "UCCollectionSettingsCell")

    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch indexPath.row {
        
        case 1:
            let cell = tableView .dequeueReusableCell(withIdentifier: "UCHorizontalScrollCell", for: indexPath) as! UCHorizontalScrollCell
            cell.icon.image =  UIImage(named: "personal_icon_record")
            cell.titleLabel.text = "播放记录"
            cell.contentView.sakura.backgroundColor()("UserCenter.BackgroundColor")
            return cell
        case 2:
            let cell = tableView .dequeueReusableCell(withIdentifier: "UCHorizontalScrollCell", for: indexPath) as! UCHorizontalScrollCell
            cell.icon.image =  UIImage(named: "personal_icon_fav")
            cell.titleLabel.text = "我的收藏"
            cell.contentView.sakura.backgroundColor()("UserCenter.BackgroundColor")
            return cell
        case 3:
            let cell = tableView .dequeueReusableCell(withIdentifier: "UCCollectionSettingsCell", for: indexPath) as! UCCollectionSettingsCell
            cell.contentView.sakura.backgroundColor()("UserCenter.BackgroundColor")
           return cell
        default:
            let cell = tableView .dequeueReusableCell(withIdentifier: "UCUserInfoCell", for: indexPath) as! UCUserInfoCell
            cell.contentView.sakura.backgroundColor()("UserCenter.BackgroundColor")
            return cell
        }
        
    }

}
