//
//  TZCollectionViewProxy.swift
//  TZVideoSwift
//
//  Created by 陈学明 on 2018/10/16.
//

import UIKit

class TZCollectionViewProxy: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {

    typealias TZCVConfigClosures = (TZCollectionViewCell, AnyObject, IndexPath) -> Void
    typealias TZCVActionClosures = (TZCollectionViewCell, AnyObject, IndexPath) -> Void
    var reuseIdentifier:String!
    var cellConfigClosure:TZCVConfigClosures!
    var cellActionClosure:TZCVActionClosures!
    var dataArray:Array<Any>!
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        let tempcollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        tempcollectionView.dataSource = self
        tempcollectionView.delegate = self
        tempcollectionView.showsVerticalScrollIndicator = false
        tempcollectionView.showsHorizontalScrollIndicator = false
        return tempcollectionView
    }()
    
    override init() {
        super.init()
    }
    
    convenience init (identifier: String, configClosure: @escaping TZCVConfigClosures, actionClosure: @escaping TZCVActionClosures){
        self.init()
        reuseIdentifier = identifier
        cellConfigClosure = configClosure
        cellActionClosure = actionClosure
    }
    
    //MARL: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cellConfigClosure(cell as! TZCollectionViewCell, dataArray?[indexPath.row] as AnyObject, indexPath)
        return cell;
    }
    
    //MARK: UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         cellActionClosure(collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TZCollectionViewCell, dataArray?[indexPath.row] as AnyObject, indexPath)
        
    }
    
    
    
    //MARK: UICollectionViewDelegateFlowLayout
    
    
}
