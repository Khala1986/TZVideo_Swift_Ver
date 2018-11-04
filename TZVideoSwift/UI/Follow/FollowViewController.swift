//
//  FollowViewController.swift
//  TZVideoSwift
//
//  Created by 陈学明 on 2018/10/14.
//

import UIKit
import Masonry

class FollowViewController: TZBaseViewController {
    lazy var tableViewProxy:FollowTableViewProxy = {
        let tableViewProxy = FollowTableViewProxy(identifier: "FollowTableViewCell", configClosure: { (cell:TZTableViewCell, cellData:AnyObject, indexpath:IndexPath) in
            cell.contentView.sakura.backgroundColor()("Home.BackgroundColor")
            cell.configWithData(data: cellData)
        }, actionClosure: { (cell:TZTableViewCell, cellData:AnyObject, indexpath:IndexPath) in
            
        })
        return tableViewProxy
    }()
    var dataSource:FollowDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title =  "关注"
        // Do any additional setup after loading the view.
        self.contentView.addSubview(tableViewProxy.tableView)
        tableViewProxy.tableView.mas_makeConstraints { (maker:MASConstraintMaker?) in
            maker?.edges.equalTo()(self.contentView)
        }
        dataSource = FollowDataSource()
        dataSource.getFollowList(page: 0) { (response:Any) in
            tableViewProxy.dataArray = (response as! FollowListResponse).data
            for item in (response as! FollowListResponse).data {
                tableViewProxy.tableView.register(UINib.init(nibName:item.cellClassName(), bundle: nil), forCellReuseIdentifier: item.cellClassName())
            }
            tableViewProxy.tableView.reloadData()
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
