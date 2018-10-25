//
//  HomeBaseTemplateView.swift
//  TZVideoSwift
//
//  Created by 陈学明 on 2018/10/22.
//

import UIKit

class HomeBaseTemplateView: UIView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet fileprivate weak var imageRatioConstraint: NSLayoutConstraint!
    var imageRatio:CGFloat!
    var templateData:Any!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
        let view = Bundle.main.loadNibNamed("HomeBaseTemplateView", owner: self, options: nil)?.last 
        self.addSubview(view as! UIView)
        self.titleLabel.sakura.textColor()("App.TableViewCellTitleTextColor")
        self.subTitleLabel.sakura.textColor()("App.TableViewCellDescTextColor")
    }
    
    func setImageRatio(imageratio:CGFloat) {
        imageRatio = imageratio
        let newConstraint = NSLayoutConstraint (item: imageRatioConstraint.firstItem as Any, attribute: imageRatioConstraint.firstAttribute, relatedBy: imageRatioConstraint.relation, toItem: imageRatioConstraint.secondItem, attribute: imageRatioConstraint.secondAttribute, multiplier: imageratio, constant: imageRatioConstraint.constant)
        newConstraint.priority = imageRatioConstraint.priority
        newConstraint.shouldBeArchived = imageRatioConstraint.shouldBeArchived
        newConstraint.identifier = imageRatioConstraint.identifier;
        imageRatioConstraint.isActive = false;
        imageRatioConstraint = newConstraint;
        imageRatioConstraint.isActive = true;
        self.layoutIfNeeded()
    }

    func setupWithTemplateData(data:Any) {
        if data is HomeTemplateData{
            self.templateData = data as! HomeTemplateData
            
        }
    }
    
    func setConten(title:String, subTitle:String, imageUrl:String) {
        self.titleLabel.text = title
        self.subTitleLabel.text = subTitle
        self.imageView.setImageWith(URL(string: imageUrl)!)
    }
}
