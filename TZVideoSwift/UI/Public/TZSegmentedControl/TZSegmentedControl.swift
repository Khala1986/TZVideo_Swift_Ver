//
//  TZSegmentedControl.swift
//  TZVideoSwift
//
//  Created by 陈学明 on 2018/10/18.
//

import UIKit
import Masonry

@objc protocol TZSegmentedControlDelegate:NSObjectProtocol {
   @objc optional func didSelectItemAtIndex(segmentedControl:TZSegmentedControl, selectedIndex:Int, fromIndex:Int)
}

class TZSegmentedControlCell: UICollectionViewCell {
    var titleLabel:UILabel!
    var normalColor:UIColor!
    var highlightColor:UIColor!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel = UILabel()
        titleLabel.textAlignment = .center
        self.contentView .addSubview(titleLabel)
        titleLabel.mas_makeConstraints { (maker:MASConstraintMaker?) in
            maker?.edges.equalTo()(self)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configCell(title: String, isSelected:Bool) {
        titleLabel.text = title
        titleLabel.textColor = isSelected ? highlightColor:normalColor
        titleLabel.font = isSelected ? UIFont.boldSystemFont(ofSize: 16.0):UIFont.systemFont(ofSize: 14)
    }
    
}

class TZSegmentedControl: UIToolbar, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var currentIndex:Int = 0
    var normalColor:UIColor!
    var highlightColor:UIColor!
    var itemTitles:Array<Any>!
    var itemWidth:CGFloat!
    lazy var lineView: UIView = {
        let tempLineView = UIView()
        tempLineView.backgroundColor = UIColor.init(hex: 0xFCCA07)
        tempLineView.layer.cornerRadius = 2
        return tempLineView
    }()
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        let tempcollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        tempcollectionView.dataSource = self
        tempcollectionView.delegate = self
        tempcollectionView.showsVerticalScrollIndicator = false
        tempcollectionView.showsHorizontalScrollIndicator = false
        tempcollectionView.backgroundColor = .clear
        tempcollectionView.scrollsToTop = false
        tempcollectionView.autoresizesSubviews = false
        tempcollectionView.register(TZSegmentedControlCell.self, forCellWithReuseIdentifier:"TZSegmentedControlCell")

        return tempcollectionView
    }()
    weak var SCDelegate:TZSegmentedControlDelegate?

    
    convenience init(frame:CGRect, itemwidth:CGFloat, itemTitle:Array<Any>){
        self.init(frame: frame)
        itemTitles = itemTitle
        itemWidth = itemwidth
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setItem(itemTitleArr:Array<String>) {
        itemTitles = itemTitleArr
        collectionView.reloadData()
    }
    
    func didMoveTo(index:CGFloat) {
         self.updateLineViewIndicator(index: index)
        self.moveToPage(index: Int(index))
    }
    
    func moveToPage(index:Int) {
        currentIndex = index
        collectionView.reloadData()
        collectionView .scrollToItem(at: IndexPath(item: index, section: 0), at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
    }
    
    func updateLineViewIndicator(index:CGFloat) {
        if (index < 0 || Int(index) > itemTitles.count-1) {
            return
        }
        var oFrame = lineView.frame
        oFrame.origin.x = index * itemWidth + 10
        lineView.frame = oFrame
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TZSegmentedControlCell", for: indexPath) as! TZSegmentedControlCell
        let itemTitle = itemTitles[indexPath.item] as! String
        cell.configCell(title: itemTitle, isSelected: currentIndex == indexPath.item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.updateLineViewIndicator(index:CGFloat(indexPath.item))
        if (responds(to: #selector(SCDelegate?.didSelectItemAtIndex(segmentedControl:selectedIndex:fromIndex:)))) {
            SCDelegate?.didSelectItemAtIndex!(segmentedControl:self , selectedIndex:indexPath.item, fromIndex: self.currentIndex)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: itemWidth, height: self.bounds.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
