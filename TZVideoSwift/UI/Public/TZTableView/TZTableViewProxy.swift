//
//  TZTableViewProxy.swift
//  TZVideoSwift
//
//  Created by 陈学明 on 2018/10/15.
//

import UIKit


class TZTableViewProxy: NSObject, UITableViewDataSource, UITableViewDelegate {
    typealias TZTVConfigClosures = (TZTableViewCell, AnyObject, IndexPath) -> Void
    typealias TZTVActionClosures = (TZTableViewCell, AnyObject, IndexPath) -> Void
    var reuseIdentifier:String!
    var cellConfigClosure:TZTVConfigClosures!
    var cellActionClosure:TZTVActionClosures!
    var dataArray:Array<Any>!
    lazy var tableView: UITableView = {
        let tempTableView = UITableView (frame: CGRect.zero, style: .plain)
        tempTableView.delegate = self
        tempTableView.dataSource = self
        return tempTableView
    }()

    
    override init() {
        super.init()
    }
    
    convenience init( identifier: String, configClosure: @escaping TZTVConfigClosures, actionClosure: @escaping TZTVActionClosures){
        self.init()
        reuseIdentifier = identifier
        cellConfigClosure = configClosure
        cellActionClosure = actionClosure
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cellConfigClosure(cell as! TZTableViewCell, dataArray?[indexPath.row] as AnyObject,indexPath)
        
        return cell;
    }
    
}
