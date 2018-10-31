//
//  TZCollectionViewProxy.swift
//  TZVideoSwift
//
//  Created by 陈学明 on 2018/10/16.
//

import UIKit

class TZCollectionViewProxy: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

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
        tempcollectionView.isPagingEnabled = true
        tempcollectionView.dataSource = self
        tempcollectionView.delegate = self
        tempcollectionView.showsVerticalScrollIndicator = false
        tempcollectionView.showsHorizontalScrollIndicator = false
        return tempcollectionView
    }()
    
     override init() {
        super.init()
    }
    
//    init (identifier: String, configClosure: @escaping TZCVConfigClosures, actionClosure: @escaping TZCVActionClosures){
//
//    }
    
     init (identifier: String, configClosure: @escaping TZCVConfigClosures, actionClosure: @escaping TZCVActionClosures){
        super.init()
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
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width, height:collectionView.bounds.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
