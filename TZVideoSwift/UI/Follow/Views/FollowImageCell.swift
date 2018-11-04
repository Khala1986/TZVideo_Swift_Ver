//
//  FollowImageCell.swift
//  TZVideoSwift
//
//  Created by 陈学明 on 2018/11/2.
//

import UIKit
import Masonry

class FollowImageCollectionViewCell: UICollectionViewCell {
    var imageView:UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        self.addSubview(imageView)
        imageView.mas_makeConstraints { (maker:MASConstraintMaker?) in
            maker?.edges.equalTo()(self)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class FollowImageCell: FollowBaseCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var dataArray:[String]!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var imageCVHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.register(FollowImageCollectionViewCell.self, forCellWithReuseIdentifier: "FollowImageCollectionViewCell")
    }

    func imageSize(count:Int) -> CGFloat {

        let screenWidth = UIScreen.main.bounds.width
        
        switch count {
        case 1:
            return (screenWidth - 20) / 3 * 2
    
        case 2, 4:
            return (screenWidth - 20) / 2

        default:
            return (screenWidth - 20) / 3
        }

    }
    
    func imageViewHeight(count:Int ) -> CGFloat {
        
        let screenWidth = UIScreen.main.bounds.width
        
        switch count {
        case 1, 5, 6:
            return (screenWidth - 20) / 3 * 2
        case 2:
            return (screenWidth - 20) / 2
        case 3:
            return (screenWidth - 20) / 3
        case 4, 7, 8, 9:
            return screenWidth - 20
        default:
            return screenWidth - 20
        }
    }
    
    override func configWithData(data: AnyObject) {
        super.configWithData(data: data)
        if data is FollowListItem {
            let item = data as! FollowListItem
            dataArray = item.images
            imageCVHeight.constant = imageViewHeight(count: dataArray.count)
            self.updateConstraints()
            collectionView.reloadData()
        }
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionView.collectionViewLayout.invalidateLayout()
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = imageSize(count: dataArray.count)
        return CGSize(width: size, height: size)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FollowImageCollectionViewCell", for:        indexPath) as! FollowImageCollectionViewCell
        
        cell.imageView.setImageWith(URL(string: dataArray[indexPath.item])!)
        
        return cell
        
    }
    
}
