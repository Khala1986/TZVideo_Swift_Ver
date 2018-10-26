//
//  HomeTableViewProxy.swift
//  TZVideoSwift
//
//  Created by 陈学明 on 2018/10/22.
//

import UIKit

public let HomeTableViewCellIdentifiers:Dictionary<String,String> = [
    "banner":"HomeBannerTableViewCell",
    "title":"HomeTitleTableViewCell",
    "one":"HomeOneBigTableViewCell",
    "two":"HomeTwoTableViewCell",
    "change":"HomeChangeTableViewCell",
    "rank": "HomeRankTableViewCell"]

public let HomeTableViewCellHeights:Dictionary<String,CGFloat> = [
    "banner": 150*UIScreen.main.bounds.size.width/320,
    "title": 40,
    "one": 250*UIScreen.main.bounds.size.width/375,
    "two": 127*UIScreen.main.bounds.size.width/320,
    "change": 40,
    "rank": 210*UIScreen.main.bounds.size.width/375]

class HomeTableViewProxy: TZTableViewProxy {
    
    convenience init( identifier: String, configClosure: @escaping TZTVConfigClosures, actionClosure: @escaping TZTVActionClosures){
        self.init()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        for className in HomeTableViewCellIdentifiers.values{
            self.tableView.register(UINib.init(nibName: className, bundle: nil), forCellReuseIdentifier: className)
        }
        
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = self.dataArray[indexPath.row] as! HomeTemplateItem
        return HomeTableViewCellHeights[item.templateName]!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cellActionClosure(tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! TZTableViewCell, dataArray?[indexPath.row] as AnyObject, indexPath)
    }
    
    //MARK: UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self.dataArray[indexPath.row] as! HomeTemplateItem
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCellIdentifiers[item.templateName]!, for: indexPath)
        cellConfigClosure(cell as! TZTableViewCell, dataArray?[indexPath.row] as AnyObject,indexPath)
        
        return cell;
    }

    
}
