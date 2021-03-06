//
//  HomeCollectionViewProxy.swift
//  TZVideoSwift
//
//  Created by 陈学明 on 2018/10/22.
//

import UIKit

class HomeCollectionViewProxy: TZCollectionViewProxy, TZSegmentedControlDelegate{

    lazy var segmentedControl:TZSegmentedControl = {
        let segmentedControl = TZSegmentedControl(frame: CGRect.zero, itemwidth: 80, itemTitle:[String]())
        segmentedControl.sakura.barTintColor()("App.NavigationBarBarTintColor");
        segmentedControl.sakura.tintColor()("App.NavigationBarTintColor");
        segmentedControl.normalColor = UIColor.white
        segmentedControl.highlightColor = UIColor(hex: 0xFCCA07)
        segmentedControl.scDelegate = self
        return segmentedControl
    }()
    
     override init (identifier: String, configClosure: @escaping TZCVConfigClosures, actionClosure: @escaping TZCVActionClosures){
        super.init(identifier: identifier, configClosure: configClosure, actionClosure:actionClosure)
        self.collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: identifier)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scrollView.contentOffset.x \(scrollView.contentOffset.x)")
        let width = scrollView.frame.size.width
        let index = scrollView.contentOffset.x / width
        segmentedControl.didMoveTo(index: index)
        
    }

    
    func didSelectItemAtIndex(segmentedControl: TZSegmentedControl, selectedIndex: Int, fromIndex: Int) {
        self.collectionView.scrollToItem(at: IndexPath(item: selectedIndex, section: 0), at: .centeredHorizontally, animated: true)
    }
}
