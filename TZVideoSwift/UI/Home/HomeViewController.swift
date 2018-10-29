//
//  HomeViewController.swift
//  TZVideoSwift
//
//  Created by 陈学明 on 2018/10/14.
//

import UIKit
import Masonry
class HomeViewController: TZBaseViewController {
    var dataSource:HomeDataSource!
    lazy var collectionViewProxy:HomeCollectionViewProxy={
        let collectionViewProxy = HomeCollectionViewProxy(identifier: "HomeCollectionViewCell", configClosure: { (cell:TZCollectionViewCell, cellData:AnyObject, indexpath:IndexPath) in
            if cell is HomeCollectionViewCell && cellData is HomeChannelList {
                cell.contentView.sakura.backgroundColor()("Home.BackgroundColor")
                self.dataSource.getChannel(getChannel: (cellData as! HomeChannelList).channelId!) { (data: Any) in
                    (cell as! HomeCollectionViewCell).config(response:data as!HomeTemplateResponse)
                }
                
            }
            
        }, actionClosure: { (cell:TZCollectionViewCell, cellData:AnyObject, indexpath:IndexPath) in
            
        })
        return collectionViewProxy
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "首页"
        // Do any additional setup after loading the view.
        self.contentView .addSubview(self.collectionViewProxy.segmentedControl)
        collectionViewProxy.segmentedControl.mas_makeConstraints({ (maker:MASConstraintMaker?) in
            maker?.leading.trailing().top()?.equalTo()(self.contentView)
            maker?.height.equalTo()(35)
        })
        
        self.contentView.addSubview(collectionViewProxy.collectionView)
        collectionViewProxy.collectionView .mas_makeConstraints { (maker:MASConstraintMaker?) in
            maker?.top.equalTo()(collectionViewProxy.segmentedControl.mas_bottom)
        }
        
        dataSource = HomeDataSource()
        dataSource.getChannelList { (response:Any) in
            print("response \(response)")
//            response as! HomeChannelListResponse
            var nameItems = [String]()
            for list in (response as! HomeChannelListResponse).data{
                nameItems.append(list.channelName!)
            }
            collectionViewProxy.segmentedControl.setItem(itemTitleArr: nameItems)
            self.collectionViewProxy.dataArray = (response as! HomeChannelListResponse).data
            self.collectionViewProxy.collectionView.reloadData()
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
