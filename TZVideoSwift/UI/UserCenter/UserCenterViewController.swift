//
//  UserCenterViewController.swift
//  TZVideoSwift
//
//  Created by 陈学明 on 2018/10/14.
//

import UIKit
import SakuraKit
import Masonry

class UserCenterViewController: TZBaseViewController {

    lazy var tableViewProxy:UserCenterTableViewProxy = {
        let tableViewProxy = UserCenterTableViewProxy(identifier: "FollowTableViewCell", configClosure: { (cell:TZTableViewCell, cellData:AnyObject, indexpath:IndexPath) in
            cell.contentView.sakura.backgroundColor()("Home.BackgroundColor")
            cell.configWithData(data: cellData)
        }, actionClosure: { (cell:TZTableViewCell, cellData:AnyObject, indexpath:IndexPath) in
            
        })
        return tableViewProxy
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "个人中心"
        // Do any additional setup after loading the view.
        self.contentView.addSubview(tableViewProxy.tableView)
        tableViewProxy.tableView.mas_makeConstraints { (maker:MASConstraintMaker?) in
            maker?.edges.equalTo()(self.contentView)
        }

    
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
