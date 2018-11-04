//
//  DiscoveryTableViewProxy.swift
//  TZVideoSwift
//
//  Created by 陈学明 on 2018/10/31.
//

import UIKit

class DiscoveryTableViewProxy: TZTableViewProxy {
    override init( identifier: String, configClosure: @escaping TZTVConfigClosures, actionClosure: @escaping TZTVActionClosures){
        super.init(identifier: identifier, configClosure: configClosure, actionClosure: actionClosure)
        self.tableView.estimatedRowHeight = 200;
        self.tableView.sakura.backgroundColor()("Discovery.BackgroundColor");
        self.tableView.register(UINib.init(nibName:identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //视频滚动出可视范围，停止播放
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //        let item = self.dataArray[indexPath.row] as! DiscoveryListItem
        let cell = tableView.dequeueReusableCell(withIdentifier: "DiscoveryTableViewCell", for: indexPath) as! TZTableViewCell
        cellConfigClosure(cell, dataArray?[indexPath.row] as AnyObject,indexPath)
        
        return cell;

    }
    
}
