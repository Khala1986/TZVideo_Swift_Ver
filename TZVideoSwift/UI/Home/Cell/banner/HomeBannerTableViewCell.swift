//
//  HomeBannerTableViewCell.swift
//  TZVideoSwift
//
//  Created by 陈学明 on 2018/10/22.
//

import UIKit
import TYCyclePagerView

class HomeBannerTableViewCell: TZTableViewCell, TYCyclePagerViewDelegate, TYCyclePagerViewDataSource {
    
    @IBOutlet weak var cycleView: TYCyclePagerView!
    
    fileprivate var dataArray:Array<Any>!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.cycleView.register(UINib.init(nibName:"HomeBannerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeBannerCollectionViewCell")
        self.cycleView.autoScrollInterval = 5;
        self.cycleView.delegate = self;
        self.cycleView.dataSource = self;
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func configWithData(data: AnyObject) {
        self.dataArray = (data as! HomeTemplateItem).templateData
        self.cycleView .reloadData()
    }

    func numberOfItems(in pageView: TYCyclePagerView) -> Int {
        return self.dataArray.count
    }
    
    func pagerView(_ pagerView: TYCyclePagerView, cellForItemAt index: Int) -> UICollectionViewCell {
        
        let cell = pagerView .dequeueReusableCell(withReuseIdentifier:"HomeBannerCollectionViewCell", for: index) as! HomeBannerCollectionViewCell
        cell.config(data: dataArray[index])
        return cell;
        
    }
    
    func layout(for pageView: TYCyclePagerView) -> TYCyclePagerViewLayout {
         let layout = TYCyclePagerViewLayout()
         layout.itemSize = self.frame.size
         layout.itemSpacing = 0
         return layout
    }
    
}
