//
//  HomeCollectionViewCell.swift
//  TZVideoSwift
//
//  Created by 陈学明 on 2018/10/22.
//

import UIKit
import Masonry

class HomeCollectionViewCell: TZCollectionViewCell {
    lazy var tableViewProxy:HomeTableViewProxy = {
        let tableViewProxy = HomeTableViewProxy(identifier: "HomeTableViewCell", configClosure: { (cell:TZTableViewCell, cellData:AnyObject, indexpath:IndexPath) in
            cell.contentView.sakura.backgroundColor()("Home.BackgroundColor")
            cell.configWithData(data: cellData)
        }, actionClosure: { (cell:TZTableViewCell, cellData:AnyObject, indexpath:IndexPath) in
        
        })
        return tableViewProxy
    }()
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView .addSubview(self.tableViewProxy.tableView)
        tableViewProxy.tableView.sakura.backgroundColor()("Home.BackgroundColor")
        tableViewProxy.tableView.mas_makeConstraints { (maker:MASConstraintMaker?) in
            maker?.edges.equalTo()(self.contentView)
        }
        self.tableViewProxy.errorView.isHidden = true
        self.contentView.addSubview(self.tableViewProxy.errorView)
        tableViewProxy.errorView.mas_makeConstraints { (maker:MASConstraintMaker?) in
            maker?.width.height()?.equalTo()(UIScreen.main.bounds.size.width)
            maker?.center.equalTo()(self.contentView)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config(response:HomeTemplateResponse){
        if response.data.count>0{
           tableViewProxy.errorView.isHidden = true
        }else{
           tableViewProxy.errorView.isHidden = false
        }
        tableViewProxy.dataArray = response.data
        
        tableViewProxy.tableView.reloadData()
        
    }
    
}
